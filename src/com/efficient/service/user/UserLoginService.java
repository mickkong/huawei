package com.efficient.service.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.efficient.bean.Product;
import com.efficient.bean.ShoppingCar;
import com.efficient.bean.User;
import com.efficient.daoImpl.ProductDaoImpl;
import com.efficient.daoImpl.ShoppingCarDaoImpl;
import com.efficient.daoImpl.UserDaoImpl;
import com.efficient.service.IService;

/**
 * 用户登录
 * @author hc
 * @Date 2017/07
 */
public class UserLoginService implements IService{

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id=0;
		//设置文本输出流
		PrintWriter out = response.getWriter();
		//获取属性
		String account=request.getParameter("account");
		String password=request.getParameter("pwd");
		//添加对象
		User user=new User();
		//给对象添加属性值
		user.setName(account);
		user.setPwd(password);
		//调用UserDaoImpl中的login方法登录
		User us=new UserDaoImpl().login(user);
		//判断
		if(us!=null){
			id=us.getId();
			//此"1"应该为用户id！！！注意！！！
			Cookie cookie=new Cookie("id", id+"");
			//设置最长时间
			cookie.setMaxAge(60*60);
			//添加Cookie
			response.addCookie(cookie);
			
			//应该为用户name！！！注意！！！
			Cookie accCookie=new Cookie("name", account);
			//设置最长时间
			cookie.setMaxAge(60*60);
			//添加Cookie
			response.addCookie(accCookie);
			
			List<ShoppingCar> carList =null;
			Cookie[] cookie1=request.getCookies();
 			for (Cookie cookie2 : cookie1) {
 				if(cookie2.getName().equals("shoppingCarList")){
 					String jsonStr=cookie2.getValue();				
					JSONArray jsonArray = JSONArray.fromObject(jsonStr);
					carList = JSONArray.toList(jsonArray, ShoppingCar.class);
					Iterator<ShoppingCar> it=carList.iterator();
					//迭代器
					while(it.hasNext()){	
						ShoppingCar sp=it.next();
						sp.setUser_id(id);
						sp.setState(1);
					}
 				}
			}
 			for (Cookie cookie2 : cookie1) {
 				if(cookie2.getName().equals("shoppingCarList")){
 					//new dao层
 					ShoppingCarDaoImpl dao=new ShoppingCarDaoImpl();
 					for (ShoppingCar shoppingCar : carList) {
 						System.out.println(shoppingCar);
 						//查询该商品是否存在购物车
 						ShoppingCar shoppingCar1=dao.selectByCode(shoppingCar);
 						if(shoppingCar1==null){
 							//没有该商品，添加
 							dao.insert(shoppingCar);
 							System.out.println("tianjia");
 						}else{
 							//有该商品，插入
 							shoppingCar1.setNum(shoppingCar1.getNum() + shoppingCar.getNum());
 							dao.updateNum(shoppingCar1);
 							System.out.println("charu");
 						}
 					}
 				}
 			}
 			//账号正确
 			out.print(1);
		}else{
			
			//账号不正确
			out.print(0);
		}
	}
}
