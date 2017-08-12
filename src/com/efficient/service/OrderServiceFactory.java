package com.efficient.service;

import com.efficient.service.order.ClearOrderService;
import com.efficient.service.order.EvaOrderService;
import com.efficient.service.order.MyOrderService;
import com.efficient.service.order.MyOrderToMoneyService;
import com.efficient.service.order.MyPointService;
import com.efficient.service.order.OrderNowService;
import com.efficient.service.order.OrderPayMoneyService;
import com.efficient.service.order.OrderService;
import com.efficient.service.order.SureOrderService;

/**
 * 订单信息业务处理工厂
 * @author 雷雨田
 * @Date 2017/07
 */
public abstract class OrderServiceFactory {

	private OrderServiceFactory() {
		
	}

	/**
	 * 通过实例名获得
	 * 
	 * @param name
	 * @return
	 */
	public static IService getInstance(String name) {
		if(name.equals("orderInfo")){
			return new OrderService();
		}else if(name.equals("orderPayMoney")){
			return new OrderPayMoneyService();
		}else if(name.equals("orderDetail")){
			return new OrderNowService();
		}else if(name.equals("myOrder")){
			return new MyOrderService();
		}else if(name.equals("orderToMoney")){
			return new MyOrderToMoneyService();
		}else if(name.equals("clearOrder")){
			return new ClearOrderService();
		}else if(name.equals("sureOrder")){
			return new SureOrderService();
		}else if(name.equals("evaOrder")){
			return new EvaOrderService();
		}else if(name.equals("myPoint")){
			return new MyPointService();
		} 
		return null;
	}
}
