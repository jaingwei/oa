package cn.oa.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserFilter implements Filter {

	@Override
	public void destroy() {
		System.out.println("过滤器销毁");
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		HttpSession session = request.getSession();
		String url = request.getRequestURI();
		System.out.println(url);
		if (url.indexOf("Prodeng")>0) {
			System.out.println("放行");
			arg2.doFilter(request, response);
			return;
		}
		Object obj = session.getAttribute("user");
		if (obj == null) {
			response.sendRedirect("/oa/Prodeng.jsp");
		}else{
			arg2.doFilter(request, response);
		}
		
		
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("过滤器初始化");
		
	}

}
