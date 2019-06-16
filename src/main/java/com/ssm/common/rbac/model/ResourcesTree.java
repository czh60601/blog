package com.ssm.common.rbac.model;

import java.util.Map;

import lombok.Data;

@Data
public class ResourcesTree {
	private Integer id;
	private Resources resources;
	private Map<Integer,ResourcesTree> children;
}
