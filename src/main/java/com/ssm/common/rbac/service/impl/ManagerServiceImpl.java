package com.ssm.common.rbac.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.common.rbac.mapper.ManagerMapper;
import com.ssm.common.rbac.model.Resources;
import com.ssm.common.rbac.model.ResourcesTree;
import com.ssm.common.rbac.model.Role;
import com.ssm.common.rbac.model.query.ResourcesQuery;
import com.ssm.common.rbac.model.util.ManagerUtil;
import com.ssm.common.rbac.service.IManagerService;
import com.ssm.common.web.ResultEnum;

@Service
public class ManagerServiceImpl implements IManagerService {
	private final static Logger logger = Logger.getLogger(ManagerUtil.class);

	@Autowired
	private ManagerMapper mapper;

	@Override
	public List<Role> selectRole() {
		return mapper.selectRole();
	}

	@Override
	public Role selectRoleByID(int id) {
		return mapper.selectRoleByID(id);
	}

	@Override
	public List<Role> getChildren(int id,Boolean admin) {
		return mapper.getChildren(id,admin);
	}

	@Transactional
	@Override
	public int addRole(Role role,Role logRole) {
		Role parent = mapper.selectRoleByID(role.getParent());
		//目标角色超出管辖范围却
		if(parent.FamilyList.contains(logRole.getId()+"")){
			int ret = mapper.addRole(role);
			if(ret>0){
				int rid = mapper.lastInsertId();
				role.setId(rid);
				role.setFamily(parent.getFamily()+","+role.getId());
				ret = mapper.updateRole(role);
				if(ret!=1){
					throw new RuntimeException("添加失败:"+role);
				}
			}
			return ret;
		}else{
			return ResultEnum.DEFAULT;
		}
	}

	@Override
	public int updateRole(Role role,Role logRole) {
		Role parent = mapper.selectRoleByID(role.getParent());
		//目标角色超出管辖范围却
		if(parent.FamilyList.contains(logRole.getId()+"")){
			if(!role.FamilyList.contains(role.getId())){
				role.setFamily(role.getFamily()+","+role.getId());
			}
			int ret = mapper.updateRole(role);
			return ret;
		}else{
			return ResultEnum.DEFAULT;
		}
	}

	@Override
	public List<Resources> selectResources() {
		return mapper.selectResources();
	}

	@Override
	public ResourcesQuery selectResourcesByQuery(ResourcesQuery query) {
		query.setContent(mapper.selectResourcesByQuery(query));
		if(!query.getEmpty()){
			query.setCounts(mapper.selectResourcesCountByQuery(query));
			query.setUpres(mapper.selectUpress());
		}
		return query;
	}

	@Transactional
	@Override
	public int addResources(Resources res) {
		int ret = mapper.addResources(res);
		if(ret>0){
			int resId = mapper.lastInsertId();
			res.setId(resId);
			if(res.getFlow()!=0){
				Resources flow = mapper.selectResourcesByID(res.getFlow());
				res.setFlowtree(flow.getFlowtree()+","+res.getId());
			}else{
				res.setFlowtree(res.getId().toString());
			}
			ret = mapper.updateResources(res);
			if(ret!=1){
				throw new RuntimeException("添加失败:"+res);
			}
		}
		return ret;
	}

	@Override
	public int updateResources(Resources res) {
		if(res.getFlow()!=0){
			Resources flow = mapper.selectResourcesByID(res.getFlow());
			res.setFlowtree(flow.getFlowtree()+","+res.getId());
		}else{
			res.setFlowtree(res.getId().toString());
		}
		int ret = mapper.updateResources(res);
		return ret;
	}

	@Override
	public int existResources(Resources res) {
		return mapper.existResources(res);
	}

	@Override
	public Resources selectResourcesByID(int id) {
		return mapper.selectResourcesByID(id);
	}

	@Override
	public ResourcesTree getResTree(Role role) {

		List<Resources> data = null;

		//超级管理员
		if(role.getId()==role.getParent()){
			data = mapper.selectResources();
		}else{
			//TODO 根据角色ID获取
			data = mapper.selectResourcesByRoleId(role.getId());
		}

		if(data==null){
			return null;
		}

		ResourcesTree rootTree = new ResourcesTree();
		Set<Integer> created = new HashSet<Integer>();

		for(;!data.isEmpty();){
			Resources resItem = data.remove(0);
			//是否存在父级
			if(resItem.getFlow()!=0){
				//检测父级是否创建
				if(created.contains(resItem.getFlow())){
					String flowtree = resItem.getFlowtree().replaceAll("\\,?\\d+$", "");//剔除自己

					ResourcesTree root = rootTree;
					//根据家族树查找父级
					for(String key:flowtree.split(",")){
						root = root.getChildren().get(Integer.parseInt(key));
					}

					ResourcesTree treeItem = new ResourcesTree();
					treeItem.setId(resItem.getId());
					treeItem.setResources(resItem);

					if(root.getChildren()==null){
						Map<Integer,ResourcesTree> children = new LinkedHashMap<Integer, ResourcesTree>();
						children.put(resItem.getId(), treeItem);
						root.setChildren(children);
					}else{
						Map<Integer,ResourcesTree> children = root.getChildren();
						children.put(resItem.getId(), treeItem);
					}
					created.add(resItem.getId());
				}else{
					//判断父节点是否被授权,否这跳过创建,并记录已存日志
					if(!data.contains(resItem.getFlow())){
						logger.error("获取资源树异常"+resItem);
						break;
					}else{
						data.add(resItem);
						//父级未创建放回
						continue;
					}
				}
			}else{
				ResourcesTree treeItem = new ResourcesTree();
				treeItem.setId(resItem.getId());
				treeItem.setResources(resItem);

				if(rootTree.getChildren()==null){
					Map<Integer,ResourcesTree> children = new LinkedHashMap<Integer, ResourcesTree>();
					children.put(resItem.getId(), treeItem);
					rootTree.setChildren(children);
				}else{
					Map<Integer,ResourcesTree> children = rootTree.getChildren();
					children.put(resItem.getId(), treeItem);
				}
				created.add(resItem.getId());
			}
		}

		return rootTree;
	}

	@Transactional
	@Override
	public int fkSet(Integer roleId, String resTree) {
		List<String> oldTree = mapper.selectFKByRoleID(roleId);
		List<String> newTree = new ArrayList<String>();

		//resTree为空视为全部移除
		if(StringUtils.isNotBlank(resTree)){
			for(String item:resTree.split(",")){
				item = item.trim();
				//移除之前已经存在的项
				if(!oldTree.remove(item)){
					newTree.add(item);
				}
			}
		}

		int del = 0;
		if(!oldTree.isEmpty()){
			del = mapper.fkDel(roleId,oldTree);
		}
		int set = 0;
		if(!newTree.isEmpty()){
			set = mapper.fkSet(roleId,newTree);
		}
		int ret = del + set;
		if(ret==0){
			if(newTree.isEmpty()==oldTree.isEmpty()){
				ret=ResultEnum.SAME;
			}
		}else{
			ret=ResultEnum.SUCCESS;
		}

		return ret;
	}

}
