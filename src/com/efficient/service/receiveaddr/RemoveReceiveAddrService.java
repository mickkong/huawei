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
 * 删除收货地址
 * @author HC
 * @Date 2017/07
 */
public class RemoveReceiveAddrService implements IService{

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//设置文本类型
		response.setContentType("text/html");
		//获得文本输出流
		PrintWriter out=response.getWriter();
		//获得id
		int id=Integer.parseInt(request.getParameter("id"));
		
		//根据id找出该地址信息
		ReceiveAddr receiveAddr=new ReceiveAddrDaoImpl().oneReceiveAddr(id);
		//判断，输出  成功输出1  失败输出0
		if(receiveAddr.getMark()==1){
			out.print(0);
		}else{
			//根据id删除收货地址
			new ReceiveAddrDaoImpl().removeReceiveAddr(id);
			out.print(1);
		}
	}

}
