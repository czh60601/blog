package com.blog.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blog.model.User;
import com.blog.model.query.UserQuery;
import com.blog.service.IUserService;
import com.ssm.common.rbac.model.Role;
import com.ssm.common.rbac.service.IManagerService;
import com.ssm.common.web.ResultEnum;

@Controller
@RequestMapping("/background/user")
public class UserController{

	@Autowired
	private IUserService userService;
	@Autowired
	private IManagerService rbacService;

	@RequestMapping("/sys/list")
	public String accountList(HttpServletRequest request,Model model,UserQuery query){
		if(ResultEnum.TYPE_DELETE.equals(query.getQueryType())){
			int row = userService.deleteByQuery(query);
			model.addAttribute("delRow", row);
		}

		User logUser = (User) request.getAttribute("logUser");
		List<Role> roleList;
		if(logUser.hasItem("background.sys_user","primuid")){
			roleList = rbacService.getChildren(logUser.getRole(),null);
		}else{
			roleList = rbacService.getChildren(logUser.getRole(),true);
		}
		query.setLogUser(logUser);

		query = (UserQuery) userService.selectByQuery(query);

		model.addAttribute("query", query);
		model.addAttribute("roleList", roleList);
		model.addAttribute("title", "sys_user");
		model.addAttribute("menu", "background");
		return "/admin/user_list";
	}

	@RequestMapping("/sys/unuse")
	public String accountUnUseList(HttpServletRequest request,Model model,UserQuery query){
		if(ResultEnum.TYPE_DELETE.equals(query.getQueryType())){
			int row = userService.removeByQuery(query);
			model.addAttribute("delRow", row);
		}

		User logUser = (User) request.getAttribute("logUser");
		List<Role> roleList;
		if(logUser.hasItem("background.sys_user","primuid")){
			roleList = rbacService.getChildren(logUser.getRole(),null);
		}else{
			roleList = rbacService.getChildren(logUser.getRole(),true);
		}
		query.setLogUser(logUser);
		query = (UserQuery) userService.selectUnuseByQuery(query);

		model.addAttribute("query", query);
		model.addAttribute("roleList", roleList);
		model.addAttribute("title", "sys_unuse");
		model.addAttribute("menu", "background");
		return "/admin/user_unuse";
	}

	@RequestMapping("/edit")
	@ResponseBody
	public ResultEnum<?> accountEdit(User user,String queryType) {
		int ret = ResultEnum.DEFAULT;
		if(ResultEnum.TYPE_INFO.equalsIgnoreCase(queryType)){
			user = userService.selectByModel(user);
			if(user!=null){
				ret = ResultEnum.SUCCESS;
			}else{
				ret = ResultEnum.UNEXIST;
			}
		}

		if(ResultEnum.TYPE_UPDATE.equalsIgnoreCase(queryType)){
			ret = userService.updateByModel(user);
			user.setPassword(null);
		}

		if(ResultEnum.TYPE_ADD.equals(queryType)){
			if(StringUtils.isBlank(user.getUsername())){
				ret = ResultEnum.EMPTY_INPUT;
			}else{
				ret = userService.add(user);
			}
		}
		return new ResultEnum<User>(ret,user);
	}

	@RequestMapping("/initGoogleKey")
	@ResponseBody
	public ResultEnum<Object> initGoogleKey(HttpServletRequest request,Integer uid){
		ResultEnum<Object> result = new ResultEnum<Object>();
		result.setCode(userService.initGoogleKey(uid));
		return result;
	}
}
