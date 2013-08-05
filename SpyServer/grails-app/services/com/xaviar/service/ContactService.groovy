package com.xaviar.service

import redis.clients.jedis.Jedis

import com.org.krams.domain.UMetaData
import com.xaviar.domain.Contact

class ContactService {

	public static String CONTACT_KEY_PREFIX="CONTACT_";
	def Jedis jedis = new Jedis("localhost");

	public Contact create(Contact contact,String key) {
		String uuid = UUID.randomUUID().toString();
		String recordKey = CONTACT_KEY_PREFIX + uuid;
		jedis.hset(recordKey, "id", uuid);
		jedis.hset(recordKey, "name", contact.getName());
		jedis.hset(recordKey, "number", contact.getNumber());
		jedis.hset(recordKey, "type", contact.getType());

		jedis.sadd(key,recordKey);
		return contact;
	}

	public void createAll(List<Contact> contacts,UMetaData uMetaData) {
		String key = CONTACT_KEY_PREFIX + uMetaData.getSimSubscriberId()+"_"+uMetaData.getToken();
		for (Contact contact : contacts) {
			create(contact, key);
		}
	}

	public Contact read(String id) {
		String recordKey = CONTACT_KEY_PREFIX + id;
		Contact contact = new Contact();
		contact.setId((String) jedis.hget(recordKey, "id"));
		contact.setName((String) jedis.hget(recordKey, "name"));
		contact.setNumber((String) jedis.hget(recordKey, "number"));
		contact.setType((String) jedis.hget(recordKey, "type"));
		return contact;
	}

	public List<Contact> readAll(UMetaData uMetaData) {
		String key = CONTACT_KEY_PREFIX + uMetaData.getSimSubscriberId()+"_"+uMetaData.getToken();
		List<Contact> contacts = new ArrayList<Contact>();
		Collection<String> keys = jedis.smembers(key);
		for (String recordKey : keys) {
			Contact contact = new Contact();
			contact.setId((String) jedis.hget(recordKey, "id"));
			contact.setName((String) jedis.hget(recordKey, "name"));
			contact.setNumber((String) jedis.hget(recordKey, "number"));
			contact.setType((String) jedis.hget(recordKey, "type"));

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
		String recordKey = CONTACT_KEY_PREFIX + contact.getId();
		String existingRecord = (String) jedis.hget(recordKey, "id");

		if (existingRecord == null) {
			return null;
		}

		jedis.hset(recordKey, "name", contact.getName());
		jedis.hset(recordKey, "number", contact.getNumber());
		jedis.hset(recordKey, "type", contact.getType());

		return contact;
	}

	public Boolean delete(Contact contact,UMetaData uMetaData) {
		String key = CONTACT_KEY_PREFIX + uMetaData.getSimSubscriberId()+"_"+uMetaData.getToken();
		String recordKey = CONTACT_KEY_PREFIX + contact.getId();
		jedis.del(recordKey, "id");
		jedis.del(recordKey, "name");
		jedis.del(recordKey, "number");
		jedis.del(recordKey, "type");

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
