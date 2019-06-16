package com.ssm.common.rbac.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.common.mapper.Mapper;
import com.ssm.common.rbac.model.Resources;
import com.ssm.common.rbac.model.Role;
import com.ssm.common.rbac.model.query.ResourcesQuery;

public interface ManagerMapper extends Mapper {

	public List<Role> selectRole();

	/**
	 * 获取当前角色及其所子自角色
	 * @param id
	 * @return
	 */
	public List<Role> getChildren(@Param("id")int id,@Param("admin")Boolean admin);

	public Role selectRoleByID(@Param("id")int id);

	public int addRole(Role role);

	public int updateRole(Role role);

	/**
	 * 获取所有资源
	 * @return 不包括从属名称
	 */
	public List<Resources> selectResources();
	
	public List<Resources> selectResourcesByRoleId(@Param("roleId")int roleId);

	public Resources selectResourcesByID(@Param("id")int id);

	/**
	 * 获取满足条件的所有资源
	 * @return 包括从属名称
	 */
	public List<Resources> selectResourcesByQuery(ResourcesQuery query);

	public int selectResourcesCountByQuery(ResourcesQuery query);

	public int addResources(Resources res);

	public int updateResources(Resources res);

	public int existResources(Resources res);

	/**
	 * 获取除接口外的其他资源
	 * @return
	 */
	public List<Resources> selectUpress();

	public List<String> selectFKByRoleID(@Param("roleId")Integer roleId);

	public int fkDel(@Param("roleId")Integer roleId, @Param("delTree")List<String> delTree);

	public int fkSet(@Param("roleId")Integer roleId, @Param("newTree")List<String> newTree);
}
