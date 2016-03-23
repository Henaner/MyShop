package cn.wangchenhui.servlet;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.commons.io.FilenameUtils;

import cn.wangchenhui.dao.DaoFactory;
import cn.wangchenhui.dao.IGoodsDao;
import cn.wangchenhui.dao.ISliderDao;
import cn.wangchenhui.model.Goods;
import cn.wangchenhui.model.SliderImg;
import cn.wangchenhui.util.DateFormat;

/** 
 * @author  Dust 
 * @date 2016-3-16 上午9:47:24 
 * @version 1.0 
 */
public class UploadGoodsReqeustWrapper extends HttpServletRequestWrapper{
	public static Goods goods = new Goods();
    public static IGoodsDao goodsDao = DaoFactory.getGoodsDao();
    public static String fileExtension= "";
	Map<String,String[]> params = new HashMap<String,String[]>();
    public static final String PATH = "D:/Workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/MyShop/upload/goodsImg";
	public  UploadGoodsReqeustWrapper(HttpServletRequest request) {
		// TODO Auto-generated constructor stub
		super(request);
		setParams(request);
	}
	
	private void setParams(HttpServletRequest request) {
		 String name = "";
		try {
			//1、判断是否是multipart类型
			boolean isMul = ServletFileUpload.isMultipartContent(request);
			 Calendar calendar = Calendar.getInstance();
		        int year = calendar.get(Calendar.YEAR);//年
		        int month = calendar.get(Calendar.MONTH)+1; //这个是月份，要+1
		        int day = calendar.get(Calendar.DAY_OF_MONTH);//日
		        int hour = calendar.get(Calendar.HOUR_OF_DAY);
		        int minute = calendar.get(Calendar.MINUTE);
		        int seconde = calendar.get(Calendar.SECOND);
		        int rndNum = (int)(Math.random()*1000+1);
		        
		        name = String.valueOf(year)+String.valueOf(month)+String.valueOf(day)+String.valueOf(hour)+String.valueOf(minute)+String.valueOf(seconde)+String.valueOf(rndNum);
			if(isMul) {
				ServletFileUpload upload = new ServletFileUpload();
				FileItemIterator iter = upload.getItemIterator(request);
				InputStream is = null;
				while(iter.hasNext()) {
					FileItemStream fis = iter.next();
					is = fis.openStream();
					if(fis.isFormField()) {
						setFormParam(fis.getFieldName(),is);
					} else {
						//要输入流中有数据才进行上传操作
						if(is.available()>0) {
							//对于IE而言，上传的文件或获取完整的绝对路径，此时就需要仅仅获取绝对路径中的文件名
							
							String fname = FilenameUtils.getName(fis.getName());
							System.out.println(fname);
							int position = fis.getName().lastIndexOf(".");
	                        fileExtension = fis.getName().substring(position,fname.length());
	                        System.out.println(fileExtension);
							//完成文件上传，并且自动关闭流
							Streams.copy(is,new FileOutputStream(PATH+"/"+name+fileExtension),true);
							//fis.getFieldName表示获取表单域的名称，getName表示获取文件的名称
							
						}
					}
				}
			} else {
				//如果不是multipart直接通过请求获取值
				params = request.getParameterMap();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		int user_id = Integer.parseInt(getParameter("user_id"));
		String goods_id = name;
		String goods_title = getParameter("goods_title");
		String img_name = name+fileExtension;
		String goods_desc = getParameter("goods_desc");
		float price = Float.parseFloat(getParameter("goods_price"));
		int stock = Integer.parseInt(getParameter("goods_stock"));
		String post_date = DateFormat.formatLong(new Date());
		int curr_stock = stock;
		String goods_type = getParameter("iCheck");
		if(goods_type==null||"".equals(goods_type)){
			goods_type = "";
		}
		String goods_status = "在架";
		
		goods.setUser_id(user_id);
		goods.setGoods_title(goods_title);
		goods.setGoods_id(goods_id);
		goods.setGoods_status(goods_status);
		goods.setGoods_desc(goods_desc);
		goods.setPost_date(post_date);
		goods.setPrice(price);
		goods.setGoods_type(goods_type);
		goods.setStock(stock);
		goods.setCurr_stock(curr_stock);
		goods.setImg_name(img_name);
		try{
			goodsDao.add(goods);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	private void setFormParam(String fieldName, InputStream is) throws IOException {
		if(params.containsKey(fieldName)) {
			//说明表单域中已经存在了值，这个时候就需要往params的String的数组中添加
			String[] values = params.get(fieldName);
			//让数组长度加1
			values = Arrays.copyOf(values, values.length+1);
			//添加到数组中
			values[values.length-1] = Streams.asString(is);
			params.put(fieldName, values);
		} else {
			params.put(fieldName, new String[]{Streams.asString(is)});
		}
	}

	@Override
	public Map<String,String[]> getParameterMap() {
		return params;
	}
	
	@Override
	public String getParameter(String name) {
		String[] values = params.get(name);
		if(values!=null) {
			return values[0] ;
		}
		return null;
	}
	
	@Override
	public String[] getParameterValues(String name) {
		String[] values = params.get(name);
		if(values!=null) {
			return values;
		}
		return null;
	}

}
