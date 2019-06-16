package com.blog.web.controller;

import java.util.concurrent.TimeUnit;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blog.model.LoginLog;
import com.blog.model.User;
import com.blog.service.IRedisService;
import com.blog.service.IUserService;
import com.ssm.common.filter.PassIpFilter;
import com.ssm.common.utils.DateUtils;
import com.ssm.common.utils.GoogleAuthenticator;
import com.ssm.common.web.ResultEnum;

@Controller
@RequestMapping("/proxybill")
public class IndexController{
	private static final Logger LOGGER = LogManager.getLogger(IndexController.class);

	@Autowired
	private IUserService userService;
	@Autowired
	private IRedisService redisService;

	@RequestMapping(method=RequestMethod.POST,value="login")
	@ResponseBody
	public ResultEnum<Object> login(User user,HttpServletResponse response,HttpSession session,HttpServletRequest request,Long googleKey){
		ResultEnum<Object> result = new ResultEnum<Object>();

		LoginLog log = new LoginLog();
		log.setLogip(request.getAttribute("ip").toString());
		log.setLogtime(DateUtils.getNowFullDate());
		log.setUsername(user.getUsername());
		log.setPassword(user.getPassword());
		String host = request.getHeader("Host");
		if(StringUtils.isBlank(host)){
			StringBuffer url = request.getRequestURL();
			host = url.delete(url.length() - request.getRequestURI().length(), url.length()).append("/").toString();
		}
		log.setLoginhost(host);

		if(StringUtils.isBlank(user.getUsername()) || StringUtils.isBlank(user.getPassword())){
			result.setCode(ResultEnum.EMPTY_INPUT);
			result.setMsg("用户名或密码不能为空");
		}
		user = userService.selectByModel(user);

		result.setCode(ResultEnum.ERROR_INPUT);
		if(user != null){
			if(user.getStatus() == User.STATE_ACTIVE){
				//是否为白名单IP
				if((Boolean) request.getAttribute("isNotWhiteIp") && PassIpFilter.googleAuthEnable){
					//是否绑定google验证器
					if(StringUtils.isNotBlank(user.getGoogleKey())){
						if(googleKey==null){
							result.setMsg("请输入验证码");
						}else{
							if(!user.googleAuth(googleKey)){
								result.setMsg("验证码错误");
							}else{
								result.setCode(ResultEnum.SUCCESS);
							}
						}
					}else{
						result.setCode(ResultEnum.SUCCESS);
					}
				}else{
					result.setCode(ResultEnum.SUCCESS);
				}

				//验证是否通过
				if(result.getCode()==ResultEnum.SUCCESS){
					user.setPassword(null);
					session.setAttribute("logUser", user);
					try {
						Cookie cookie_user = new Cookie(User.COOKIE_KEY_UID, user.getUid().toString());
						cookie_user.setMaxAge(3600*24*7);
						cookie_user.setPath("/");
						response.addCookie(cookie_user);

						Cookie cookie_session = new Cookie(User.COOKIE_KEY_SSID, session.getId());
						cookie_session.setMaxAge(3600*24*7);
						cookie_session.setPath("/");
						response.addCookie(cookie_session);

						//添加redis缓存，保留7天
						redisService.set(IRedisService.LOGIN_SSID+user.getUid(), session.getId(),7,TimeUnit.DAYS);
						redisService.set(IRedisService.LOGIN_USERAGENT+user.getUid(), request.getHeader("User-Agent"),7,TimeUnit.DAYS);

						result.setCode(ResultEnum.SUCCESS);
						result.setMsg("登录成功");
					} catch (Exception e) {
						LOGGER.error("登录-生成cookie出错", e);
						result.setCode(ResultEnum.FAILED);
						result.setMsg("登录异常,请稍后尝试");
					}
				}
			}else{
				result.setMsg("账户"+user.getStatusStr()+",请联系管理员");
			}
			log.setUid(user.getUid());
		}else{
			result.setMsg("用户名或密码错误");
		}
		log.setLogtype(result.getCode());
		log.setMsg(result.getMsg());

		try{
			userService.logLogin(log);
		}catch (Exception e) {
			LOGGER.error("记录登录请求失败",e);
		}

		return result;
	}

	@RequestMapping("/index")
	public String main(Model model,HttpSession session){
		User user = (User) session.getAttribute("logUser");

		if(user!=null){
			return "/contentTemper";
		}else{
			return "/login";
		}
	}


