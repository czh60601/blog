package com.ssm.common.rbac.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.common.rbac.model.Resources;
import com.ssm.common.rbac.model.ResourcesTree;
import com.ssm.common.rbac.model.Role;
import com.ssm.common.rbac.model.UserObject;
import com.ssm.common.rbac.model.query.ResourcesQuery;
import com.ssm.common.rbac.model.util.ManagerUtil;
import com.ssm.common.rbac.service.IManagerService;
import com.ssm.common.web.ResultEnum;

@Controller
@RequestMapping("/background/rbac")
public class ManagerController {
	private final static Logger LOGGER = Logger.getLogger(ManagerController.class);

	@Autowired
	private IManagerService service;

	@RequestMapping("/role")
	public String roleList(HttpServletRequest request,Model model){
		UserObject logUser = (UserObject) request.getAttribute("logUser");
		Role logRole = ManagerUtil.getRoleByID(logUser.getRole());

		List<Role> list;
		if(logUser.hasItem("background.sys_user","primuid")){
			list = service.getChildren(logUser.getRole(),null);
		}else{
			list = service.getChildren(logUser.getRole(),true);
		}
		ResourcesTree rootTree = service.getResTree(logRole);

		model.addAttribute("rootTree", rootTree);
		model.addAttribute("roleList", list);
		model.addAttribute("menu", "rbac");
		model.addAttribute("title", "role");
		return "/rbac/role";
	}

	@RequestMapping("/role/edit")
	@ResponseBody
	public ResultEnum<Object> roleEdit(HttpServletRequest request,Role role,String queryType){
		UserObject logUser = (UserObject) request.getAttribute("logUser");
		Role logRole = ManagerUtil.getRoleByID(logUser.getRole());

		ResultEnum<Object> result = new ResultEnum<Object>();
		int ret = ResultEnum.DEFAULT;
		if(ResultEnum.TYPE_ADD.equals(queryType)){
			if(StringUtils.isNotBlank(role.getRolename()) && role.getParent() != 0){
				ret = service.addRole(role,logRole);
				result.setCode(ret);
			}else{
				result.setCode(ResultEnum.EMPTY_INPUT);
			}
		}else if(ResultEnum.TYPE_UPDATE.equals(queryType)){
			if(StringUtils.isNotBlank(role.getRolename()) && role.getParent() != 0){
				if(service.selectRoleByID(role.getId())!=null){
					ret = service.updateRole(role,logRole);
					result.setCode(ret);
				}else{
					result.setCode(ResultEnum.UNEXIST);
				}
			}else{
				result.setCode(ResultEnum.EMPTY_INPUT);
			}
		}else if(ResultEnum.TYPE_INFO.equals(queryType)){
			if(role == null || role.getId() == 0){
				result.setCode(ResultEnum.EMPTY_INPUT);
			}else{
				role = service.selectRoleByID(role.getId());
				if(role!=null){
					if(role.FamilyList.contains(logRole.getId()+"")){
						result.setData(role);
						result.setCode(ResultEnum.SUCCESS);
					}else{
						result.setCode(ResultEnum.UNEXIST);
					}
				}else{
					result.setCode(ResultEnum.UNEXIST);
				}
			}
		}else if(ResultEnum.TYPE_DELETE.equals(queryType)){
			//处理家族树,已绑定角色
		}else{
			result.setCode(ResultEnum.ERROR_INPUT);
		}
		return result;
	}

	@RequestMapping("/role/fkset")
	@ResponseBody
	public ResultEnum<Object> fkSet(Integer roleId,String resTree){
		ResultEnum<Object> result = new ResultEnum<Object>();
		int ret = ResultEnum.DEFAULT;

		if(roleId == null || roleId == 0){
			result.setCode(ResultEnum.EMPTY_INPUT);
		}else{
			ret = service.fkSet(roleId,resTree);
			result.setCode(ret);
		}

		return result;
	}

	@RequestMapping("/role/reinit")
	@ResponseBody
	public ResultEnum<Object> reinit(){
		ResultEnum<Object> result = new ResultEnum<Object>();
		try{
			ManagerUtil.initManager();
			result.setCode(ResultEnum.SUCCESS);
			result.setMsg("权限重载完成");
		}catch (Exception e) {
			result.setCode(ResultEnum.FAILED);
			result.setMsg("权限重载失败:"+e.getMessage());
			LOGGER.error("权限重载失败",e);
		}
		return result;
	}

	@RequestMapping("/resources")
	public String resourcesList(ResourcesQuery query,Model model){
		service.selectResourcesByQuery(query);
		model.addAttribute("query", query);
		model.addAttribute("menu", "rbac");
		model.addAttribute("title", "resources");
		return "/rbac/resources";
	}

	@RequestMapping("/resources/edit")
	@ResponseBody
	public ResultEnum<Object> resourcesEdit(Resources res,String queryType){
		ResultEnum<Object> result = new ResultEnum<Object>();
		int ret = ResultEnum.DEFAULT;
		if(ResultEnum.TYPE_ADD.equals(queryType)){
			//判断是否存在
			ret = service.existResources(res);
			if(ret==0){
				ret = service.addResources(res);
				result.setCode(ret);
			}else{
				result.setCode(ResultEnum.EXIST);
			}
		}else if(ResultEnum.TYPE_UPDATE.equals(queryType)){
			ret = service.existResources(res);
			if(ret==0){
				if(res == null || res.getId() == null){
					result.setCode(ResultEnum.EMPTY_INPUT);
				}else{
					if(service.selectResourcesByID(res.getId())!=null){
						ret = service.updateResources(res);
						result.setCode(ret);
					}else{
						result.setCode(ResultEnum.UNEXIST);
					}
				}
			}else{
				result.setCode(ResultEnum.EXIST);
			}
		}else if(ResultEnum.TYPE_INFO.equals(queryType)){
			if(res == null || res.getId() == null){
				result.setCode(ResultEnum.EMPTY_INPUT);
			}else{
				res = service.selectResourcesByID(res.getId());
				if(res!=null){
					result.setData(res);
					result.setCode(ResultEnum.SUCCESS);
				}else{
					result.setCode(ResultEnum.UNEXIST);
				}
			}
		}else if(ResultEnum.TYPE_DELETE.equals(queryType)){
			//处理家族树,已绑定角色
		}else{
			result.setCode(ResultEnum.ERROR_INPUT);
		}
		return result;
	}
}
