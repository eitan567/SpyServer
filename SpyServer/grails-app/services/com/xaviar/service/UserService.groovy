package com.xaviar.service

import redis.clients.jedis.Jedis

import com.org.krams.domain.UMetaData

class UserService {

	def Jedis jedis = new Jedis("localhost");

	def boolean authOldUser(UMetaData uMetaData) {
		if(uMetaData.getToken()!=null && jedis.smembers(uMetaData.getToken()).contains(uMetaData.getSimSubscriberId())){			
			return true;
		}else{
			return false;
		}
	}

	def boolean authNewUser(UMetaData uMetaData){
		if(uMetaData.getUserName()!=null && uMetaData.getPassword()!=null){
			if(jedis.hget(uMetaData.getUserName() + "_" + uMetaData.getPassword(),"token")!=null){
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
	}

	def getUserInfo(String token){
		Set<String> subscribers = jedis.smembers(token);
		return subscribers;
	}

	def initDammyUsers(){
		if(jedis.hget("username123_password123","token")==null){
			jedis.hset("username123_password123", "token","token123");
			jedis.sadd("token123", "simSubscriberId123","425071021121744");
		}
	}

	def boolean authenticateUser(UMetaData uMetaData){
		if(authOldUser(uMetaData)){
			return true;
		}

		if(authNewUser(uMetaData)){
			return true;
		}

		return false;
	}
}