package com.ssm.common.rbac.model.query;

import lombok.Data;

import com.ssm.common.model.query.PageQuery;
import com.ssm.common.rbac.model.Role;

@Data
public class RoleQuery extends PageQuery<Role> {
	private String rolename;
}
