package com.ssm.common.rbac.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import org.apache.commons.lang3.StringUtils;

@Data
public class Role {
	private int id;
	private String rolename;
	/**
	 * 父级
	 */
	private int parent;
	private String pname;
	/**
	 * 家族树
	 */
	private String family;
	private String info;
	private boolean admin;

	public List<String> Reslist = new ArrayList<String>();
	public List<String> FamilyList = new ArrayList<String>();

	public void setFamily(String family){
		List<String> familyTemp = new ArrayList<String>();
		if(StringUtils.isNotBlank(family)){
			for(String item:family.split(",")){
				familyTemp.add(item.trim());
			}
		}
		FamilyList = familyTemp;
		this.family = family;
	}

	public void setResList(String resList){
		List<String> listTemp = new ArrayList<String>();
		if(StringUtils.isNotBlank(resList)){
			for(String item:resList.split(",")){
				listTemp.add(item.trim());
			}
		}
		Reslist = listTemp;
	}
}