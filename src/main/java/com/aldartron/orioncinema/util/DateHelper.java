package com.aldartron.orioncinema.util;

import java.util.Calendar;
import java.util.Date;

public class DateHelper {

    private static final String[] MONTH_LABEL_LIST = {"января", "февраля", "марта", "апреля", "мая", "июня", "июля", "августа", "сентября", "октября", "ноября", "декабря"};

    public static String getNiceDate(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return "" + calendar.get(Calendar.DATE) + " " + MONTH_LABEL_LIST[calendar.get(Calendar.MONTH)];
    }

    public String getStartAfterFirstSession(Date datetime) {
        // Количество минут после самого раннего возможного сеанса
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(datetime);
        int minutes = calendar.get(Calendar.MINUTE);
        int hours = calendar.get(Calendar.HOUR_OF_DAY);
        // 8:30 - самый ранний сеанс
        // TODO: create table with cinema info and take the first session time from there
        int result = minutes + (hours-8)*60 - 30;
        return null;
    }

    public static Calendar getFakeDate() {
        Calendar now = Calendar.getInstance();
        now.set(2017, Calendar.OCTOBER, 27, 18, 0);
        return now;
    }

}
