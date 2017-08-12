package com.efficient.dao;

import java.util.List;


import com.efficient.bean.DescBean;
import com.efficient.bean.Product;
import com.efficient.bean.PropertyValue;
import com.efficient.bean.ShoppingCar;
import com.efficient.bean.ShowProOne;


/**
 * 商品展示接口  显示商品图片路径，商品名，商品单价，商品评价数量
 * @author 田锦辉
 *
 */
public interface IShowProductDao {
	/**
	 * 返回单个商品的显示类型集合
	 * @param category
	 * @return
	 */
    List<ShowProOne> getList();
    
    /**
	 * 返回单个商品的显示类型集合按系列分组
	 * @param category
	 * @return
	 */
    List<ShowProOne> getListSeries(String ser);
    
      
    /**
	 * 传去排序的方式 返回单个商品的显示类型集合
	 * @param category
	 * @return
	 */
    List<ShowProOne> getListSort(String sortType);
    
    /**
     * 传入编号，返回单个商品显示类型
     * @param code
     * @return
     */
    ShowProOne getOne(String code);
    
    /**
     * 传入编号返回属性值类型
     * @param code
     * @return
     */
    public List<PropertyValue> getValue(String code);
    
    /**
     * 插入到购物车(没有判断是否有重复)
     * @param shopCar
     */
    int saveToShopCar(ShoppingCar shopCar);
    
    /**
     * 返回图片路径
     * @param proName 商品名
     * @param proColor 商品颜色
     * @return
     */
    List<String> findImgByNC(PropertyValue value);
    
    /**
     * 返回编号
     * @param dsb
     * @return 编号
     */
    String fingCode(DescBean dsb);
    
    
    /**
     * 找到商品
     * @param code 商品编号
     * @return
     */
    Product fingProOne(ShowProOne pone);
       
}
