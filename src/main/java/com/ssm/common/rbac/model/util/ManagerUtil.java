package com.ssm.common.rbac.model.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import com.ssm.common.rbac.model.Resources;
import com.ssm.common.rbac.model.ResourcesTree;
import com.ssm.common.rbac.model.Role;
import com.ssm.common.rbac.service.IManagerService;

public final class ManagerUtil {
	private final static Logger logger = Logger.getLogger(ManagerUtil.class);

	//RoleID索引
	private static Map<Integer,Role> roleMap = new HashMap<Integer,Role>();
	//PATH索引
	private static Map<String,Resources> pathMap = new HashMap<String, Resources>();
	//KeyValue索引
	private static Map<String,Map<String,Resources>> kvMap = new HashMap<String, Map<String,Resources>>();
	//ResourcesID索引
	private static Map<Integer,Resources> resourcesMap = new HashMap<Integer,Resources>();
	//RoleIDResourcesTree索引
	private static Map<Integer,ResourcesTree> roleResourcesTree = new HashMap<Integer, ResourcesTree>();


	private static IManagerService rbacService;

	public static void setService(IManagerService service){
		ManagerUtil.rbacService = service;
	}

	/**
	 * 初始化
	 */
	public static void initManager(){
		List<Role> roleList = rbacService.selectRole();
		List<Resources> resList = rbacService.selectResources();

		Map<Integer,Role> roleMapTemp = new HashMap<Integer,Role>();
		Map<String,Resources> pathMapTemp = new HashMap<String, Resources>();
		Map<Integer, Resources> resourcesMapTemp = new HashMap<Integer, Resources>();
		Map<String,Map<String,Resources>> kvMapTemp = new HashMap<String, Map<String,Resources>>();

		logger.info("生成角色索引");
		for(Role role:roleList){
			roleMapTemp.put(role.getId(), role);
		}
		logger.info("生成角色索引完成");

		logger.info("生成资源索引");
		for(;!resList.isEmpty();){
			Resources resItem = resList.remove(0);

			if(StringUtils.isNotBlank(resItem.getPath())){
				pathMapTemp.put(resItem.getPath(), resItem);
			}
			if(kvMapTemp.containsKey(resItem.getKey())){
				kvMapTemp.get(resItem.getKey()).put(resItem.getValue(), resItem);
			}else{
				Map<String,Resources> vMap = new HashMap<String, Resources>();
				kvMapTemp.put(resItem.getKey(), vMap);
				vMap.put(resItem.getValue(), resItem);
			}
			resourcesMapTemp.put(resItem.getId(), resItem);
		}
		logger.info("生成资源索引完成");

		logger.info("生成角色主菜单索引");
		Map<Integer,ResourcesTree> roleResourcesTreeTemp = new HashMap<Integer, ResourcesTree>();
		for(Integer roleId:roleMapTemp.keySet()){
			Role roleItem = roleMapTemp.get(roleId);

			ResourcesTree rootTree = new ResourcesTree();//根目录
			Set<Integer> created = new HashSet<Integer>();//已经生成过多的资源ID
			List<String> resListItem = new ArrayList<String>(roleItem.Reslist);//不能直接做移除,要复制一个副本来操作

			for(;!resListItem.isEmpty();){
				String resId = resListItem.remove(0);
				Resources resItem = resourcesMapTemp.get(Integer.parseInt(resId));
				if(resItem.getType()==Resources.TYPE_MENU || resItem.getType()==Resources.TYPE_PAGE){
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

							//创建子节点
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
							if(!resListItem.contains(resItem.getFlow())){
								logger.error("权限异常["+resId+"]:"+roleItem.getId()+"/"+roleItem.getRolename());
								System.out.println("权限异常["+resId+"]:"+roleItem.getId()+"/"+roleItem.getRolename());
								break;
							}else{
								resListItem.add(resId);
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
			}

			roleResourcesTreeTemp.put(roleId, rootTree);
		}
		logger.info("生成角色主菜单索引完成");

		logger.info("更新索引");
		roleMap = roleMapTemp;
		resourcesMap = resourcesMapTemp;
		pathMap = pathMapTemp;
		kvMap = kvMapTemp;
		roleResourcesTree = roleResourcesTreeTemp;
		logger.info("更新索引完成");
	}

	/**
	 * 获取菜单树
	 * @return 
	 */
	public static ResourcesTree getTreeByRoleId(Integer roleId){
		Role role = getRoleByID(roleId);
		if(role == null || !roleResourcesTree.containsKey(roleId)){
			return new ResourcesTree();
		}
		return roleResourcesTree.get(roleId);
	}

	/**
	 * 根据KeyValue获取资源
	 * @return
	 */
	public static Resources getResourcesByKeyValue(String key,String value){
		if(kvMap.containsKey(key)){
			return kvMap.get(key).get(value);
		}
		return null;
	}

	/**
	 * 根据path获取资源
	 */
	public static Resources getResourcesByPath(String path){
		return pathMap.get(path);
	}

	/**
	 * 获取角色
	 */
	public static Role getRoleByID(Integer roleId){
		return roleMap.get(roleId);
	}

	public static boolean hasResourcesSet(String key,String value,Integer roleId){
		Resources res = getResourcesByKeyValue(key, value);
		if(res!=null){
			Role role = getRoleByID(roleId);
			if(role!=null){
				return role.Reslist.contains(res.getId().toString());
			}
		}
		return false;
	}

	public static boolean hasResourcesSet(String path,Integer roleId){
		Resources res = getResourcesByPath(path);
		if(res!=null){
			Role role = getRoleByID(roleId);
			if(role!=null){
				return role.Reslist.contains(res.getId().toString());
			}
		}
		return false;
	}

	private ManagerUtil(){};
}
