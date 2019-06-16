package com.blog.service.impl;

import java.util.List;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import com.blog.service.IRedisService;

@Service
public class RedisServiceImpl implements IRedisService {	
	@Autowired
	private RedisTemplate<String, String> redisTemplate;

	@Override
	public void set(String key, String value) {
		redisTemplate.opsForValue().set(key, value);
	}

	@Override
	public void set(String key, String value, long passtime,TimeUnit timeunit) {
		redisTemplate.opsForValue().set(key, value, passtime, timeunit);
	}

	@Override
	public void delete(String key) {
		redisTemplate.delete(key);
	}

	@Override
	public void delete(List<String> listKeys) {
		redisTemplate.delete(listKeys);
	}

	@Override
	public String get(String key) {
		return redisTemplate.opsForValue().get(key);
	}
}
