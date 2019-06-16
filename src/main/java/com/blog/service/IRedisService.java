package com.blog.service;

import java.util.List;
import java.util.concurrent.TimeUnit;

public interface IRedisService {
	public static final String LOGIN_SSID = "login_ssid_";
	public static final String LOGIN_USERAGENT = "login_ua_";
	
	//增
    public void set(String key,String value);
	//增
    public void set(String key,String value,long passtime,TimeUnit timeunit);
    //删
    public void delete(String key);
    public void delete(List<String> listKeys);
    //查
    public String get(String key);
}
