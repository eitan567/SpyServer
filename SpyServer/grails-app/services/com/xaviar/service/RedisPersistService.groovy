package com.xaviar.service

import redis.clients.jedis.Jedis

import com.org.krams.domain.Contact

class RedisPersistService {

	def Jedis jedis = new Jedis("localhost");

	public Contact create(Contact contact,String key) {

		jedis.hset(key, "name", contact.getName());
		jedis.hset(key, "number", contact.getNumber());
		jedis.hset(key, "type", contact.getType());

		jedis.sadd("contact", key);
		return contact;
	}

	public void createAll(List<Contact> contacts,String key) {
		for (Contact contact : contacts) {
			create(contact, key);
			jedis.sadd("contact", key);
		}
	}

	public Contact read(String id) {
		String key = "contact" + id;
		Contact contact = new Contact();
		contact.setId((String) jedis.hget(key, "id"));
		contact.setName((String) jedis.hget(key, "name"));
		contact.setNumber((String) jedis.hget(key, "number"));
		contact.setType((String) jedis.hget(key, "type"));
		return contact;
	}

	public List<Contact> readAll() {
		List<Contact> contacts = new ArrayList<Contact>();

		Collection<String> fieldKeys = new HashSet<String>();
		fieldKeys.add("id");
		fieldKeys.add("name");
		fieldKeys.add("number");
		fieldKeys.add("type");

		Collection<String> keys = jedis.smembers("contact");
		for (String key : keys) {
			Contact contact = new Contact();
			contact.setId((String) jedis.hget(key, "id"));
			contact.setName((String) jedis.hget(key, "name"));
			contact.setNumber((String) jedis.hget(key, "number"));
			contact.setType((String) jedis.hget(key, "type"));

			contacts.add(contact);
		}

		Collections.sort(contacts, new Comparator<Contact>() {
					public int compare(Contact o1, Contact o2) {
						return o1.getName().compareTo(o2.getName());
					}
				});

		return contacts;
	}

	public Contact update(Contact contact) {
		String key = "contact" + contact.getId();
		String existingRecord = (String) jedis.hget(key, "id");

		if (existingRecord == null) {
			return null;
		}

		jedis.hset(key, "name", contact.getName());
		jedis.hset(key, "number", contact.getNumber());
		jedis.hset(key, "type", contact.getType());

		return contact;
	}

	public Boolean delete(Contact contact) {
		String key = "contact" + contact.getId();
		jedis.del(key, "id");
		jedis.del(key, "name");
		jedis.del(key, "number");
		jedis.del(key, "type");

		String existingRecord = (String) jedis.hget(key, "id");
		Boolean existingMember = jedis.srem("contact", key);

		if (existingRecord != null) {
			return false;
		}

		if (existingMember == false) {
			return false;
		}

		return true;
	}

	def serviceMethod() {
	}
}
