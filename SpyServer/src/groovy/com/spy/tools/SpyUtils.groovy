package com.spy.tools;

import org.joda.time.Period
import org.joda.time.format.PeriodFormatter
import org.joda.time.format.PeriodFormatterBuilder

import com.google.code.geocoder.Geocoder
import com.google.code.geocoder.GeocoderRequestBuilder
import com.google.code.geocoder.model.GeocodeResponse
import com.google.code.geocoder.model.GeocoderRequest
import com.google.code.geocoder.model.GeocoderResult
import com.google.code.geocoder.model.GeocoderStatus
import com.google.code.geocoder.model.LatLng
import com.google.i18n.phonenumbers.NumberParseException
import com.google.i18n.phonenumbers.PhoneNumberUtil
import com.google.i18n.phonenumbers.PhoneNumberUtil.PhoneNumberFormat
import com.google.i18n.phonenumbers.Phonenumber.PhoneNumber

public class SpyUtils {

	def static messageSource = {}

	public static String formatPhoneNumber(String phoneNumber) {
		PhoneNumberUtil phoneUtil = PhoneNumberUtil.getInstance();
		PhoneNumber phoneNumberObj = null;
		try {
			phoneNumberObj = phoneUtil.parse(phoneNumber, "IL");
		} catch (NumberParseException e) {
			//e.printStackTrace();
			return phoneNumber;
		}

		boolean isValid = phoneUtil.isValidNumber(phoneNumberObj);
		if (isValid) {
			return phoneUtil.format(phoneNumberObj, PhoneNumberFormat.NATIONAL);
		} else {
			return phoneNumber;
		}
	}

	public static String formatPeriod(int periodInSec) {
		//String days = messageSource.getMessage("sms.label",null,"sms.label",Locale.getDefault());
		PeriodFormatter daysHoursMinutes = new PeriodFormatterBuilder()
				.appendDays()
				.appendSuffix(" יום", " ימים")
				.appendSeparator(" ו- ")
				.appendHours()
				.appendSuffix(" שעה", " שעות")
				.appendSeparator(" ו- ")
				.appendMinutes()
				.appendSuffix(" דקה", " דקות")
				.appendSeparator(" ו- ")
				.appendSeconds()
				.appendSuffix(" שנייה", " שניות")
				.toFormatter();

		Period period = new Period(0, 0, periodInSec,0);

		return daysHoursMinutes.print(period.normalizedStandard());
	}

	public static String formatPhoneNumberForSQL(String phoneNumber) {
		PhoneNumberUtil phoneUtil = PhoneNumberUtil.getInstance();
		PhoneNumber phoneNumberObj = null;
		try {
			phoneNumberObj = phoneUtil.parse(phoneNumber, "IL");
		} catch (NumberParseException e) {
			//e.printStackTrace();
			return phoneNumber;
		}

		boolean isValid = phoneUtil.isValidNumber(phoneNumberObj);
		if (isValid) {
			return phoneNumberObj.nationalNumber;
		} else {
			return phoneNumber;
		}
	}

	public static String getCountryCode(String phoneNumber) {
		PhoneNumberUtil phoneUtil = PhoneNumberUtil.getInstance();
		PhoneNumber phoneNumberObj = null;
		try {
			phoneNumberObj = phoneUtil.parse(phoneNumber, "IL");
		} catch (NumberParseException e) {
			//e.printStackTrace();
			return null;
		}

		boolean isValid = phoneUtil.isValidNumber(phoneNumberObj);
		if (isValid) {
			return phoneNumberObj.countryCode;
		} else {
			return null;
		}
	}

	public static List<GeocoderResult> getGeocode(Double lat, Double lng) throws Exception {
		final Geocoder geocoder = new Geocoder();
		
		GeocoderRequest geocoderRequest = new GeocoderRequestBuilder().setLocation(new LatLng(lat, lng)).setLanguage("he").getGeocoderRequest();
		GeocodeResponse geocoderResponse = geocoder.geocode(geocoderRequest);
		
		if(geocoderResponse !=null && geocoderResponse.getStatus()==GeocoderStatus.OK && !geocoderResponse.getResults().isEmpty()){
			return geocoderResponse.getResults();
			//assertTrue(geocoderResult.getTypes().contains(GeocoderResultType.STREET_ADDRESS.value()));
		}else{
			println ("no address found for lat=" + lat + " lng=" + lng);
			return null;
		}
	}
}
