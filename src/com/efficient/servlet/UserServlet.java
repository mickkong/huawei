package com.efficient.servlet;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import com.efficient.bean.OrderInfo;
import com.efficient.service.UserServiceFactory;

/**
 * UserServlet
 * @author 雷雨田
 * @Date 2017/07
 */
public class UserServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获取类型
		String type = request.getParameter("type");
		//跳转
		UserServiceFactory.getInstance(type).service(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
