package cn.wangchenhui.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import cn.wangchenhui.model.SystemContext;

/** 
 * @author  Dust 
 * @date 2016-2-19 下午6:28:19 
 * @version 1.0 
 */
public class SystemContextFilter implements Filter{
	int pageSize;
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain filterChain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		 try {
	            int pageOffset = 0;
	            //pageSize = 15;
	            try {
	                pageOffset = Integer.parseInt(servletRequest.getParameter("pager.offset"));
	            } catch (NumberFormatException e) {
	                //e.printStackTrace();
	            }
	            SystemContext.setPageOffset(pageOffset);
	            SystemContext.setPageSize(pageSize);
	            filterChain.doFilter(servletRequest,servletResponse);
	        } finally {
	            SystemContext.removePageOffset();
	            SystemContext.removePageSize();
	        }
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		try {
            pageSize = Integer.parseInt(filterConfig.getInitParameter("pageSize"));
        } catch (NumberFormatException e) {
            pageSize = 15;
        }
		
	}
	
}
