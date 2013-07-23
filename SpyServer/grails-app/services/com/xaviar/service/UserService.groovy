package com.xaviar.service

import com.org.krams.domain.UMetaData;

import redis.clients.jedis.Jedis;

class UserService {

	def Jedis jedis = new Jedis("localhost");

    def addUserInfo(UMetaData uMetaData) {
		jedis.sadd(uMetaData.getUserId(),uMetaData.getSimSubscriberId());
    }
	
	
	def getUserInfo(String id){
		Set<String> subscribers = jedis.smembers(id);
		return subscribers;
	}
}
