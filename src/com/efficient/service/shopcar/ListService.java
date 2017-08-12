package com.efficient.service.shopcar;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.efficient.bean.Product;
import com.efficient.bean.ShoppingCar;
import com.efficient.daoImpl.ProductDaoImpl;
import com.efficient.daoImpl.ShoppingCarDaoImpl;
import com.efficient.service.IService;
/**
 * 获取所有的购物车商品
 * @author HC
 * @Date 2017/07
 */
public class ListService implements IService{

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//创建商品List
		List<Product> proList=new ArrayList<Product>();
		int id=0;
		//获取cookie
		Cookie[] cookie=request.getCookies();
		for (Cookie cookie2 : cookie) {
			if(cookie2.getName().equals("id")){
				//从cookie中获取用户的id
				id=Integer.parseInt(cookie2.getValue());
			}
		}
		
		//当登录时
		if(id!=0){
			//new 出实现接口类
			List<ShoppingCar> shoppingList=new ShoppingCarDaoImpl().ListShoppingCar(id);
			//设置属性 购物车表
			request.setAttribute("ListShoppingCar", shoppingList);
			//判断shopping是否存在
			if(shoppingList.size()!=0){
				List<Product> productList=new ProductDaoImpl().getListProduct(id);
				//设置属性 购物车中对应的商品
				request.setAttribute("productList", productList);
				//算出所有商品数量的总价钱 设置属性
				request.setAttribute("sumPrice",new ShoppingCarDaoImpl().sumPrice(id));
			}
			for (Cookie cookie2 : cookie) {
				if(cookie2.getName().equals("shoppingCarList")){
					//删除shoppingCarList这个Cookie
					cookie2.setMaxAge(0);
					response.addCookie(cookie2);
				}
			}
		}else{
			//查看shoppingCarList是否存在
			int haveCookie=0;
			for (Cookie cookie2 : cookie) {
				if(cookie2.getName().equals("shoppingCarList")){
					haveCookie=1;
				}
			}
			//如果存在
			if(haveCookie==1){
			List<ShoppingCar> carList =null;
			for (Cookie cookie2 : cookie) {
				if(cookie2.getName().equals("shoppingCarList")){
					//获得shoppingCarList这个Cookie的值
					String jsonStr=cookie2.getValue();		
					//转为Json数组
					JSONArray jsonArray = JSONArray.fromObject(jsonStr);
					//转为List
					carList = JSONArray.toList(jsonArray, ShoppingCar.class);
					//设置属性
					request.setAttribute("carList", carList);
				}
			}
			
			for (ShoppingCar shoppingCar : carList) {
				//根据code查出product
				Product product=new ProductDaoImpl().ListProduct(shoppingCar.getProduct_code());
				proList.add(product);
			}
			//设置属性
			request.setAttribute("product", proList);
			}
		}
		request.setAttribute("id", id);
		//派发
		request.getRequestDispatcher("shoppingCar.jsp").forward(request, response);
	}
}
