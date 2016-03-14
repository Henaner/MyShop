package cn.wangchenhui.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
public class DateFormat {
	public static final String format="yyyy-MM-dd";
	public static final SimpleDateFormat sdf = new SimpleDateFormat(format);
	public static String formatDate(Date date){
		return sdf.format(date);
	} 
	
	public static Date parseDate(String str) throws ParseException{
		return sdf.parse(str);
	}
	
	public static void main(String[] args) throws ParseException {
		System.out.println(parseDate("1992-06-22"));
	}
}
