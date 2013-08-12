package com.spy.tools;

import org.joda.time.Period
import org.joda.time.format.PeriodFormatter
import org.joda.time.format.PeriodFormatterBuilder

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
}
