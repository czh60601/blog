package com.blog.model.query;

import lombok.Data;

import com.blog.model.LoginLog;
import com.ssm.common.model.query.PageQuery;

@Data
public class LoginLogQuery extends PageQuery<LoginLog> {
	private String username;
	private String nickname;
	private String sdate;
	private String edate;
	private int logtype;
}