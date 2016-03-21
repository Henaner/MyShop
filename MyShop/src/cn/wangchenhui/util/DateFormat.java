package cn.wangchenhui.util;

import java.text.SimpleDateFormat;
import java.util.Date;
public class DateFormat {
	public static final String format="yyyy-MM-dd";
	public static final String longFormat = "yyyy-MM-dd HH:mm:ss";
	public static  SimpleDateFormat sdf = null;
	public static String formatDate(Date date){
		sdf = new SimpleDateFormat(format);
		return sdf.format(date);
	} 
	
	public static String formatLong(Date date){
		sdf = new SimpleDateFormat(longFormat);
		return sdf.format(date);
	}
	
	
}
