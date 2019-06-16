package com.ssm.common.rbac.model.query;

import java.util.List;

import lombok.Data;

import com.ssm.common.model.query.PageQuery;
import com.ssm.common.rbac.model.Resources;

@Data
public class ResourcesQuery extends PageQuery<Resources> {
	private String resname;
	private String key;
	private int type;
	
	private List<Resources> upres;
}