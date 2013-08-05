package com.xaviar.service

import redis.clients.jedis.Jedis

import com.org.krams.domain.UMetaData
import com.xaviar.domain.PhoneParams

class PhoneParamsService {


	public static String PHONEPARAMS_KEY_PREFIX="PHONEPARAMS_";
	def Jedis jedis = new Jedis("localhost");

	public PhoneParams create(PhoneParams phoneParams,String key) {
		String uuid = UUID.randomUUID().toString();
		String recordKey = PHONEPARAMS_KEY_PREFIX + uuid;
		jedis.hset(recordKey, "id", uuid);
		jedis.hset(recordKey, "simSubscriberId", phoneParams.getSimSubscriberId());
		jedis.hset(recordKey, "networkOperatorName", phoneParams.getNetworkOperatorName());
		jedis.hset(recordKey, "simSerialNumber", phoneParams.getSimSerialNumber());
		jedis.hset(recordKey, "phoneType", phoneParams.getPhoneType());
		jedis.hset(recordKey, "deviceID", phoneParams.getDeviceID());
		jedis.hset(recordKey, "deviceSoftwareVersion", phoneParams.getDeviceSoftwareVersion());
		jedis.hset(recordKey, "networkOperator", phoneParams.getNetworkOperator());
		jedis.hset(recordKey, "callState", phoneParams.getCallState());
		jedis.hset(recordKey, "networkCountryIso", phoneParams.getNetworkCountryIso());
		jedis.hset(recordKey, "simOperator", phoneParams.getSimOperator());
		jedis.hset(recordKey, "simstate", phoneParams.getSimstate());
		jedis.hset(recordKey, "simOperatorName", phoneParams.getSimOperatorName());
		jedis.hset(recordKey, "simCountryIso", phoneParams.getSimCountryIso());
		jedis.hset(recordKey, "line1Number", phoneParams.getLine1Number());
		jedis.hset(recordKey, "cellLocation", phoneParams.getCellLocation());
		jedis.sadd(key,recordKey);
		return phoneParams;
	}

	public void createAll(List<PhoneParams> phoneParamss,UMetaData uMetaData) {
		String key = PHONEPARAMS_KEY_PREFIX + uMetaData.getSimSubscriberId()+"_"+uMetaData.getToken();
		for (PhoneParams phoneParams : phoneParamss) {
			create(phoneParams, key);
		}
	}

	public PhoneParams read(String id) {
		String recordKey = PHONEPARAMS_KEY_PREFIX + id;
		PhoneParams phoneParams = new PhoneParams();
		phoneParams.setId((String) jedis.hget(recordKey, "id"));
		phoneParams.setSimSubscriberId(jedis.hget(recordKey, "simSubscriberId"));
		phoneParams.setNetworkOperatorName(jedis.hget(recordKey, "networkOperatorName"));
		phoneParams.setSimSerialNumber(jedis.hget(recordKey, "simSerialNumber"));
		phoneParams.setPhoneType(jedis.hget(recordKey, "phoneType"));
		phoneParams.setDeviceID(jedis.hget(recordKey, "deviceID"));
		phoneParams.setDeviceSoftwareVersion(jedis.hget(recordKey, "deviceSoftwareVersion"));
		phoneParams.setNetworkOperator(jedis.hget(recordKey, "networkOperator"));
		phoneParams.setCallState(jedis.hget(recordKey, "callState"));
		phoneParams.setNetworkCountryIso(jedis.hget(recordKey, "networkCountryIso"));
		phoneParams.setSimOperator(jedis.hget(recordKey, "simOperator"));
		phoneParams.setSimstate(jedis.hget(recordKey, "simstate"));
		phoneParams.setSimOperatorName(jedis.hget(recordKey, "simOperatorName"));
		phoneParams.setSimCountryIso(jedis.hget(recordKey, "simCountryIso"));
		phoneParams.setLine1Number(jedis.hget(recordKey, "line1Number"));
		phoneParams.setCellLocation(jedis.hget(recordKey, "cellLocation"));

		return phoneParams;
	}

