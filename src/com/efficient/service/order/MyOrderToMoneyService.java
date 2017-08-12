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
import com.efficient.bean.ReceiveAddr;
import com.efficient.bean.ShoppingCar;
import com.efficient.bean.User;
import com.efficient.daoImpl.OrderDetailDaoImpl;
import com.efficient.daoImpl.OrderInfoDaoImpl;
import com.efficient.daoImpl.ReceiveAddrDaoImpl;
import com.efficient.daoImpl.ShoppingCarDaoImpl;
import com.efficient.daoImpl.UserDaoImpl;
import com.efficient.service.IService;
import com.efficient.util.GenCode;

/**
 * 点击我的订单里的立即付款跳到此servlet进行业务处理
 * @author 雷雨田
 * @Date 2017/07
 */
public class MyOrderToMoneyService implements IService {

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//获得订单编号
		String orderNo=request.getParameter("orderNo");
		//实收金额
		float amt=Float.parseFloat(request.getParameter("amt"));
		
		//先查询出没有付款前的原始积分 获取当前用户的id
		Cookie[] cookie=request.getCookies();
		int id=0;
		for (Cookie cookie2 : cookie) {
			if(cookie2.getName().equals("id")){
				id=Integer.parseInt(cookie2.getValue());
			}
		}
		
		User user=new UserDaoImpl().getById(id);
		int pointPre=user.getPoint();
		//积分
		int point=Math.round(amt/10)+pointPre;
		//根据user_id查询出对应的余额
		UserDaoImpl udi=new UserDaoImpl();
		//余额
		float yuE=udi.getBalance(id);
		
		OrderInfo orderInfo=new OrderInfo(orderNo, new Timestamp(System.currentTimeMillis()));
		//更新下单时间
		new OrderInfoDaoImpl().updateCreateDate(orderInfo);
		
		//根据订单编号获得收货地址id
		int addrId=new OrderInfoDaoImpl().getAddrIdByOrderNo(orderNo);
		ReceiveAddr rece=new ReceiveAddr(addrId, id);
		String address=new ReceiveAddrDaoImpl().getAddr(rece);
		//将这些属性转发到checkMoney.jsp
		request.setAttribute("yuE", yuE);
		request.setAttribute("money", amt);
		request.setAttribute("orderCode", orderNo);
		request.setAttribute("point", point);
		request.setAttribute("address", address);
		
		request.getRequestDispatcher("checkMoney.jsp").forward(request, response);
	}

}
