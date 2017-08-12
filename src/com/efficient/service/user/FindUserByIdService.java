package com.efficient.service.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSON;

import com.efficient.bean.User;
import com.efficient.daoImpl.UserDaoImpl;
import com.efficient.service.IService;
import com.google.gson.Gson;

public class FindUserByIdService implements IService {

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获得文本输出流
		PrintWriter out=response.getWriter();
		//获取id
		int id=Integer.parseInt(request.getParameter("id"));
		//调用UserDaoImpl的getById方法
		User user=new UserDaoImpl().getById(id);
		//使用gson方法
		Gson gson=new Gson();
		String name=user.getRealname();
		String idCard=user.getIdcard();
		String bCard=user.getBankcard();
		if(name!=null){
			//存在。
			String gsonStr=gson.toJson(name+"#"+idCard+"#"+bCard);
			out.print(gsonStr);
			out.flush();
			out.close();
		}else{
			//不存在
			out.print(0);
		}
	}

}
