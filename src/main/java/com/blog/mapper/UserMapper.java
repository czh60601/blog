package com.blog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blog.model.LoginLog;
import com.blog.model.User;
import com.blog.model.query.LoginLogQuery;
import com.blog.model.query.UserQuery;
import com.ssm.common.mapper.BaseMapper;

public interface UserMapper extends BaseMapper<User>{

	int editPassword(@Param(value = "oldpwd") String oldpwd, @Param(value = "newpwd") String newpwd, @Param(value = "uid") Integer uid);

	int checkExist(User t);
	
	int initGoogleKey(@Param(value = "uid") Integer uid);

	int logLogin(LoginLog log);
	
	List<User> selectUnuseByQuery(UserQuery query);

	int countUnuseByQuery(UserQuery query);
	
	int removeByQuery(UserQuery query);

	List<LoginLog> selectLoginLogByQuery(LoginLogQuery query);

	int counttLoginLogByQuery(LoginLogQuery query);
}