package com.efficient.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.efficient.service.ShopCarServiceFactory;

/**
 * ShoppingCar Servlet
 * @author 雷雨田
 * @Date 2017/07
 */
public class ShoppingCarServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//获取类型
		String type=request.getParameter("type");
		//跳转
		ShopCarServiceFactory.getInstance(type).service(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
