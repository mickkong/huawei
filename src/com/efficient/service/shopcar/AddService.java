package com.efficient.service.shopcar;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
 * 添加商品到购物车
 * @author HC
 * @Date 2017/07
 */
public class AddService implements IService{

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//获得文本输出流
		PrintWriter out=response.getWriter();
		//创建一个List
		List<ShoppingCar> list=new ArrayList<ShoppingCar>();
		//设置id为0
		int userId=0;
		
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
		
		//从参数中取得商品数量
		int num=Integer.parseInt(request.getParameter("num"));
		//从参数取得商品编码
		String product_code=request.getParameter("product_code");
		//new dao层
		ShoppingCarDaoImpl dao=new ShoppingCarDaoImpl();
		//创建一个新对象1
		ShoppingCar shoppingCar=new ShoppingCar();
		
		if(userId!=0){
			//添加属性值
			shoppingCar.setNum(num);
			shoppingCar.setProduct_code(product_code);
			shoppingCar.setUser_id(userId);
			//查询该商品是否存在购物车
			ShoppingCar shoppingCar1=dao.selectByCode(shoppingCar);
			if(shoppingCar1==null){
				//没有该商品，添加
				dao.insert(shoppingCar);
				out.print(1);
			}else{
				//有该商品，插入
				shoppingCar1.setNum(shoppingCar1.getNum() + shoppingCar.getNum());
				dao.updateNum(shoppingCar1);
				out.print(0);
			}
			//没有登录
		}else{
			//获取用户cookie
			Cookie[] cookies2=request.getCookies();
			//foreach循环 查找出所有的cookie
			
			if(cookies2.length==1){//没有购物车
				//设置属性值
				shoppingCar.setNum(num);
				shoppingCar.setProduct_code(product_code);
				//添加到List中
				list.add(shoppingCar);
				//转为json数组
				JSONArray array = JSONArray.fromObject(list);
				//创建cookie
				Cookie cookie1 =new Cookie("shoppingCarList", array.toString()); 
				//设置最大时间
				cookie1.setMaxAge(60*60*24);
				//添加
				response.addCookie(cookie1);
				
				
			}else{//添加购物车
				List<ShoppingCar> carList =null;
				for (Cookie cookie2 : cookies2) {
					//是否存在shoppingCarList的Cookie
					if(cookie2.getName().equals("shoppingCarList")){
						//获取shoppingCarList的值
						String jsonStr=cookie2.getValue();
						//转为json集合
						JSONArray jsonArray = JSONArray.fromObject(jsonStr);
						//转为List
						carList = JSONArray.toList(jsonArray, ShoppingCar.class);
						//创建迭代器
						Iterator<ShoppingCar> it=carList.iterator();
						//用于测试数组的长度
						int ij=0;
						//迭代器
						while(it.hasNext()){	
							ShoppingCar sp=it.next();
							//如果code相同
							if(sp.getProduct_code().equals(product_code)){
								//数量增加
								int num1=sp.getNum()+num;	
								//设置属性值
								sp.setNum(num1);		
							}else{
								ij++;
							}
						}
						if(ij==carList.size()){//都没找到
							ShoppingCar shoppingCar2=new ShoppingCar();
							shoppingCar2.setNum(num);
							shoppingCar2.setProduct_code(product_code);
							//直接添加到List
							carList.add(shoppingCar2);
						}
						break;
					}
				}
				
				//添加到cookies
				JSONArray array = JSONArray.fromObject(carList);
				Cookie cookie1 =new Cookie("shoppingCarList", array.toString()); 
				cookie1.setMaxAge(60*60*24);
				response.addCookie(cookie1);
			}
		}
	}
}
