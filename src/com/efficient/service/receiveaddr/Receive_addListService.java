package com.efficient.service.receiveaddr;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.efficient.bean.ReceiveAddr;
import com.efficient.daoImpl.ReceiveAddrDaoImpl;
import com.efficient.service.IService;

/**
 * 展示所有收货地址
 * @author HC
 * @Date 2017/07
 */
public class Receive_addListService implements IService{

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//获取cookie
		Cookie[] cookie=request.getCookies();
		//foreach  遍历
		for (Cookie cookie2 : cookie) {
			if(cookie2.getName().equals("id")){
				//获取id
				int id=Integer.parseInt(cookie2.getValue());
				//获取该用户的所有收货地址
				List<ReceiveAddr> list=new ReceiveAddrDaoImpl().getReceiveAddrList(id);
				//设置属性
				request.setAttribute("receive_addrList",list);
				//派发
				request.getRequestDispatcher("receiveAddr.jsp").forward(request, response);
			}
		}
	}
}
