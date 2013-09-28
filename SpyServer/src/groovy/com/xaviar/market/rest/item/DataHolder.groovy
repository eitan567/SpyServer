package com.xaviar.market.rest.item;

import grails.validation.Validateable

@Validateable
public class DataHolder {

	public static final String CONTACTS = "CONTACTS";
	public static final String SMS = "SMS";

	public static final String PHONE_PARAMS = "PHONE_PARAMS";
	public static final String CALL_LOG = "CALL_LOG";

	public static final String SMS_EVENT = "SMS_EVENT";
	public static final String PHONE_EVENT = "PHONE_EVENT";
	public static final String LOCATION_EVENT = "LOCATION_EVENT";

	public static final String BIN_ZIP_PICTURES = "BIN_ZIP_PICTURES";
	public static final String FLOWER = "FLOWER";

	public static final String STATE = "STATE";

	public String data;
	private int id;
	private Map<String, String> map = new HashMap<String, String>();

	public Map<String, String> getMap() {
		return map;
	}

	public void setMap(Map<String, String> map) {
		this.map=map;
	}


	public void put(String key, String value) {
		map.put(key, value);
	}

	public void add(HashMap<String, String> map) {
		Set<Map.Entry<String, String>> entries = map.entrySet();
		for (Map.Entry<String, String> entry : entries) {
			map.put(entry.getKey(), entry.getValue());
		}
	}

	public String get(String key) {
		return map.get(key);
	}

	public boolean containsKey(String key) {
		return map.containsKey(key);
	}

	public void setID(int id) {
		this.id = id;
	}
	public int getID() {
		return this.id;
	}
}
