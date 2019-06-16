package com.ssm.common.rbac.model;

import lombok.Data;

@Data
public class Resources {
	/**
	 * 接口类请求地址
	 */
	public static final int TYPE_URL = 1;
	/**
	 * 资源展示类视图
	 */
	public static final int TYPE_VIEW = 2;
	/**
	 * 无页面菜单
	 */
	public static final int TYPE_MENU = 3;
	/**
	 * 页面菜单
	 */
	public static final int TYPE_PAGE = 4;
	/**
	 * 操作类:包含后台接口和前端展示
	 */
	public static final int TYPE_ACTION = 5;

	private Integer id;
	private String resname;
	private String key;
	private String value;
	private String path;
	/**
	 * 图标
	 */
	private String ico;
	/**
	 * 从属上级资源,菜单或者页面
	 */
	private int flow;
	/**
	 * 从属上级的名称
	 */
	private String flowname;
	private String flowtree;
	private int type;
	
	private boolean ipcheck;
	private boolean rolecheck;
	private boolean logincheck;

	public String getTypeStr(){
		switch (type) {
		case Resources.TYPE_URL:
			return "接口";
		case Resources.TYPE_VIEW:
			return "视图";
		case Resources.TYPE_MENU:
			return "菜单";
		case Resources.TYPE_PAGE:
			return "页面";
		case Resources.TYPE_ACTION:
			return "操作";
		default:
			return null;
		}
	}
}
