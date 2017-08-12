package com.efficient.dao;

import java.util.List;

import com.efficient.bean.ShoppingCar;

/**
 * shoppingCar接口层
 * @author 雷雨田
 * @Date 2017/07
 */
public interface IShoppingCarDao {

	//查询所有
	List<ShoppingCar> ListShoppingCar(int id);
	
	//查询所有状态为1的购物车数据
	List<ShoppingCar> ListShoppingCarByState(int id);
	
	//根据传入的userid删除购物车表里的数据
	int removeProduct(int id);
	
	//根据传入的购物车中的商品id删除购物车表里的数据
	int removeProductBycode(int id);
	
	//计算总价钱
	float sumPrice(int userId);
	
	//查询该商品是否存在购物车
	ShoppingCar selectByCode(ShoppingCar shoppingCar);
	
	//插入数据
	int insert(ShoppingCar shoppingCar);
	
	//更新数据
	int updateNum(ShoppingCar shoppingCar);
}
