package com.blog.model.query;

import java.util.List;

import lombok.Data;

import com.blog.model.User;
import com.ssm.common.model.query.PageQuery;

@Data
public class UserQuery extends PageQuery<User> {
	private List<Integer> uids;

	private Integer uid;
	private Integer role;
	private String username;
	private String nickname;

	private String queryType;

	private Boolean admin;//是否管理员
}