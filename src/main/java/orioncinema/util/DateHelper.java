package orioncinema.util;

import java.util.Calendar;
import java.util.Date;

public class DateHelper {

    public static final String[] months = {"января", "февраля", "марта", "апреля", "мая", "июня", "июля", "августа", "сентября", "октября", "ноября", "декабря"};

    public static String getNiceDate(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return "" + calendar.get(Calendar.DATE) + " " + months[calendar.get(Calendar.MONTH)];
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
        return "FUCK";
    }

}
