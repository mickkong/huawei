package com.efficient.service.shopcar;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.efficient.bean.ShoppingCar;
import com.efficient.daoImpl.ShoppingCarDaoImpl;
import com.efficient.service.IService;
/**
 * 移除购物车
 * @author HC
 * @Date 2017/07
 */
public class RemoveService implements IService{

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//设置用户ID
		int userID=0;
		//设置文本输出流
		PrintWriter out=response.getWriter();
		//获取cookie
		Cookie[] cookie=request.getCookies();
		for (Cookie cookie2 : cookie) {
			if(cookie2.getName().equals("id")){
				//从cookie中获取用户的id
				userID=Integer.parseInt(cookie2.getValue());
			}
		}
		
		if(userID!=0){
			//获得id
			int id=Integer.parseInt(request.getParameter("id"));
			//通过id删除product
			int result=new ShoppingCarDaoImpl().removeProductBycode(id);
			//查出所有购物车表
			List<ShoppingCar> shoppingList=new ShoppingCarDaoImpl().ListShoppingCar(userID);
			if(shoppingList.size()!=0){
				//设置总价格
				request.setAttribute("sumPrice",new ShoppingCarDaoImpl().sumPrice(userID));
			}else{
				request.setAttribute("sumPrice",0);
			}
			out.print(result);
		}else{
			List<ShoppingCar> carList =null;
			Cookie[] cookie1=request.getCookies();
			String code=request.getParameter("code");
 			for (Cookie cookie2 : cookie1) {
 				if(cookie2.getName().equals("shoppingCarList")){
 					//获得shoppingCarList这个Cookie的值
 					String jsonStr=cookie2.getValue();	
 					//转为Json数组
					JSONArray jsonArray = JSONArray.fromObject(jsonStr);
					//转为List
					carList = JSONArray.toList(jsonArray, ShoppingCar.class);
					Iterator<ShoppingCar> it=carList.iterator();
					//迭代器
					while(it.hasNext()){	
						ShoppingCar sp=it.next();
						//如果相同
						if(sp.getProduct_code().equals(code)){
							//移除
							it.remove();
						}
					}
 				}
			}
 			
 			//添加到cookies
			JSONArray array = JSONArray.fromObject(carList);
			Cookie cookie2 =new Cookie("shoppingCarList", array.toString()); 
			cookie2.setMaxAge(60*60*24);
			response.addCookie(cookie2);
		}
		out.print(1);
	}
}
