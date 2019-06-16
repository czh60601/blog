package com.ssm.common.mapper;

import java.util.List;

import com.ssm.common.model.query.PageQuery;

public interface BaseMapper<T> extends Mapper {

	int add(T t);

	int deleteByQuery(PageQuery<T> query);

	int deleteByModel(T t);

	int updateByModel(T t);

	T selectByModel(T t);

	List<T> selectByQuery(PageQuery<T> query);

	int countByQuery(PageQuery<T> query);
}
