package com.efficient.service.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.efficient.bean.Evaluation;
import com.efficient.bean.OrderPartInfo;
import com.efficient.bean.OrderDetail;
import com.efficient.bean.OrderInfo;
import com.efficient.bean.OrderPartInfo;
import com.efficient.bean.ShoppingCar;
import com.efficient.bean.User;
import com.efficient.daoImpl.EvaluationDaoImpl;
import com.efficient.daoImpl.OrderDetailDaoImpl;
import com.efficient.daoImpl.OrderInfoDaoImpl;
import com.efficient.daoImpl.ShoppingCarDaoImpl;
import com.efficient.daoImpl.UserDaoImpl;
import com.efficient.service.IService;
import com.efficient.util.GenCode;

/**
 * 点击立即评价跳到此servlet进行业务处理
 * @author 雷雨田
 * @Date 2017/07
 */
public class EvaOrderService implements IService {

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//取得订单编号
		String orderNo=request.getParameter("orderNo");
		//更改订单的状态
		OrderInfo orderInfo=new OrderInfo(orderNo, "已完成");
		new OrderInfoDaoImpl().updatestate(orderInfo);
		//取得评论的等级
		int level=Integer.parseInt(request.getParameter("level"));
		//取得评论的内容
		String content=request.getParameter("content");
		
		//根据订单编号找到商品code
		List<OrderDetail> list=new OrderInfoDaoImpl().getProCodeByOrderNo(orderNo);
		//从cookie里面找到userid
		Cookie[] cookie=request.getCookies();
		int id=0;
		for (Cookie cookie2 : cookie) {
			if(cookie2.getName().equals("id")){
				id=Integer.parseInt(cookie2.getValue());
			}
		}
		for (int i = 0; i < list.size(); i++) {
			//userId为1
			Evaluation eva=new Evaluation(list.get(i).getProductCode(), id, level, new Timestamp(System.currentTimeMillis()), content, null, null);
			new EvaluationDaoImpl().insertEva(eva);
		}
		//转发到MyOrderServlet
		request.getRequestDispatcher("MyOrderServlet").forward(request, response);
		
	}
}
