package com.xaviar.service

import redis.clients.jedis.Jedis

import com.org.krams.domain.UMetaData

class UserService {

	def Jedis jedis = new Jedis("localhost");

	def authOldUser(UMetaData uMetaData) {
		if(!uMetaData.getToken().isEmpty()){
			jedis.hvals(uMetaData.getUserName() + "_" + uMetaData.getPassword()).contains(uMetaData.getToken());
		}else{
			[validated:false]
		}

		[validated:true]
	}

	def authNewUser(UMetaData uMetaData){
		if(!uMetaData.getUserName().isEmpty() && !uMetaData.getPassword().isEmpty()){
			if(!jedis.hget(uMetaData.getUserName() + "_" + uMetaData.getPassword(),"token").isEmpty()){
				[validated:true]
			}else{
				[validated:false]
			}
		}else{
			[validated:false]
		}
	}

	def getUserInfo(String token){
		Set<String> subscribers = jedis.smembers(token);
		return subscribers;
	}

	def initDammyUsers(){
		if(jedis.hget("username123_password123","token").isEmpty()){
			jedis.hset("username123_password123", "token","token123");
			jedis.sadd("token123", "simSubscriberId123","simSubscriberId456");
		}
	}

	def authenticateUser(UMetaData uMetaData){
		if(authOldUser(uMetaData)){
			return true;
		}

		if(authNewUser(uMetaData)){
			return true;
		}

		return false;
	}
}