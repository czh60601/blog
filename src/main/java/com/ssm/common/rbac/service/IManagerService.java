package com.ssm.common.rbac.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.common.rbac.model.Resources;
import com.ssm.common.rbac.model.ResourcesTree;
import com.ssm.common.rbac.model.Role;
import com.ssm.common.rbac.model.query.ResourcesQuery;

public interface IManagerService {
	
	public List<Role> selectRole();
	
	public Role selectRoleByID(int id);
	
	/**
	 * 获取当前角色及其所子自角色
	 * @param id
	 * @return
	 */
	public List<Role> getChildren(int id,Boolean admin);
	
	public int addRole(Role role,Role logRole);

	public int updateRole(Role role,Role logRole);
	
	/**
	 * 返回所有资源
	 * @return 不包含从属名称
	 */
	public List<Resources> selectResources();
	
	/**
	 * 返回满足条件的所有资源
	 * @param query
	 * @return 含从属名称
	 */
	public ResourcesQuery selectResourcesByQuery(ResourcesQuery query);
	
	public int addResources(Resources res);
	
	public int updateResources(Resources res);

	/**
	 * 检查 key.value.path是否存在
	 * @param res
	 * @return
	 */
	public int existResources(Resources res);

	public Resources selectResourcesByID(int id);

	ResourcesTree getResTree(Role role);

	public int fkSet(Integer roleId, String resTree);
}
