package com.efficient.service.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.efficient.bean.User;
import com.efficient.daoImpl.UserDaoImpl;
import com.efficient.service.IService;

public class RegiestService implements IService{

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		User user=new User();
		String name=request.getParameter("name");
		String pwd=request.getParameter("pwd");
		user.setName(name);
		user.setPwd(pwd);
		user.setPhone(name);
		int result=new UserDaoImpl().register(user);
		if(result==1){
			out.print(result);
		}
	}

}
