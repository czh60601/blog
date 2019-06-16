package com.blog.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blog.mapper.UserMapper;
import com.blog.model.LoginLog;
import com.blog.model.User;
import com.blog.model.query.LoginLogQuery;
import com.blog.model.query.UserQuery;
import com.blog.service.IRedisService;
import com.blog.service.IUserService;
import com.ssm.common.model.query.PageQuery;
import com.ssm.common.web.ResultEnum;

@Service
@Transactional
public class UserServiceImpl implements IUserService{
	private static final Logger LOGGER = LogManager.getLogger(UserServiceImpl.class);

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private IRedisService redisService;

	@Transactional
	@Override
	public int add(User t) {
		int ret = userMapper.checkExist(t);
		if(ret==0){
			ret = userMapper.add(t);
			if(ret>0){
				t.setUid(userMapper.lastInsertId());
			}
		}else{
			ret = ResultEnum.EXIST;
		}
		return ret;
	}

	@Override
	public int deleteByQuery(PageQuery<User> query) {
		for(Integer uid:((UserQuery)query).getUids()){
			redisService.delete(IRedisService.LOGIN_SSID+uid.toString());
			redisService.delete(IRedisService.LOGIN_USERAGENT+uid.toString());
		}
		LOGGER.info("delete users:"+((UserQuery)query).getUids());
		return userMapper.deleteByQuery(query);
	}

	@Override
	public int updateByModel(User t) {
		//修改用户状态 或者 修改密码后 要求用户重新登录
		if(t.getStatus() != null && (t.getStatus()==User.STATE_BANNED || t.getStatus()==User.STATE_DELETED) || StringUtils.isNotBlank(t.getPassword())){
			redisService.delete(IRedisService.LOGIN_SSID+t.getUid().toString());
			redisService.delete(IRedisService.LOGIN_USERAGENT+t.getUid().toString());
			LOGGER.info("update user:"+t.getStatus()+","+StringUtils.isNotBlank(t.getPassword()));
		}
		return userMapper.updateByModel(t);
	}

	@Override
	public User selectByModel(User t) {
		return userMapper.selectByModel(t);
	}

	@Override
	public PageQuery<User> selectByQuery(PageQuery<User> query) {
		query.setContent(userMapper.selectByQuery(query));
		query.setCounts(userMapper.countByQuery(query));
		if(query.getCounts()>0){
			query.setPage(query.getPage()>0?query.getPage():1);
		}else{
			query.setPage(0);
		}
		return query;
	}

	@Override
	public int editPassword(String oldpwd, String newpwd, Integer uid) {
		return userMapper.editPassword(oldpwd,newpwd,uid);
	}

	@Override
	public int deleteByModel(User t) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int initGoogleKey(Integer uid) {
		return userMapper.initGoogleKey(uid);
	}

	@Override
	public int logLogin(LoginLog log) {
		return userMapper.logLogin(log);
	}

	@Override
	public LoginLogQuery selectLoginLogByQuery(LoginLogQuery query) {
		query.setContent(userMapper.selectLoginLogByQuery(query));
		query.setCounts(userMapper.counttLoginLogByQuery(query));
		if(query.getCounts()>0){
			query.setPage(query.getPage()>0?query.getPage():1);
		}else{
			query.setPage(0);
		}
		return query;
	}

	@Override
	public UserQuery selectUnuseByQuery(UserQuery query) {
		query.setContent(userMapper.selectUnuseByQuery(query));
		query.setCounts(userMapper.countUnuseByQuery(query));
		if(query.getCounts()>0){
			query.setPage(query.getPage()>0?query.getPage():1);
		}else{
			query.setPage(0);
		}
		return query;
	}

	@Override
	public int removeByQuery(UserQuery query) {
		return userMapper.removeByQuery(query);
	}
}