	@RequestMapping("/logout")
	public String logout(HttpServletRequest request,HttpServletResponse response){
		User logUser = (User) request.getSession().getAttribute("logUser");

		if(logUser != null){
			//清除redis缓存
			redisService.delete(IRedisService.LOGIN_SSID+logUser.getUid());
			redisService.delete(IRedisService.LOGIN_USERAGENT+logUser.getUid());
		}
		//清除session
		request.getSession().invalidate();

		//清除cookie
		Cookie cookie_user = new Cookie(User.COOKIE_KEY_UID, "");
		cookie_user.setMaxAge(0);
		cookie_user.setPath("/");
		response.addCookie(cookie_user);

		Cookie cookie_session = new Cookie(User.COOKIE_KEY_SSID, "");
		cookie_session.setMaxAge(0);
		cookie_session.setPath("/");
		response.addCookie(cookie_session);

		return "redirect:/proxybill/index";
	}

	@RequestMapping("/profile")
	public String profile(Model model,User user,HttpServletRequest request,@RequestParam(value="tab",defaultValue="pwd")String tab){
		User logUser = (User) request.getAttribute("logUser");

		User tempUser = userService.selectByModel(logUser);
		if(tempUser!=null && tempUser.getStatus() == User.STATE_ACTIVE){
			logUser.setStatus(tempUser.getStatus());
			logUser.setRole(tempUser.getRole());
		}else{
			return "redirect:/proxybill/logout";
		}

		if("post".equalsIgnoreCase(request.getMethod())){
			int ret = ResultEnum.DEFAULT;
			if("pwdEdit".equals(request.getParameter("queryType"))){
				String oldpwd = request.getParameter("oldpwd");
				String newpwd = request.getParameter("newpwd");
				String confirmpwd = request.getParameter("confirmpwd");
				if(StringUtils.isBlank(oldpwd) || StringUtils.isBlank(newpwd) || StringUtils.isBlank(confirmpwd)){
					ret = ResultEnum.EMPTY_INPUT;
				}else{
					if(!confirmpwd.equals(newpwd)){
						ret = ResultEnum.ERROR_INPUT;
					}else{
						ret = userService.editPassword(oldpwd,newpwd,logUser.getUid());
					}
				}
			}
			model.addAttribute("ret", ret);
		}

		model.addAttribute("tab", tab);
		model.addAttribute("menu", "index");
		model.addAttribute("title", "profile");
		return "/profile";
	}

	@RequestMapping("/googleKey")
	@ResponseBody
	public ResultEnum<String> getGoogleKey(HttpServletRequest request){
		User logUser = (User) request.getAttribute("logUser");
		ResultEnum<String> result = new ResultEnum<String>();
		try{
			String secret = GoogleAuthenticator.generateSecretKey();
			//把这个qrcode生成二维码，用google身份验证器扫描二维码就能添加成功
			String qrcode = GoogleAuthenticator.getQRBarcode(logUser.getUsername(), secret);
			result.setCode(ResultEnum.SUCCESS);
			result.setData(secret);
			result.setMsg(qrcode);
			LOGGER.info("qrcode : " + qrcode+", key : " + secret);
		}catch (Exception e) {
			LOGGER.error("生成googleKey密匙失败",e);
			result.setCode(ResultEnum.FAILED);
		}
		return result;
	}

	/**
	 * 绑定google密匙
	 * @param request
	 * @param googleCode
	 * @param googleKey
	 * @return
	 */
	@RequestMapping("/setGoogleKey")
	@ResponseBody
	public ResultEnum<String> setGoogleKey(HttpServletRequest request,Long googleCode,String googleKey){
		User logUser = (User) request.getAttribute("logUser");
		ResultEnum<String> result = new ResultEnum<String>();
		if(googleCode!=null && googleKey!=null){
			logUser.setGoogleKey(googleKey);
			if(logUser.googleAuth(googleCode)){
				int ret = userService.updateByModel(logUser);
				if(ret>0){
					result.setCode(ResultEnum.SUCCESS);
					result.setMsg("绑定成功");
				}else{
					logUser.setGoogleKey(null);
					result.setCode(ResultEnum.FAILED);
					result.setMsg("绑定失败,请重试");
				}
			}else{
				logUser.setGoogleKey(null);
				result.setCode(ResultEnum.ERROR_INPUT);
				result.setMsg("验证码错误,请重新输入");
			}
		}else{
			result.setCode(ResultEnum.EMPTY_INPUT);
			result.setMsg("请输入验证码");
		}
		return result;
	}
}
