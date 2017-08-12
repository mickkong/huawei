package com.efficient.service.receiveaddr;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.efficient.bean.ReceiveAddr;
import com.efficient.daoImpl.ReceiveAddrDaoImpl;
import com.efficient.service.IService;

/**
 * 更新收货地址
 * @author HC
 * @Date 2017/07
 */
public class UpdateReceive_addrService implements IService{

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//设置文本类型
		response.setContentType("text/html");
		//获得文本输出流
		PrintWriter out=response.getWriter();
		//获取id
		int id=Integer.parseInt(request.getParameter("id"));
		
		//user_id
		int user_id=Integer.parseInt(request.getParameter("user_id"));
		//receiver收货人
		String receiver=request.getParameter("receiver");
		//收货地址
		String addr=request.getParameter("addr");
		
		//邮编
		String zipcode=request.getParameter("zipCode");
		//手机号码
		String phone=request.getParameter("phone");
		//默认地址
		int mark=Integer.parseInt(request.getParameter("mark"));
		//组装成对象
		ReceiveAddr receive_addr= new ReceiveAddr(id,user_id, receiver, addr, zipcode, phone, mark);
		
		//保存到数据库 返回int型
		int result=new ReceiveAddrDaoImpl().updateReceiveAddr(receive_addr);
		if(mark==1){
			//设为默认
			new ReceiveAddrDaoImpl().updateMark(id);
			//将其他的设为非默认
			new ReceiveAddrDaoImpl().updateNotMark(id);
		}
		//输出
		out.print(result);
	}
}
