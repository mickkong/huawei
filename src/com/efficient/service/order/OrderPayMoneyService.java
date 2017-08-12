package com.efficient.service.order;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.efficient.bean.OrderInfo;
import com.efficient.bean.User;
import com.efficient.daoImpl.OrderInfoDaoImpl;
import com.efficient.daoImpl.UserDaoImpl;
import com.efficient.service.IService;

/**
 * 付款页面以及付款成功之后的业务
 * @author 雷雨田
 * @Date 2017/07
 */
public class OrderPayMoneyService implements IService {

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//获得商品编号
		String code=(String) request.getParameter("orderCode");
		//获得积分
		int point=Integer.parseInt(request.getParameter("point"));
		//获得用户的余额
		float yuE=Float.parseFloat(request.getParameter("yuE"));
		//付款金额
		float money=Float.parseFloat(request.getParameter("money"));
		//余额-付款金额
		float yuENow=Float.parseFloat(String.format("%.2f", yuE-money).toString());
		
		//取得user_id
		Cookie[] cookie=request.getCookies();
		int id=0;
		for (Cookie cookie2 : cookie) {
			if(cookie2.getName().equals("id")){
				id=Integer.parseInt(cookie2.getValue());
			}
		}
		
		//先查询出没有付款前的原始积分
		User user1 = new UserDaoImpl().getById(id);
		int point1=user1.getPoint();
		if(point1<100){
			point+=point1;
		}
		
		//更新订单表的订单状态为待收货
		OrderInfo orderInfo=new OrderInfo(code, "待收货", new Timestamp(System.currentTimeMillis()), new Timestamp(System.currentTimeMillis()),money);
		new OrderInfoDaoImpl().updateOrder(orderInfo);
		//更新用户表里面的积分和余额
		User user=new User(id, point,yuENow);
		new UserDaoImpl().updatePointBan(user);
		request.setAttribute("prePoint", point1);
		request.getRequestDispatcher("checkMoneySuccess.jsp").forward(request, response);
	}
}
