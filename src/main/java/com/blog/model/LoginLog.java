package com.blog.model;

import lombok.Data;

@Data
public class LoginLog {
	private int id;
	private int uid;
	private String username;
	private String nickname;
	private String password;
	private String logip;
	private String logtime;
	private int logtype;
	private String msg;
	private String loginhost;
}
