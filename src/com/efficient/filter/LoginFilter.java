package com.efficient.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 登录过滤器
 * 
 * @author 丁明俊
 * 
 */
public class LoginFilter implements Filter {

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		Cookie[] cookie=req.getCookies();
		int id =-1;
		if (cookie != null) {
			for (Cookie cookie2 : cookie) {
				if (cookie2.getName().equals("id")) {
					id = Integer.parseInt(cookie2.getValue());
				}
			}
		}
		String url = req.getRequestURL().toString();
		if (url.endsWith("/") || url.endsWith("login")
				|| url.endsWith("login.jsp") || id != -1
				|| url.endsWith(".css") || url.endsWith(".js")
				|| url.endsWith(".gif") || url.endsWith(".png")
				|| url.endsWith(".jpg") || url.endsWith("/user")
				|| url.endsWith("showproone.jsp")
				|| url.endsWith("index.jsp")
				|| url.endsWith("/shoppingCar")
				|| url.endsWith("/Series")||url.endsWith("regiest.jsp")
				|| url.endsWith("shoppingCar.jsp")) {
			chain.doFilter(request, response);
		} else {
			res.sendRedirect(req.getContextPath() + "/login.jsp");
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {

	}

}
