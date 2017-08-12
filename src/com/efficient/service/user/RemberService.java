package com.efficient.service.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.efficient.service.IService;

public class RemberService implements IService{

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		//获取属性
		String account=request.getParameter("account");
		Cookie accCookie=new Cookie("account",account);
		accCookie.setMaxAge(60*60*24*30);
		response.addCookie(accCookie);
		out.print(account);
	}
}
