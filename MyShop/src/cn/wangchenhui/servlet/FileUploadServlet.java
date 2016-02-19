package cn.wangchenhui.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

/**
 * Servlet implementation class FileUploadServlet
 */
@WebServlet("/fileUpload.do")
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		System.out.println(request.getSession().getServletContext().getRealPath("/"));
		InputStream input  = null;
		FileOutputStream fos = null;
		FileItemStream fis = null;
		if(isMultipart){
			ServletFileUpload upload = new ServletFileUpload();
			try {
				FileItemIterator iter = upload.getItemIterator(request);
				while(iter.hasNext()){
					fis = iter.next();
					String name = fis.getFieldName();
					input = fis.openStream();
					if(fis.isFormField()){
						System.out.println("this formField "+name+" with value "+Streams.asString(input)+" was detecteded");
						String spliter = ".";
						String fileType = fis.getName().split(spliter)[1];
						System.out.println(fileType);
					}else{
						System.out.println("this item "+name+" with value "+fis.getName()+" was detecteded");
						String path = request.getSession().getServletContext().getRealPath("/upload");
						path += "/"+fis.getName();
						fos = new FileOutputStream(path);
						byte[] buf = new byte[1024];
						int length = 0;
						while((length=input.read(buf))>0){
							fos.write(buf, 0, length);
						}
					}
				}
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				if(input != null){
					input.close();
				}
				if(fos != null){
					fos.close();
				}
			}
		}
	}

}
