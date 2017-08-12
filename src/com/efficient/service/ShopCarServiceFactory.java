package com.efficient.service;

import com.efficient.service.shopcar.AddService;
import com.efficient.service.shopcar.ListService;
import com.efficient.service.shopcar.RemoveService;
import com.efficient.service.shopcar.ShopCarService;
import com.efficient.service.shopcar.UpdateNumService;

/**
 * 购物车业务处理工厂
 * @author 雷雨田
 * @Date 2017/07
 */
public abstract class ShopCarServiceFactory {

	private ShopCarServiceFactory() {
		
	}

	/**
	 * 通过实例名获得
	 * 
	 * @param name
	 * @return
	 */
	public static IService getInstance(String name) {
		if (name.equals("shopcar")) {
			return new ShopCarService();
		}else if(name.equals("list")){
			return new ListService();
		}else if(name.equals("remove")){
			return new RemoveService();
		}else if(name.equals("add")){
			return new AddService();
		}else if(name.equals("updateNum")){
			return new UpdateNumService();
		}
		return null;
	}
}
