package com.efficient.service.receiveaddr;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.efficient.daoImpl.ReceiveAddrDaoImpl;
import com.efficient.service.IService;

/**
 * 默认地址
 * @author HC
 * @Date 2017/07
 */
public class MarkService implements IService{

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//获得文本输出流
		PrintWriter out=response.getWriter();
		//获得id
		int id=Integer.parseInt(request.getParameter("id"));
		//设为默认
		int updMark=new ReceiveAddrDaoImpl().updateMark(id);
		//将其他所有收货地址设为不默认
		new ReceiveAddrDaoImpl().updateNotMark(id);
		//输出
		if(updMark==1){
			out.print(1);
		}
	}
}
