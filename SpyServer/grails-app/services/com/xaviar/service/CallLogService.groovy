package com.xaviar.service

import redis.clients.jedis.Jedis

import com.org.krams.domain.CallLog
import com.org.krams.domain.UMetaData

class CallLogService {

	public static String CALLLOG_KEY_PREFIX="CALLLOG_";
	def Jedis jedis = new Jedis("localhost");

	public CallLog create(CallLog callLog,String key) {
		String uuid = UUID.randomUUID().toString();
		String recordKey = CALLLOG_KEY_PREFIX + uuid;
		jedis.hset(recordKey, "id", uuid);
		jedis.hset(recordKey, "phoneNumber", callLog.getPhoneNumber());
		if(callLog.getType()!=null){
			jedis.hset(recordKey, "type", callLog.getType());
		}else{
			jedis.hset(recordKey, "type", "");
		}
		jedis.hset(recordKey, "duration", callLog.getDuration());
		jedis.hset(recordKey, "timeSeconds", callLog.getTimeSeconds());
		jedis.sadd(key,recordKey);
		return callLog;
	}

	public void createAll(List<CallLog> callLogs,UMetaData uMetaData) {
		String key = CALLLOG_KEY_PREFIX + uMetaData.getSimSubscriberId()+"_"+uMetaData.getToken();
		for (CallLog callLog : callLogs) {
			create(callLog, key);
		}
	}

	public CallLog read(String id) {
		String recordKey = CALLLOG_KEY_PREFIX + id;
		CallLog callLog = new CallLog();
		callLog.setId((String) jedis.hget(recordKey, "id"));
		callLog.setPhoneNumber((String) jedis.hget(recordKey, "phoneNumber"));
		callLog.setType((String) jedis.hget(recordKey, "type"));
		callLog.setDuration((String) jedis.hget(recordKey, "duration"));
		callLog.setTimeSeconds((String) jedis.hget(recordKey, "timeSeconds"));
		return callLog;
	}

	public List<CallLog> readAll(UMetaData uMetaData) {
		String key = CALLLOG_KEY_PREFIX + uMetaData.getSimSubscriberId()+"_"+uMetaData.getToken();
		List<CallLog> callLogs = new ArrayList<CallLog>();
		Collection<String> keys = jedis.smembers(key);
		for (String recordKey : keys) {
			CallLog callLog = new CallLog();
			callLog.setId((String) jedis.hget(recordKey, "id"));
			callLog.setPhoneNumber((String) jedis.hget(recordKey, "phoneNumber"));
			callLog.setType((String) jedis.hget(recordKey, "type"));
			callLog.setDuration((String) jedis.hget(recordKey, "duration"));
			callLog.setTimeSeconds((String) jedis.hget(recordKey, "timeSeconds"));

			callLogs.add(callLog);
		}

		Collections.sort(callLogs, new Comparator<CallLog>() {
					public int compare(CallLog o1, CallLog o2) {
						return o1.getDuration().compareTo(o2.getDuration());
					}
				});

		return callLogs;
	}

	public CallLog update(CallLog callLog) {
		String recordKey = CALLLOG_KEY_PREFIX + callLog.getId();
		String existingRecord = (String) jedis.hget(recordKey, "id");

		if (existingRecord == null) {
			return null;
		}

		jedis.hset(recordKey, "phoneNumber", callLog.getPhoneNumber());
		jedis.hset(recordKey, "type", callLog.getType());
		jedis.hset(recordKey, "duration", callLog.getDuration());
		jedis.hset(recordKey, "timeSeconds", callLog.getTimeSeconds());

		return callLog;
	}

	public Boolean delete(CallLog callLog,UMetaData uMetaData) {
		String key = CALLLOG_KEY_PREFIX + uMetaData.getSimSubscriberId()+"_"+uMetaData.getToken();
		String recordKey = CALLLOG_KEY_PREFIX + callLog.getId();
		jedis.del(recordKey, "id");
		jedis.del(recordKey, "phoneNumber");
		jedis.del(recordKey, "type");
		jedis.del(recordKey, "duration");
		jedis.del(recordKey, "timeSeconds");

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
