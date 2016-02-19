package cn.wangchenhui.util;

import java.io.IOException;
import java.util.Properties;
public class PropertiesUtil {
	private static Properties properties;
	public static Properties getProperties(){
		if(properties == null){
			try{
				properties = new Properties();
				properties.load(PropertiesUtil.class.getClassLoader().getResourceAsStream("jdbc.properties"));
			}catch(IOException e){
				e.printStackTrace();
			}
		}
		return properties;
	}
}
