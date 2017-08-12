package com.efficient.service.order;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.efficient.bean.OrderPartInfo;
import com.efficient.bean.OrderDetail;
import com.efficient.bean.OrderInfo;
import com.efficient.bean.OrderPartInfo;
import com.efficient.bean.ShoppingCar;
import com.efficient.bean.User;
import com.efficient.daoImpl.OrderDetailDaoImpl;
import com.efficient.daoImpl.OrderInfoDaoImpl;
import com.efficient.daoImpl.ShoppingCarDaoImpl;
import com.efficient.daoImpl.UserDaoImpl;
import com.efficient.service.IService;
import com.efficient.util.GenCode;

/**
 * 点击主页面的我的订单跳到此servlet进行业务处理
 * @author 雷雨田
 * @Date 2017/07
 */
public class MyOrderService implements IService {

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//从cookie里面去的userid
		Cookie[] cookie=request.getCookies();
		int id=0;
		for (Cookie cookie2 : cookie) {
			if(cookie2.getName().equals("id")){
				id=Integer.parseInt(cookie2.getValue());
			}
		}
		//查询订单信息
		List<OrderPartInfo> partList=new OrderInfoDaoImpl().getPartOrder(id);
		request.setAttribute("partList", partList);
		//待支付订单
		List<OrderPartInfo> noPayList=new OrderInfoDaoImpl().getPartByState(new OrderPartInfo(id, "待支付"));
		request.setAttribute("noPayList", noPayList);
		//待评价订单
		List<OrderPartInfo> noEvaList=new OrderInfoDaoImpl().getPartByState(new OrderPartInfo(id, "待评价"));
		request.setAttribute("noEvaList", noEvaList);
		//待收货订单
		List<OrderPartInfo> noRecList=new OrderInfoDaoImpl().getPartByState(new OrderPartInfo(id, "待收货"));
		request.setAttribute("noRecList", noRecList);
		//已完成订单
		List<OrderPartInfo> finishList=new OrderInfoDaoImpl().getPartByState(new OrderPartInfo(id, "已完成"));
		request.setAttribute("finishList", finishList);
		//已取消订单
		List<OrderPartInfo> cutOffList=new OrderInfoDaoImpl().getPartByState(new OrderPartInfo(id, "已取消"));
		request.setAttribute("cutOffList", cutOffList);

		request.getRequestDispatcher("myOrder.jsp").forward(request, response);
	}

}
