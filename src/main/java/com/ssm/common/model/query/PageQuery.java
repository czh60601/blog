package com.ssm.common.model.query;

import java.util.List;

import lombok.Data;

import com.ssm.common.rbac.model.Role;
import com.ssm.common.rbac.model.UserObject;
import com.ssm.common.rbac.model.util.ManagerUtil;

@Data
public class PageQuery<T> {

	private int limit = 50;
	private int page = 1;
	private int counts = 0;
	private int totalPages = 0;
	private List<T> content;

	/**
	 * 登录用户角色
	 */
	private UserObject logUser;
	private Role logRole;

	public int getStart(){
		return (page>1?page-1:0)*limit;
	}

	/**
	 * 为空返回false;
	 * @return
	 */
	public boolean getEmpty(){
		if(content==null || content.isEmpty()){
			return true;
		}
		return false;
	}

	public void setCounts(int counts){
		this.counts = counts;
		if(counts>0){
			this.totalPages = counts%limit!=0?(counts/limit)+1:counts/limit;
		}else{
			totalPages = 0;
		}
	}

	public void setLogUser(UserObject logUser){
		this.logUser = logUser;
		if(logUser!=null){
			this.logRole = ManagerUtil.getRoleByID(logUser.getRole());
		}
	}

	public Integer getLogRole(){
		return logRole!=null?logRole.getId():null;
	}

	public Integer getLogRoleParent(){
		return logRole!=null?logRole.getParent():null;
	}
}
