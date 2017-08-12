package com.efficient.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.efficient.service.OrderServiceFactory;
import com.efficient.service.UserServiceFactory;

/**
 * 订单信息的servlet
 * @author 雷雨田
 * @Date 2017/07
 */
public class OrderInfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//传进来一个参数
		String type = request.getParameter("type");
		//根据参数调用不同的service
		OrderServiceFactory.getInstance(type).service(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
