package com.efficient.service;

import com.efficient.service.receiveaddr.AddReceive_addrService;
import com.efficient.service.receiveaddr.MarkService;
import com.efficient.service.receiveaddr.Receive_addListService;
import com.efficient.service.receiveaddr.RemoveReceiveAddrService;
import com.efficient.service.receiveaddr.UpdateReceive_addrService;

/**
 * 收货地址工厂
 * @author 雷雨田
 * @Date 2017/07
 */
public abstract class Receive_addrServiceFactory {

	private Receive_addrServiceFactory() {

	}
	
	/**
	 * 通过实例名获得
	 * 
	 * @param name
	 * @return
	 */
	public static IService getInstance(String type){
		//所有地址信息
		if(type.equals("addrList")){
			return new Receive_addListService();
		}
		//添加一条收货地址信息
		else if(type.equals("addReceive_addr")){
			return new AddReceive_addrService();
		}
		//删除一条收货地址信息
		else if(type.equals("removeReceive_addr")){
			return new RemoveReceiveAddrService();
		}
		//更新一条收货地址信息
		else if(type.equals("updateReceive_addr")){
			return new UpdateReceive_addrService();
		}
		else if(type.equals("mark")){
			return new 	MarkService();
		}
		return null;
	}
}
