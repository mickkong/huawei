package com.efficient.dao;

import java.util.List;

import com.efficient.bean.ReceiveAddr;

/**
 * 收货地址数据处理接口
 * @author 雷雨田
 * @Date 2017/07
 */
public interface IReceiveAddrDao {
	
	//查询所有
	List<ReceiveAddr> getReceiveAddrList(int userId);
	
	//添加
	int addReceiveAddr(ReceiveAddr receiveAddr);
	
	//移除
	int removeReceiveAddr(int id);
	
	//更新
	int updateReceiveAddr(ReceiveAddr receiveAddr);
	
	//修改默认地址
	int updateMark(int id);
	
	//修改非默认地址
	int updateNotMark(int id);
	
	//查询一条数据
	ReceiveAddr oneReceiveAddr(int id);
	
	//根据收货地址id和user_id查询收货地址
	String getAddr(ReceiveAddr addr);
}
