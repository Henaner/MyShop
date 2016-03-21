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
	/*静态工厂方法调用NoticeDao*/
	public static INoticeDao getNoticeDao(){
		return new  NoticeDao();
	}
	/*静态工厂的方法调用GoodsDao*/
	public static IGoodsDao getGoodsDao(){
		return new GoodsDao();
	}
	/*静态工厂的方法调用CartDao*/
	public static ICartDao getCartDao(){
		return new CartDao();
	}
	/*静态工厂方法掉用AddressDao*/
	public static IAddressDao getAddressDao(){
		return new AddressDao();
	}
	/*静态工厂方法掉用OderDao*/
	public static IOrderDao getOrderDao(){
		return new OrderDao();
	}
	/*静态工厂方法掉用CommentDao*/
	public static ICommentDao getCommentDao(){
		return new CommentDao();
	}
}
