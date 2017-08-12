package com.efficient.service.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.efficient.bean.User;
import com.efficient.daoImpl.UserDaoImpl;
import com.efficient.service.IService;

/**
 * 实名认证service
 * @author hc
 * @Date 2017/07
 */
public class ValidateService implements IService{

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获取文本输出流
		PrintWriter out=response.getWriter();
		//获取用户id
		int user_id=0;
		Cookie[] cookie=request.getCookies();
		for (Cookie cookie2 : cookie) {
			if(cookie2.getName().equals("id")){
				user_id=Integer.parseInt(cookie2.getValue());
			}
		}
		//获取名字
		String name=request.getParameter("name");
		//获取身份证号
		String ID=request.getParameter("ID");
		//获取银行卡号
		String card=request.getParameter("card");
		//创建对象
		User user=new User();
		//赋值
		user.setId(user_id);
		user.setRealname(name);
		user.setIdcard(ID);
		user.setBankcard(card);
		//调用UserDaoImpl的validateRealName方法
		int result= new UserDaoImpl().validateRealName(user);
		if(result==1){
			//成功返回1
			out.print(1);
		}else{
			//失败返回0
			out.print(0);
		}
	}
}
