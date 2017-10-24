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

}
