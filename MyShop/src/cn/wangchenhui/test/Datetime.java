package cn.wangchenhui.test;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Datetime {
	public static final String format = "yyyy/MM/dd HH:mm:ss";
	public static void main(String[] args) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		Date date = new Date();
		System.out.println(sdf.format(date));
		System.out.println(sdf.format(date).length());
	}
}