	public List<PhoneParams> readAll(UMetaData uMetaData) {
		String key = PHONEPARAMS_KEY_PREFIX + uMetaData.getSimSubscriberId()+"_"+uMetaData.getToken();
		List<PhoneParams> phoneParamss = new ArrayList<PhoneParams>();
		Collection<String> keys = jedis.smembers(key);
		for (String recordKey : keys) {
			PhoneParams phoneParams = new PhoneParams();
			phoneParams.setId((String) jedis.hget(recordKey, "id"));
			phoneParams.setSimSubscriberId(jedis.hget(recordKey, "simSubscriberId"));
			phoneParams.setNetworkOperatorName(jedis.hget(recordKey, "networkOperatorName"));
			phoneParams.setSimSerialNumber(jedis.hget(recordKey, "simSerialNumber"));
			phoneParams.setPhoneType(jedis.hget(recordKey, "phoneType"));
			phoneParams.setDeviceID(jedis.hget(recordKey, "deviceID"));
			phoneParams.setDeviceSoftwareVersion(jedis.hget(recordKey, "deviceSoftwareVersion"));
			phoneParams.setNetworkOperator(jedis.hget(recordKey, "networkOperator"));
			phoneParams.setCallState(jedis.hget(recordKey, "callState"));
			phoneParams.setNetworkCountryIso(jedis.hget(recordKey, "networkCountryIso"));
			phoneParams.setSimOperator(jedis.hget(recordKey, "simOperator"));
			phoneParams.setSimstate(jedis.hget(recordKey, "simstate"));
			phoneParams.setSimOperatorName(jedis.hget(recordKey, "simOperatorName"));
			phoneParams.setSimCountryIso(jedis.hget(recordKey, "simCountryIso"));
			phoneParams.setLine1Number(jedis.hget(recordKey, "line1Number"));
			phoneParams.setCellLocation(jedis.hget(recordKey, "cellLocation"));

			phoneParamss.add(phoneParams);
		}

		Collections.sort(phoneParamss, new Comparator<PhoneParams>() {
					public int compare(PhoneParams o1, PhoneParams o2) {
						return o1.getSimSubscriberId()().compareTo(o2.getSimSubscriberId());
					}
				});

		return phoneParamss;
	}

	public PhoneParams update(PhoneParams phoneParams) {
		String recordKey = PHONEPARAMS_KEY_PREFIX + phoneParams.getId();
		String existingRecord = (String) jedis.hget(recordKey, "id");

		if (existingRecord == null) {
			return null;
		}

		jedis.hset(recordKey, "simSubscriberId", phoneParams.getSimSubscriberId());
		jedis.hset(recordKey, "networkOperatorName", phoneParams.getNetworkOperatorName());
		jedis.hset(recordKey, "simSerialNumber", phoneParams.getSimSerialNumber());
		jedis.hset(recordKey, "phoneType", phoneParams.getPhoneType());
		jedis.hset(recordKey, "deviceID", phoneParams.getDeviceID());
		jedis.hset(recordKey, "deviceSoftwareVersion", phoneParams.getDeviceSoftwareVersion());
		jedis.hset(recordKey, "networkOperator", phoneParams.getNetworkOperator());
		jedis.hset(recordKey, "callState", phoneParams.getCallState());
		jedis.hset(recordKey, "networkCountryIso", phoneParams.getNetworkCountryIso());
		jedis.hset(recordKey, "simOperator", phoneParams.getSimOperator());
		jedis.hset(recordKey, "simstate", phoneParams.getSimstate());
		jedis.hset(recordKey, "simOperatorName", phoneParams.getSimOperatorName());
		jedis.hset(recordKey, "simCountryIso", phoneParams.getSimCountryIso());
		jedis.hset(recordKey, "line1Number", phoneParams.getLine1Number());
		jedis.hset(recordKey, "cellLocation", phoneParams.getCellLocation());

		return phoneParams;
	}

	public Boolean delete(PhoneParams phoneParams,UMetaData uMetaData) {
		String key = PHONEPARAMS_KEY_PREFIX + uMetaData.getSimSubscriberId()+"_"+uMetaData.getToken();
		String recordKey = PHONEPARAMS_KEY_PREFIX + phoneParams.getId();
		jedis.del(recordKey, "id");
		jedis.del(recordKey, "simSubscriberId");
		jedis.del(recordKey, "networkOperatorName");
		jedis.del(recordKey, "simSerialNumber");
		jedis.del(recordKey, "phoneType");
		jedis.del(recordKey, "deviceID");
		jedis.del(recordKey, "deviceSoftwareVersion");
		jedis.del(recordKey, "networkOperator");
		jedis.del(recordKey, "callState");
		jedis.del(recordKey, "networkCountryIso");
		jedis.del(recordKey, "simOperator");
		jedis.del(recordKey, "simstate");
		jedis.del(recordKey, "simOperatorName");
		jedis.del(recordKey, "simCountryIso");
		jedis.del(recordKey, "line1Number");
		jedis.del(recordKey, "cellLocation");

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
