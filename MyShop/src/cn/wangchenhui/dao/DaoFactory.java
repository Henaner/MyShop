package cn.wangchenhui.dao;

public class DaoFactory {
	/*静态工厂调用UserDao*/
	public static IUserDao getUserDao(){
		return new UserDao();
	}
	/*静态工厂调用ImageDao*/
	public static ISliderDao getSliderDao(){
		return new SliderDao();
	} 
}
