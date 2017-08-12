package com.efficient.service.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.efficient.bean.User;
import com.efficient.daoImpl.UserDaoImpl;
import com.efficient.service.IService;

public class CheckAccService implements IService{

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//设置文本输出流
		PrintWriter out=response.getWriter();
		//获取属性name
		String name=request.getParameter("name");
		//调用UserDaoImpl中的getByName方法
		User user=new UserDaoImpl().getByName(name);
		//判断
		if(user==null){
			//没有该用户返回0
			out.print(0);
		}else{
			//有该用户返回1
			out.print(1);
		}
	}

}
