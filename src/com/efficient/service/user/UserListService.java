package com.efficient.service.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.efficient.bean.ReceiveAddr;
import com.efficient.bean.User;
import com.efficient.daoImpl.ReceiveAddrDaoImpl;
import com.efficient.daoImpl.UserDaoImpl;
import com.efficient.service.IService;

/**
 * 获得积分
 * @author 雷雨田
 * @Date 2017/07
 */
public class UserListService implements IService {

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//从cookie里面取得userid
		Cookie[] cookie=request.getCookies();
		int id=0;
		for (Cookie cookie2 : cookie) {
			if(cookie2.getName().equals("id")){
				id=Integer.parseInt(cookie2.getValue());
			}
		}
		//查询用户id=1的所有收货地址信息
		List<ReceiveAddr> listAddr=new ReceiveAddrDaoImpl().getReceiveAddrList(id);
		request.setAttribute("listAddr", listAddr);
		
		//根据id查找用户信息
		User user = new UserDaoImpl().getById(id);
		request.setAttribute("productCode", request.getParameter("productCode"));
		//可以打折的积分
		int point=user.getPoint();
		//原始积分
		int prePoint=user.getPoint();
		if(point>=100){
			request.setAttribute("point", point);
		}else{
			request.setAttribute("point", 0);
		}
		request.setAttribute("prePoint", prePoint);
		request.getRequestDispatcher("checkOrderNow.jsp").forward(request, response);
	}
	
}
