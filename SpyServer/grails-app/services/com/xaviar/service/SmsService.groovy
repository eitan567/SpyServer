package com.xaviar.service;

import redis.clients.jedis.Jedis

import com.org.krams.domain.UMetaData
import com.xaviar.domain.Sms

public class SmsService {

	public static String SMS_KEY_PREFIX="SMS_";
	def Jedis jedis = new Jedis("localhost");

	public Sms create(Sms sms,String key) {
		String uuid = UUID.randomUUID().toString();
		String recordKey = SMS_KEY_PREFIX + uuid;
		jedis.hset(recordKey, "id", uuid);
		jedis.hset(recordKey, "address", sms.getAddress());
		jedis.hset(recordKey, "folderName", sms.getFolderName());
		jedis.hset(recordKey, "msg", sms.getMsg());
		jedis.hset(recordKey, "time", sms.getTime());

		jedis.sadd(key,recordKey);
		return sms;
	}

	public void createAll(List<Sms> smss,UMetaData uMetaData) {
		String key = SMS_KEY_PREFIX + uMetaData.getSimSubscriberId()+"_"+uMetaData.getToken();
		for (Sms sms : smss) {
			create(sms, key);
		}
	}

	public Sms read(String id) {
		String recordKey = SMS_KEY_PREFIX + id;
		Sms sms = new Sms();
		sms.setId((String) jedis.hget(recordKey, "id"));
		sms.setAddress((String) jedis.hget(recordKey, "address"));
		sms.setFolderName((String) jedis.hget(recordKey, "folderName"));
		sms.setMsg((String) jedis.hget(recordKey, "msg"));
		sms.setTime((String) jedis.hget(recordKey, "time"));
		return sms;
	}

	public List<Sms> readAll(UMetaData uMetaData) {
		String key = SMS_KEY_PREFIX + uMetaData.getSimSubscriberId()+"_"+uMetaData.getToken();
		List<Sms> smss = new ArrayList<Sms>();
		Collection<String> keys = jedis.smembers(key);
		for (String recordKey : keys) {
			Sms sms = new Sms();
			sms.setId((String) jedis.hget(recordKey, "id"));
			sms.setAddress((String) jedis.hget(recordKey, "address"));
			sms.setFolderName((String) jedis.hget(recordKey, "folderName"));
			sms.setMsg((String) jedis.hget(recordKey, "msg"));
			sms.setTime((String) jedis.hget(recordKey, "time"));

			smss.add(sms);
		}

		Collections.sort(smss, new Comparator<Sms>() {
					public int compare(Sms o1, Sms o2) {
						return o1.getTime().compareTo(o2.getTime());
					}
				});

		return smss;
	}

	public Sms update(Sms sms) {
		String recordKey = SMS_KEY_PREFIX + sms.getId();
		String existingRecord = (String) jedis.hget(recordKey, "id");

		if (existingRecord == null) {
			return null;
		}

		jedis.hset(recordKey, "address", sms.getAddress());
		jedis.hset(recordKey, "folderName", sms.getFolderName());
		jedis.hset(recordKey, "msg", sms.getMsg());
		jedis.hset(recordKey, "time", sms.getTime());

		return sms;
	}

	public Boolean delete(Sms sms,UMetaData uMetaData) {
		String key = SMS_KEY_PREFIX + uMetaData.getSimSubscriberId()+"_"+uMetaData.getToken();
		String recordKey = SMS_KEY_PREFIX + sms.getId();
		jedis.del(recordKey, "id");
		jedis.del(recordKey, "address");
		jedis.del(recordKey, "folderName");
		jedis.del(recordKey, "msg");
		jedis.del(recordKey, "time");

		String existingRecord = (String) jedis.hget(recordKey, "id");
		Boolean existingMember = jedis.srem(key, recordKey);

		if (existingRecord != null) {
			return false;
		}

		if (existingMember == false) {
			return false;
		}

		return true;
	}
}
