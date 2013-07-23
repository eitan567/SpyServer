package com.xaviar.test

import grails.converters.JSON

import org.codehaus.groovy.grails.web.json.JSONObject

import redis.clients.jedis.Jedis

class DeviewController {

	def redisService

	def index= {
		def keys = redisService.withRedis { Jedis redis ->
			redis.keys("*");
		}

		List<List<JSONObject>> lists = new ArrayList<List<JSONObject>>();
		List<List<String>> listOfColHeaders = new ArrayList<List<String>>();

		for (key in keys) {
			def jsonData = redisService.withRedis { Jedis redis ->
				redis.get(key.toString());
			}

			if(jsonData!=null){
				def jsonObjs = JSON.parse(jsonData).collect().toList();
				JSONObject jsonboj= jsonObjs.get(0);
				listOfColHeaders.add(jsonboj.keySet());
				lists.add(jsonObjs);
			}
		}

		[datalists: lists,tables:keys.collect(),columns:listOfColHeaders]
	}



	def clear() {
		redisService.flushDB();
		redirect(action: "index")
	}

	def clearme(int id) {
		def keys = redisService.withRedis { Jedis redis ->
			redis.keys("*");
		}
		if(keys.collect().getAt(id)!=null){
			redisService.deleteKeysWithPattern(keys.collect().getAt(id))
		}
		redirect(action: "index")
	}
}
