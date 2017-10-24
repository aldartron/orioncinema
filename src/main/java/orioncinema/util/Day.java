package orioncinema.util;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class Day {

    private static String[] week = { "Воскресенье", "Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота"};

    public Day(Calendar calendar) {
        this.calendar = calendar;
    }

    public static List<Day> getDays(int count) {
        List<Day> days = new ArrayList<Day>();
        for (int i = 0; i < count; i++) {
            Calendar now = Calendar.getInstance();
            now.add(Calendar.DATE, i);
            days.add(new Day(now));
        }
        return days;
    }

    private Calendar calendar;

    public int getDay() {
        return calendar.get(Calendar.DATE);
    }

    public String getDayOfWeek() {
        return week[calendar.get(Calendar.DAY_OF_WEEK)-1];
    }

    public String getDateLine() {
        return "" + calendar.get(Calendar.YEAR) + "-" + (calendar.get(Calendar.MONTH) + 1) + "-" + getDay();
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
