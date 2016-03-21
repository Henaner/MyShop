package cn.wangchenhui.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;


/**
 * Servlet implementation class FileUpload
 */
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
		getParaValue(request, response);
		response.sendRedirect("/MyShop/lockPages/admin/imgSucc.jsp");
	}
	
	
	//这个函数很重要
	
	protected void getParaValue(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			if(ServletFileUpload.isMultipartContent(request)) {
				request = new MultipartRequestWrapper(request);
				
			}
		}
	}

