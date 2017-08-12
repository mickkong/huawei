package com.efficient.dao;

import java.util.List;
import com.efficient.bean.OrderDetail;

/**
 * 订单明细数据处理接口
 * @author 雷雨田
 * @Date 2017/07
 */
public interface IOrderDetailDao {
	
	//根据订单编号找到明细表里的数据
	List<OrderDetail> getListByOrderNo(String orderNo);
	
	//获得所有订单明细表里的数据
	List<OrderDetail> getDetailList();

	//向订单明细表里添加订单明细
	int addDetail(OrderDetail orderDetail);

}
