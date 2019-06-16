package com.ssm.common.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.context.support.XmlWebApplicationContext;

import com.blog.model.User;
import com.blog.model.util.PassIpUtil;
import com.blog.service.IRedisService;
import com.blog.service.IUserService;
import com.ssm.common.rbac.model.Resources;
import com.ssm.common.rbac.model.Role;
import com.ssm.common.rbac.model.util.ManagerUtil;
import com.ssm.common.rbac.service.IManagerService;
import com.ssm.common.utils.NetworkUtil;
import com.ssm.common.web.ResultEnum;

public class PassIpFilter implements Filter {
	private static final Logger LOGGER = LogManager.getLogger(PassIpFilter.class);

	public static boolean googleAuthEnable = false;

	/**
	 * 不做googleKey绑定验证的地址,全匹配
	 */
	private List<String> unGoogleAuthUrls = new ArrayList<String>();
	/**
	 * 不做权限验证,登录验证的接口,前部匹配
	 */
	private String[] resources = {"/build","/css","/dist","/js","/plugins",
			"/error","/proxybill/logout","/index.jsp","/download","/favicon.ico"};

	private IUserService uService;
	private IRedisService redisService;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		unGoogleAuthUrls.add("/proxybill/googleKey");
		unGoogleAuthUrls.add("/proxybill/setGoogleKey");

		ServletContext sc = filterConfig.getServletContext();
		XmlWebApplicationContext cxt = (XmlWebApplicationContext)WebApplicationContextUtils.getWebApplicationContext(sc);

		uService = (IUserService) cxt.getBean("userServiceImpl");
		redisService = (IRedisService) cxt.getBean("redisServiceImpl");

		ManagerUtil.setService((IManagerService) cxt.getBean("managerServiceImpl"));
		ManagerUtil.initManager();

		filterConfig.getServletContext().setAttribute("projectName", cxt.getBean("projectName"));
		filterConfig.getServletContext().setAttribute("projectNameDESC", cxt.getBean("projectNameDESC"));
		filterConfig.getServletContext().setAttribute("rootUrl", filterConfig.getServletContext().getContextPath());
		
		System.out.println("initialization PassIpFilter ok");
		LOGGER.info("initialization PassIpFilter ok");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		//为去除项目名和查询参数之后的内容
		String currentURL = httpRequest.getServletPath();
		String userAgent;
		try{
			userAgent = httpRequest.getHeader("user-agent");
			if(userAgent==null){
				userAgent = "";
			}
		}catch (Exception e) {
			userAgent = "";
		}

		boolean isRes = false;
		for(String url:resources){
			if(currentURL.startsWith(url)){
				isRes = true;
				break;
			}
		}
		
