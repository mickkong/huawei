package com.efficient.service.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
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
 * 点击取消订单跳到此servlet进行业务处理
 * @author 雷雨田
 * @Date 2017/07
 */
public class ClearOrderService implements IService {

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获得订单编号
		String orderNo=request.getParameter("orderNo");
		
		OrderInfo orderInfo=new OrderInfo(orderNo, "已取消");
		//更新订单状态为已取消
		new OrderInfoDaoImpl().updatestate(orderInfo);
		PrintWriter out=response.getWriter();
		out.print(1);
	}
}
