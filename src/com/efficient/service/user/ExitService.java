package com.efficient.service.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.efficient.service.IService;

public class ExitService implements IService{

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Cookie[] cookie=request.getCookies();
		for (Cookie cookie1 : cookie) {
			if(cookie1.getName().equals("id")){
				cookie1.setMaxAge(0);
				response.addCookie(cookie1);
			}
			if(cookie1.getName().equals("name")){
				cookie1.setMaxAge(0);
				response.addCookie(cookie1);
			}
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
