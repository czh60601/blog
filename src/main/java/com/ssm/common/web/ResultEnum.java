package com.ssm.common.web;

import lombok.Getter;
import net.sf.json.JSONObject;

public class ResultEnum<T extends Object> {
	/**
	 * 登录过期
	 */
	public static final int LOGOUT = -999;
	/**
	 * 恢复备份-设置到ID
	 */
	public static final int REBACKUP = -777;
	/**
	 * 默认值
	 */
	public static final int DEFAULT = -101;
	/**
	 * 错误输入
	 */
	public static final int ERROR_INPUT = -5;
	/**
	 * 输入为空
	 */
	public static final int EMPTY_INPUT = -4;
	/**
	 * 与原数据相同
	 */
	public static final int SAME = -3;
	/**
	 * 已存在
	 */
	public static final int EXIST = -2;
	/**
	 * 不存在
	 */
	public static final int UNEXIST = -1;
	/**
	 * 失败
	 */
	public static final int FAILED = 0;
	/**
	 * 成功
	 */
	public static final int SUCCESS = 1;

	/**
	 * 查询
	 */
	public static final String TYPE_SEARCH = "search";
	/**
	 * 新增
	 */
	public static final String TYPE_ADD = "add";
	/**
	 * 获取
	 */
	public static final String TYPE_INFO = "info";
	/**
	 * 删除
	 */
	public static final String TYPE_DELETE = "delete";
	/**
	 * 修改
	 */
	public static final String TYPE_UPDATE = "update";
	/**
	 * 恢复
	 */
	public static final String TYPE_REBACK = "reback";

	@Getter
	private int code;
	@Getter
	private T data;
	@Getter
	private String msg;
	private JSONObject json;
	public ResultEnum(){
		json = new JSONObject();
		code = DEFAULT;
		json.put("code", DEFAULT);
	}
	public ResultEnum(int code) {
		json = new JSONObject();
		setCode(code);
	}
	public ResultEnum(int code, String msg) {
		json = new JSONObject();
		setCode(code);
		setMsg(msg);
	}
	public ResultEnum(int code, T data) {
		json = new JSONObject();
		setCode(code);
		setData(data);
	}
	public ResultEnum(int code, T data, String msg) {
		json = new JSONObject();
		setCode(code);
		setMsg(msg);
		setData(data);
	}
	public void setCode(int code){
		this.code = code;
		json.put("code", code);
	}
	public void setMsg(String msg){
		this.msg = msg;
		json.put("msg", msg);
	}
	public void setData(T data){
		this.data = data;
		json.put("data", data);
	}
	@Override
	public String toString(){
		return json.toString();
	}
}
