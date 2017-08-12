package com.efficient.service.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.efficient.bean.OrderPartInfo;
import com.efficient.bean.User;
import com.efficient.daoImpl.OrderInfoDaoImpl;
import com.efficient.daoImpl.UserDaoImpl;
import com.efficient.service.IService;

/**
 * 我的积分页面
 * @author 雷雨田
 * @Date 2017/07
 */
public class MyPointService implements IService {

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//从cookie里面取得userID
		Cookie[] cookie=request.getCookies();
		int id=0;
		for (Cookie cookie2 : cookie) {
			if(cookie2.getName().equals("id")){
				id=Integer.parseInt(cookie2.getValue());
			}
		}
		
		//根据userid找到user的信息
		User user=new UserDaoImpl().getById(id);
		int point=user.getPoint();
		request.setAttribute("point", point);
		request.getRequestDispatcher("myPoint.jsp").forward(request, response);
	}

}

