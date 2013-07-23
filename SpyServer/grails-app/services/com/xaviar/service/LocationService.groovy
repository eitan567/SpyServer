package com.xaviar.service;

import redis.clients.jedis.Jedis

import com.org.krams.domain.Location
import com.org.krams.domain.Role
import com.org.krams.domain.User

public class LocationService {

	def Jedis jedis = new Jedis("localhost");

	public User create(User user) {
		String key = "user" + user.getUsername();
		jedis.hset(key, "id", UUID.randomUUID().toString());
		jedis.hset(key, "firstName", user.getFirstName());
		jedis.hset(key, "lastName", user.getLastName());
		jedis.hset(key, "username", user.getUsername());
		jedis.hset(key, "password", user.getPassword());
		jedis.hset(key, "role", user.getRole().getRole().toString());

		jedis.sadd("user", key);
		return user;
	}

	public void createAll(List<Location> gpss,String key) {
		//String key = "userTest";
		for (Location gps : gpss) {
			//jedis.hset(key, "id", id);
			jedis.hset(key, "name", gps.getLocation());
			jedis.sadd("gps", key);
		}
	}

	public User read(String username) {
		String key = "user" + username;
		User user = new User();
		user.setId((String) jedis.hget(key, "id"));
		user.setFirstName((String) jedis.hget(key, "firstName"));
		user.setLastName((String) jedis.hget(key, "lastName"));
		user.setPassword((String) jedis.hget(key, "password"));
		user.setUsername((String) jedis.hget(key, "username"));
		return user;
	}

	public List<User> readAll() {
		List<User> users = new ArrayList<User>();

		Collection<String> fieldKeys = new HashSet<String>();
		fieldKeys.add("id");
		fieldKeys.add("firstName");
		fieldKeys.add("lastName");
		fieldKeys.add("username");
		fieldKeys.add("password");
		fieldKeys.add("role");

		Collection<String> keys = jedis.smembers("user");
		for (String key : keys) {
			User user = new User();
			user.setId((String) jedis.hget(key, "id"));
			user.setFirstName((String) jedis.hget(key, "firstName"));
			user.setLastName((String) jedis.hget(key, "lastName"));
			user.setPassword((String) jedis.hget(key, "password"));
			user.setUsername((String) jedis.hget(key, "username"));

			Role role = new Role();
			role.setRole(Integer.valueOf((String) jedis.hget(key, "role")));
			user.setRole(role);

			users.add(user);
		}

		return users;
	}

	public User update(User user) {
		String key = "user" + user.getUsername();
		String existingRecord = (String) jedis.hget(key, "id");

		if (existingRecord == null) {
			return null;
		}

		jedis.hset(key, "firstName", user.getFirstName());
		jedis.hset(key, "lastName", user.getLastName());
		jedis.hset(key, "role", user.getRole().getRole().toString());

		return user;
	}

	public Boolean delete(User user) {
		String key = "user" + user.getUsername();
		jedis.del(key, "id");
		jedis.del(key, "firstName");
		jedis.del(key, "lastName");
		jedis.del(key, "username");
		jedis.del(key, "password");
		jedis.del(key, "role");

		String existingRecord = (String) jedis.hget(key, "id");
		Boolean existingMember = jedis.srem("user", key);

		if (existingRecord != null) {
			return false;
		}

		if (existingMember == false) {
			return false;
		}

		return true;
	}
}
