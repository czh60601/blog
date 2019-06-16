package com.blog.service;

import com.blog.model.LoginLog;
import com.blog.model.User;
import com.blog.model.query.LoginLogQuery;
import com.blog.model.query.UserQuery;
import com.ssm.common.service.IBaseService;

public interface IUserService extends IBaseService<User>{

	int editPassword(String oldpwd, String newpwd, Integer uid);
	
	int initGoogleKey(Integer uid);
	
	int logLogin(LoginLog log);
	
	LoginLogQuery selectLoginLogByQuery(LoginLogQuery query);

	UserQuery selectUnuseByQuery(UserQuery query);
	
	int removeByQuery(UserQuery query);
}
