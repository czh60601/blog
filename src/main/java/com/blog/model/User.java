package com.blog.model;

import java.util.ArrayList;
import java.util.List;

import lombok.AccessLevel;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import org.apache.commons.lang3.StringUtils;

import com.ssm.common.rbac.model.UserObject;
import com.ssm.common.utils.GoogleAuthenticator;

@Data
public class User extends UserObject{
	public static final String COOKIE_KEY_UID = "login_key_keep";
	public static final String COOKIE_KEY_SSID = "login_key_ssid";
	/*
	 * 要使用的角色放到这里,例如:某些页面需要把代理筛选出来
	 * 1006	账号代理
	 * 1007	充值代理
	 */
	public static final int ROLE_PROXY = 1006;
	public static final int ROLE_PROXY_RECHARGE = 1007;

	/**
	 * 已注销注销用户,手动从数据库删除
	 */
	public static final int STATE_DELETED = 0;
	/**
	 * 正常激活用户
	 */
	public static final int STATE_ACTIVE = 1;
	/**
	 * 用户已被禁用
	 */
	public static final int STATE_BANNED = 2;

	private String username;

	private String password;

	private Integer status;

	private String nickname;

	private String info;

	private String logip;

	/**
	 * google身份验证器密匙
	 */
	private String googleKey;

	/**
	 * 0:表示主账号
	 * 针对充值代理·主账号UID,子账号没有额度
	 */
	private int primuid = -1;

	private String primname;
	
	private int lvup;

	public String getStatusStr(){
		if(status!=null){
			switch(status){
			case STATE_DELETED:return "已注销";
			case STATE_ACTIVE:return "使用中";
			case STATE_BANNED:return "已禁用";
			default:return "状态异常";
			}
		}else{
			return "";
		}
	}

	/**
	 * google动态密码验证
	 * @param code
	 * @return
	 */
	public boolean googleAuth(Long code){
		GoogleAuthenticator ga = new GoogleAuthenticator();
		ga.setWindowSize(3);//TODO 动态设置偏移时间
		return ga.check_code(googleKey, code, System.currentTimeMillis());
	}

	@Override
	public String toString(){
		return nickname+"["+uid+","+username+","+getStatusStr()+"]";
	}
}