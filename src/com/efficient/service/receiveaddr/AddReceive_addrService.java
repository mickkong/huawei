package com.efficient.service.receiveaddr;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.efficient.bean.ReceiveAddr;
import com.efficient.daoImpl.ReceiveAddrDaoImpl;
import com.efficient.service.IService;

/**
 * 添加收货地址， 
 * @author HC
 * @Date 2017/07
 */
public class AddReceive_addrService implements IService{

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//设置类型
		response.setContentType("text/html");
		//设置文本输出流
		PrintWriter out=response.getWriter();
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
		//调用ReceiveAddrDaoImpl的getReceiveAddrList的方法
		List<ReceiveAddr> receiveAddr=new ReceiveAddrDaoImpl().getReceiveAddrList(user_id);
		//当第一次添加时，设为默认
		if(receiveAddr.size()==0){
			mark=1;
		}
		//组装成对象
		ReceiveAddr receive_addr= new ReceiveAddr(user_id, receiver, addr, zipcode, phone, mark);
		//调用ReceiveAddrDaoImpl的addReceiveAddr的方法
		new ReceiveAddrDaoImpl().addReceiveAddr(receive_addr);
		
		//获取ID
		int id=receive_addr.getId();
		//保存到数据库 返回int型
		if(receive_addr.getMark()==1){
			new ReceiveAddrDaoImpl().updateNotMark(id);
		}
		//输出
		out.print(1);
	}

}
