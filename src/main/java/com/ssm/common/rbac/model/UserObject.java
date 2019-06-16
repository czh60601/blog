package com.ssm.common.rbac.model;

import lombok.Data;

import com.ssm.common.rbac.model.util.ManagerUtil;

@Data
public class UserObject {
	protected Integer uid;
	protected Integer role;
	protected String roleName;

	public boolean hasItem(String key,String value){
		return ManagerUtil.hasResourcesSet(key, value, role);
	}
}