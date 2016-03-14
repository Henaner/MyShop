package cn.wangchenhui.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/** 
 * @author  Dust 
 * @date 2016-3-13 下午5:29:36 
 * @version 1.0 
 */
public class CharEncodingFilter implements Filter {
	String encoding ;
	public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        servletRequest.setCharacterEncoding(encoding);
        filterChain.doFilter(servletRequest,servletResponse);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        encoding = filterConfig.getInitParameter("encoding");
        if(encoding == null || "".equals(encoding)){
            encoding = "UTF-8";
        }else{
            encoding = filterConfig.getInitParameter("encoding");
        }
    }
}
