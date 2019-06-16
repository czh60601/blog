package com.blog.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.model.query.LoginLogQuery;
import com.blog.service.IUserService;

@Controller
@RequestMapping("/background")
public class AdminController {

	@Autowired
	private IUserService userService;

	@RequestMapping("/log/login")
	public String logLogin(HttpServletRequest request,Model model,LoginLogQuery query){
		userService.selectLoginLogByQuery(query);
		
		model.addAttribute("query", query);
		model.addAttribute("menu", "log");
		model.addAttribute("title", "loglogin");
		return "/admin/loginlog";
	}
}
