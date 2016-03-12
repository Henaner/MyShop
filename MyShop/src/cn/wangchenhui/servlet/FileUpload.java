package cn.wangchenhui.servlet;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;

/**
 * Servlet implementation class FileUpload
 */
//@WebServlet("/FileUpload.do")
public class FileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	        //System.out.println(isMultipart);
	        FileOutputStream fos = null;
	        InputStream is = null;
	        Calendar calendar = Calendar.getInstance();
	        int year = calendar.get(Calendar.YEAR);//年
	        int month = calendar.get(Calendar.MONTH)+1; //这个是月份，要+1
	        int day = calendar.get(Calendar.DAY_OF_MONTH);//日
	        int hour = calendar.get(Calendar.HOUR);
	        int minute = calendar.get(Calendar.MINUTE);
	        int seconde = calendar.get(Calendar.SECOND);
	        int rndNum = (int)(Math.random()*1000+1);
	        String name = String.valueOf(year)+String.valueOf(month)+String.valueOf(day)+String.valueOf(hour)+String.valueOf(minute)+String.valueOf(seconde)+String.valueOf(rndNum);
	        if(isMultipart){
	            ServletFileUpload fileUpload = new ServletFileUpload();
	            try {
	                FileItemIterator iter = fileUpload.getItemIterator(request);
	                while (iter.hasNext()){
	                    FileItemStream fis = iter.next();
	                    is = fis.openStream();
	                    //isFormField方法用来判断是否是普通的表单域
	                    if(fis.isFormField()){
	                        System.out.println(fis.getFieldName());
	                        Streams.asString(is);
	                    }else{
	                        //如果不是表单域的话，则表示是文件，通过该方法可以获得文件的名称
	                        System.out.println(fis.getName());
	                        String path = request.getSession().getServletContext().getRealPath("/upload");
	                        System.out.println("path:"+path);
	                        int position = fis.getName().lastIndexOf(".");
	                        String fileExtension = fis.getName().substring(position,fis.getName().length());
	                        System.out.println(fileExtension);
	                        path = path+"/"+name+fileExtension;
	                        fos = new FileOutputStream(path);
	                        byte[] buffer = new byte[1024];
	                        int len = 0;
	                        while((len = is.read(buffer)) > -1)
	                            fos.write(buffer,0,len);
	                    }
	                }
	            } catch (FileUploadException e) {
	                e.printStackTrace();
	            }finally{
	                if(is != null){
	                    is.close();
	                }
	                if(fos != null){
	                    fos.close();
	                }
	            }
	        }
	}

}
