package com.aldartron.orioncinema.util;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class Day {

    private static String[] WEEK_LABEL_LIST = { "Воскресенье", "Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота"};

    public Day(Calendar calendar) {
        this.calendar = calendar;
    }

    public static List<Day> getDays(Calendar start, int count) {
        List<Day> days = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            Calendar now = Calendar.getInstance();
            now.setTime(start.getTime());
            now.add(Calendar.DATE, i);
            days.add(new Day(now));
        }
        return days;
    }

    private Calendar calendar;

    public String getNiceDate() {
        return DateHelper.getNiceDate(calendar.getTime());
    }

    public int getDay() {
        return calendar.get(Calendar.DATE);
    }

    public String getDayOfWeek() {
        return WEEK_LABEL_LIST[calendar.get(Calendar.DAY_OF_WEEK)-1];
    }

    public String getDateLine() {
        return new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime());
    }

    public Calendar getCalendar() {
        return calendar;
    }

    public void setCalendar(Calendar calendar) {
        this.calendar = calendar;
    }

    @Override
    public String toString() {
        return getDateLine();
    }

}
