package com.efficient.dao;

import java.util.List;

import com.efficient.bean.OrderAndProduct;
import com.efficient.bean.OrderDetail;
import com.efficient.bean.OrderInfo;
import com.efficient.bean.OrderPartInfo;

/**
 * 订单数据处理接口
 * @author 雷雨田
 * @Date 2017/07
 */
public interface IOrderInfoDao {
	
	//获取所有的订单信息
	List<OrderInfo> getOrderList();
	
	//获取部分订单信息（主要用于解决el表达式不支持下划线的问题）
	List<OrderPartInfo> getPartOrder(int id);
	
	//根据状态获得部分订单信息
	List<OrderPartInfo> getPartByState(OrderPartInfo state);
	
	//修改订单的状态
	int updatestate(OrderInfo orderInfo);
	
	//根据编号查找商品code
	List<OrderDetail> getProCodeByOrderNo(String orderNo);
	
	//更新订单信息
	int updateOrder(OrderInfo orderInfo);
	
	//更新创建日期
	int updateCreateDate(OrderInfo orderInfo);

	//插入订单信息
	int insert(OrderInfo orderinfo);
	
	//连表查询订单信息
	List<OrderAndProduct> selectOrderInfo();
	
	//根据订单状态连表查询订单信息
	List<OrderAndProduct> getOrderByState(String state);
	
	//根据订单编号查询收货地址id
	int getAddrIdByOrderNo(String orderNo);
}
