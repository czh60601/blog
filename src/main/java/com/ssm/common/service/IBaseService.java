package com.ssm.common.service;

import com.ssm.common.model.query.PageQuery;

public interface IBaseService<T> {
	int add(T t);
	
	int deleteByQuery(PageQuery<T> query);
	
	int deleteByModel(T t);
	
	int updateByModel(T t);
	
	T selectByModel(T t);
	
	PageQuery<T> selectByQuery(PageQuery<T> query);
}
