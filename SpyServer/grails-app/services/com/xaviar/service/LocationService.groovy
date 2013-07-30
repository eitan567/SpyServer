package com.xaviar.service;

import redis.clients.jedis.Jedis

import com.org.krams.domain.Location
import com.org.krams.domain.UMetaData

public class LocationService {

	public static String LOCATION_KEY_PREFIX="LOCATION_";
	def Jedis jedis = new Jedis("localhost");

	public Location create(Location location,String key) {
		String uuid = UUID.randomUUID().toString();
		String recordKey = LOCATION_KEY_PREFIX + uuid;
		jedis.hset(recordKey, "id", uuid);
		jedis.hset(recordKey, "latitude", location.getLatitude());
		jedis.hset(recordKey, "longitude", location.getLongitude());
		jedis.hset(recordKey, "time", location.getTime());
		jedis.sadd(key,recordKey);
		return location;
	}

	public void createAll(List<Location> locations,UMetaData uMetaData) {
		String key = LOCATION_KEY_PREFIX + uMetaData.getSimSubscriberId()+"_"+uMetaData.getToken();
		for (Location location : locations) {
			create(location, key);
		}
	}

	public Location read(String id) {
		String recordKey = LOCATION_KEY_PREFIX + id;
		Location location = new Location();
		location.setId((String) jedis.hget(recordKey, "id"));
		location.setLatitude((String) jedis.hget(recordKey, "latitude"));
		location.setLongitude((String) jedis.hget(recordKey, "longitude"));
		location.setTime((String) jedis.hget(recordKey, "time"));
		return location;
	}

	public List<Location> readAll(UMetaData uMetaData) {
		String key = LOCATION_KEY_PREFIX + uMetaData.getSimSubscriberId()+"_"+uMetaData.getToken();
		List<Location> locations = new ArrayList<Location>();
		Collection<String> keys = jedis.smembers(key);
		for (String recordKey : keys) {
			Location location = new Location();
			location.setId((String) jedis.hget(recordKey, "id"));
			location.setLatitude((String) jedis.hget(recordKey, "latitude"));
			location.setLongitude((String) jedis.hget(recordKey, "longitude"));
			location.setTime((String) jedis.hget(recordKey, "time"));

			locations.add(location);
		}

		Collections.sort(locations, new Comparator<Location>() {
					public int compare(Location o1, Location o2) {
						return o1.getTime().compareTo(o2.getTime());
					}
				});

		return locations;
	}

	public Location update(Location location) {
		String recordKey = LOCATION_KEY_PREFIX + location.getId();
		String existingRecord = (String) jedis.hget(recordKey, "id");

		if (existingRecord == null) {
			return null;
		}

		jedis.hset(recordKey, "latitude", location.getLatitude());
		jedis.hset(recordKey, "longitude", location.getLongitude());
		jedis.hset(recordKey, "time", location.getTime());

		return location;
	}

	public Boolean delete(Location location,UMetaData uMetaData) {
		String key = LOCATION_KEY_PREFIX + uMetaData.getSimSubscriberId()+"_"+uMetaData.getToken();
		String recordKey = LOCATION_KEY_PREFIX + location.getId();
		jedis.del(recordKey, "id");
		jedis.del(recordKey, "latitude");
		jedis.del(recordKey, "longitude");
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
