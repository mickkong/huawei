package com.efficient.dao;

import java.util.List;

import com.efficient.bean.Product;
import com.efficient.bean.ProductEva;

/**
 * 商品类的接口层
 * @author 雷雨田
 * @Date 2017/07
 */
public interface IProductDao {

	//查询一条数据
	Product ListProduct(String code);
	//查询所有数据
	List<Product> getListProduct(int userid);
	//查询所有数据
	List<Product> getProductBystate(int userid);
	//查询所有数据
	List<ProductEva> getProductByCode(int userid);
	
}
