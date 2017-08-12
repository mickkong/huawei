package com.efficient.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.efficient.service.Receive_addrServiceFactory;

/**
 * 收货地址servlet
 * @author 雷雨田
 * @Date 2017/07
 */
public class ReceiveAddrServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//取得参数类型
		String type=request.getParameter("type");
		//调用工厂方法
		Receive_addrServiceFactory.getInstance(type).service(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//调用doget方法
		this.doGet(request, response);
	}

}
