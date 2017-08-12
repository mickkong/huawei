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
 * 更新数量
 * @author HC
 * @Date 2017/07
 */
public class UpdateNumService implements IService{

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int userId=0;
		PrintWriter out=response.getWriter();
		//获取用户cookie
		Cookie[] cookies=request.getCookies();
		//foreach循环 查找出所有的cookie
		for (Cookie cookie : cookies) {
			//获取name为“id“ 的cookie
			if(cookie.getName().equals("id")){
				//从cookie中获取用户的id
				userId=Integer.parseInt(cookie.getValue());
			}
		}
		
		if(userId!=0){
			//获取id
			int id=Integer.parseInt(request.getParameter("id"));
			//获取num
			int num=Integer.parseInt(request.getParameter("num"));
			//添加对象
			ShoppingCar shoppingCar=new ShoppingCar();
			shoppingCar.setId(id);
			shoppingCar.setNum(num);
			//更新数量
			int result=new ShoppingCarDaoImpl().updateNum(shoppingCar);
			out.print(result);
		}else{
			//获取code
			String code=request.getParameter("code");
			//获取num
			int num=Integer.parseInt(request.getParameter("num"));
			List<ShoppingCar> carList =null;
			Cookie[] cookie1=request.getCookies();
 			for (Cookie cookie2 : cookie1) {
 				if(cookie2.getName().equals("shoppingCarList")){
 					//如果存在shoppinCarList这个Cookie,获取值
 					String jsonStr=cookie2.getValue();
 					//转为json数组
					JSONArray jsonArray = JSONArray.fromObject(jsonStr);
					//转为List
					carList = JSONArray.toList(jsonArray, ShoppingCar.class);
					Iterator<ShoppingCar> it=carList.iterator();
					//迭代器
					while(it.hasNext()){	
						ShoppingCar sp=it.next();
						//如果相同
						if(sp.getProduct_code().equals(code)){
							sp.setNum(num);
						}
					}
 				}
			}
 			
 			//添加到cookies
			JSONArray array = JSONArray.fromObject(carList);
			Cookie cookie2 =new Cookie("shoppingCarList", array.toString()); 
			cookie2.setMaxAge(60*60*24);
			response.addCookie(cookie2);
 			out.print(1);
		}
	}

}