		//先判断是否资源
		if(!isRes){
			String ip = NetworkUtil.getIpAddress(httpRequest);
			httpRequest.setAttribute("ip", ip);
			String tempUA = userAgent.toLowerCase();
			boolean isMobile = tempUA.indexOf("android") != -1 || tempUA.indexOf("iphone") != -1 || tempUA.indexOf("ipad") != -1;
			httpRequest.setAttribute("isMobile", isMobile);

			//false 表示白名单 true 非白名单
			boolean isNotWhiteIp = PassIpUtil.isNotWhiteIp(ip);
			//白名单不做google登录验证
			httpRequest.setAttribute("isNotWhiteIp", isNotWhiteIp);
			httpRequest.setAttribute("googleAuthEnable", googleAuthEnable);
			//是否ajax请求
			boolean isAjax = "XMLHttpRequest".equalsIgnoreCase(httpRequest.getHeader("x-requested-with"));
			httpRequest.setAttribute("isAjax", isAjax);
			//获取当前资源
			Resources res = ManagerUtil.getResourcesByPath(currentURL);

			if(res==null){
				LOGGER.info("[拦截请求·资源不存在:"+ip+"]"+currentURL);
				if(isAjax){
					httpResponse.getWriter().println(new ResultEnum<Object>(ResultEnum.LOGOUT,"请求资源不存在").toString());
				}else{
					httpRequest.getRequestDispatcher("/error/404").forward(httpRequest, httpResponse);
				}
				return;
			}else if(currentURL.startsWith("/druid")){
				res = ManagerUtil.getResourcesByPath("/druid");
			}

			//登录检查
			if(res.isLogincheck()){
				User user = (User) httpRequest.getSession().getAttribute("logUser");
				String ssid = "";
				//已经获取到的cookie数量
				int checkCookieNum = 0;
				logUser:{
					checkCookieNum = 0;
					if(user == null || StringUtils.isBlank(user.getUsername())){
						Cookie[] cookies = httpRequest.getCookies();
						if(cookies!=null){
							for(Cookie item:cookies){
								if(User.COOKIE_KEY_SSID.equals(item.getName())){
									ssid = item.getValue();
									checkCookieNum++;
								}else if(User.COOKIE_KEY_UID.equals(item.getName())){
									String value = item.getValue().trim();
									if(StringUtils.isNotBlank(value) && NumberUtils.isNumber(value)){
										user = new User();
										user.setUid(Integer.parseInt(value));

										user = uService.selectByModel(user);
										if(user!=null){
											user.setPassword(null);
											checkCookieNum++;
										}else{
											break;
										}
									}
								}
								//如果已获取所有目标cookie结束循环
								if(checkCookieNum == 2){
									break;
								}
							}
						}

						if(user!=null && StringUtils.isNotBlank(user.getUsername())){
							httpRequest.getSession().setAttribute("logUser", user);
							//返回上层重新判断
							break logUser;
						}else{
							LOGGER.info("[未登录:"+ip+"]"+currentURL);
							if(isAjax){  
								httpResponse.getWriter().println(new ResultEnum<Object>(ResultEnum.LOGOUT).toString());
							}else{
								httpRequest.getRequestDispatcher("/proxybill/index").forward(httpRequest, httpResponse);
							}
							return;
						}
					}else{
						Cookie[] cookies = httpRequest.getCookies();
						if(cookies!=null){
							for(Cookie item:cookies){
								if(User.COOKIE_KEY_SSID.equals(item.getName())){
									ssid = item.getValue();
									checkCookieNum++;
								}
								//如果已获取所有目标cookie结束循环
								if(checkCookieNum == 1){
									break;
								}
							}
						}
					}
				}/* logUser结束 */

				//记录登录IP
				user.setLogip(ip);
				Role logRole = ManagerUtil.getRoleByID(user.getRole());

				//管理员登录验证,是否为白名单ip登录
				if(logRole.isAdmin()){
					//是否手机登录
					if (isMobile) {
						LOGGER.info("[拦截移动端请求:"+ip+"]"+currentURL);
						httpRequest.getRequestDispatcher("/error/404").forward(httpRequest, httpResponse);
						return;
					}
					LOGGER.info(ip+":"+currentURL);
					if(isNotWhiteIp){
						LOGGER.info("[登录拦截·白名单验证失败:"+ip+"]"+currentURL);
						if(isAjax){
							httpResponse.getWriter().println(new ResultEnum<Object>(ResultEnum.LOGOUT,"请求页面不存在,即将退出登录").toString());
						}else{
							httpRequest.getRequestDispatcher("/error/404").forward(httpRequest, httpResponse);
						}
						return;
					}
				}

				//角色检查
				if(res.isRolecheck()){
					if(ManagerUtil.hasResourcesSet(currentURL, user.getRole())){
						LOGGER.info("[权限验证通过:"+ip+"]"+currentURL+" "+user);
					}else{
						LOGGER.info("[权限拦截:"+ip+"]"+currentURL+" "+user);
						if(isAjax){
							httpResponse.getWriter().println(new ResultEnum<Object>(ResultEnum.LOGOUT,"请求页面不存在,即将退出登录").toString());
						}else{
							httpRequest.getRequestDispatcher("/error/404").forward(httpRequest, httpResponse);
						}
						return;
					}
				}

				//判断是否同一个登录用户 userAgent,ssid
				String redisUA = redisService.get(IRedisService.LOGIN_USERAGENT+user.getUid());
				String redisSSID = redisService.get(IRedisService.LOGIN_SSID+user.getUid());

				if(/*!userAgent.equals(redisUA) || 谷歌内核浏览器版本号会变动,暂时取消ua验证*/
						!ssid.equals(redisSSID)){
					LOGGER.info("[登录拦截]redisUA:"+redisUA+", redisSSID:"+redisSSID+", "+ssid+", "+ssid.equals(redisSSID));
					String msg;
					if(StringUtils.isBlank(redisUA) || StringUtils.isBlank(redisSSID) || StringUtils.isBlank(ssid)){
						LOGGER.info("[登录拦截·登录过期:"+ip+"]"+currentURL);
						msg = "登录过期,请重新登录.";
					}else{
						LOGGER.info("[登录拦截·登陆设备异常:"+ip+"]"+currentURL);
						msg = "您的账号已在其他地方登录,如果非本人操作,请"+(user.getGoogleKey()==null&&isNotWhiteIp?"绑定google验证器,并":"")+"修改密码";
					}
					//清除redis缓存
					redisService.delete(IRedisService.LOGIN_SSID+user.getUid());
					redisService.delete(IRedisService.LOGIN_USERAGENT+user.getUid());

					//清除session
					httpRequest.getSession().invalidate();

					//清除cookie
					Cookie cookie_user = new Cookie(User.COOKIE_KEY_UID, "");
					cookie_user.setMaxAge(0);
					cookie_user.setPath("/");
					httpResponse.addCookie(cookie_user);

					Cookie cookie_session = new Cookie(User.COOKIE_KEY_SSID, "");
					cookie_session.setMaxAge(0);
					cookie_session.setPath("/");
					httpResponse.addCookie(cookie_session);

					if(isAjax){
						httpResponse.getWriter().println(new ResultEnum<Object>(ResultEnum.LOGOUT,msg).toString());
					}else{
						httpRequest.setAttribute("logMSG", msg);
						httpRequest.getRequestDispatcher("/proxybill/index").forward(httpRequest, httpResponse);
					}
					return;
				}

				httpRequest.setAttribute("logUser", user);//用户信息
				httpRequest.setAttribute("logRole", logRole);//用于判断是否管理员

				//非白名单ip,是否开启登录googleKey验证,判断是否绑定google身份验证器 ,是否为例外地址
				if(isNotWhiteIp && googleAuthEnable && StringUtils.isBlank(user.getGoogleKey()) && !unGoogleAuthUrls.contains(currentURL)){
					LOGGER.info("[访问拦截·未绑定google身份验证器:"+ip+"]"+currentURL);
					if(isAjax){
						httpResponse.getWriter().println(new ResultEnum<Object>(ResultEnum.LOGOUT,"请先前往[个人中心]绑定Google身份验证器").toString());
					}else{
						httpRequest.getRequestDispatcher("/proxybill/profile?tab=google").forward(httpRequest, httpResponse);
					}
					return;
				}

				LOGGER.info("[登录通过:"+ip+"]"+currentURL+" "+user);
				if(!isAjax){
					httpRequest.setAttribute("rootMenu", ManagerUtil.getTreeByRoleId(user.getRole()));
					httpRequest.setAttribute("nowTime", System.currentTimeMillis());
				}
			}/* 登录验证完成 */

			//ip白名单检查
			if(res.isIpcheck()){
				if(isNotWhiteIp){
					LOGGER.info("[请求拦截·白名单验证失败:"+ip+"]"+currentURL);
					if(isAjax){
						httpResponse.getWriter().println(new ResultEnum<Object>(ResultEnum.LOGOUT,"请求页面不存在,即将退出登录").toString());
					}else{
						httpRequest.getRequestDispatcher("/error/404").forward(httpRequest, httpResponse);
					}
					return;
				}
			}

		}/* 资源验证完成 */

		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {

	}

}
