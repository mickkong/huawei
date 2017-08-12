package com.efficient.service.shopcar;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.efficient.bean.Product;
import com.efficient.bean.ReceiveAddr;
import com.efficient.bean.ShoppingCar;
import com.efficient.bean.User;
import com.efficient.daoImpl.ProductDaoImpl;
import com.efficient.daoImpl.ReceiveAddrDaoImpl;
import com.efficient.daoImpl.ShoppingCarDaoImpl;
import com.efficient.daoImpl.UserDaoImpl;
import com.efficient.service.IService;

/**
 * 点击购物车里的去结算后跳到此页面进行业务处理
 * @author 雷雨田
 * @Date 2017/07
 */
public class ShopCarService implements IService{
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//从cookie里面取得userid
		Cookie[] cookie=request.getCookies();
		int id=0;
		for (Cookie cookie2 : cookie) {
			if(cookie2.getName().equals("id")){
				id=Integer.parseInt(cookie2.getValue());
			}
		}
		
		if(id==0){
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}else{
		//查询用户id=1的所有收货地址信息
		List<ReceiveAddr> listAddr=new ReceiveAddrDaoImpl().getReceiveAddrList(id);
		request.setAttribute("listAddr", listAddr);
		
		ShoppingCarDaoImpl soi=new ShoppingCarDaoImpl();
		//查询user_id=1,状态为未支付的购物车的商品信息
		List<ShoppingCar> shop=soi.ListShoppingCarByState(id);
		request.setAttribute("shopList", shop);
		
		ProductDaoImpl pdi=new ProductDaoImpl();
		//连表查询找到购物车里状态为1,且user_id=1的商品的信息
		List<Product> product=pdi.getProductBystate(id);
		request.setAttribute("productList", product);
		//获取原始积分
		User user = new UserDaoImpl().getById(id);
		
		int point=user.getPoint();
		int prePoint=user.getPoint();
		if(point>=100){
			request.setAttribute("point", point);
		}else{
			request.setAttribute("point", 0);
		}
		request.setAttribute("prePoint", prePoint);
		request.getRequestDispatcher("checkOrderByCar.jsp").forward(request, response);
	}
		}
}
