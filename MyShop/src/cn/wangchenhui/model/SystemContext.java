package cn.wangchenhui.model;
/** 
 * @author  Dust 
 * @date 2016-2-19 下午3:50:41 
 * @version 1.0 
 */
public class SystemContext {
	private static ThreadLocal<Integer> pageSize = new ThreadLocal<Integer>();
	private static ThreadLocal<Integer> pageOffset = new ThreadLocal<Integer>();
	
	/*
	 * Those functions of pageSize;
	 */
	public static void setPageSize(int _pageSize){
		pageSize.set(_pageSize);
	}
	public static int getPageSize(){
		return pageSize.get();
	}
	public static void removePageSize(){
		pageSize.remove();
	}
	
	/*
	 * Those functions of pageOffset ;
	 */
	public static void setPageOffset(int _pageOffset){
		pageOffset.set(_pageOffset);
	}
	public static int getPageOffset(){
		return pageOffset.get();
	}
	public static void removePageOffset(){
		pageOffset.remove();
	}
	
	
	
}
