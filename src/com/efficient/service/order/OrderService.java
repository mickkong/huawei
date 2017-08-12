package com.efficient.service.order;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.efficient.bean.OrderDetail;
import com.efficient.bean.OrderInfo;
import com.efficient.bean.ShoppingCar;
import com.efficient.bean.User;
import com.efficient.daoImpl.OrderDetailDaoImpl;
import com.efficient.daoImpl.OrderInfoDaoImpl;
import com.efficient.daoImpl.ShoppingCarDaoImpl;
import com.efficient.daoImpl.UserDaoImpl;
import com.efficient.service.IService;
import com.efficient.util.GenCode;

/**
 * 从购物车跳转过来提交订单后跳到此servlet进行业务处理
 * @author 雷雨田
 * @Date 2017/07
 */
public class OrderService implements IService {

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			//收货地址
			String address=request.getParameter("address");
			//收货地址id
			int addressId=Integer.parseInt(request.getParameter("addrId"));
			//实收金额
			float money = Float.parseFloat(request.getParameter("money"));
			//应收金额
			float allmoney = Float.parseFloat(request.getParameter("allmoney"));
			//获得的积分
			int point=Integer.parseInt(request.getParameter("userpoint"));
			
			OrderInfoDaoImpl oidi=new OrderInfoDaoImpl();
			//自动生成订单编号
			String orderCode=new GenCode().nextCode();
			//自动生成快递编号
			String expressCode=new GenCode().nextCode();
			
			//取得user_id
			Cookie[] cookie=request.getCookies();
			int id=0;
			for (Cookie cookie2 : cookie) {
				if(cookie2.getName().equals("id")){
					id=Integer.parseInt(cookie2.getValue());
				}
			}
			
			//插入数据的顺序：订单编号 用户id 收货地址id 订单状态   创建时间   支付时间    完成时间  应收金额   实收金额    快递名   快递编号
			OrderInfo orderInfo=new OrderInfo(orderCode, id, addressId, "待支付", new Timestamp(System.currentTimeMillis()),allmoney, 0.00f, null, null);
			//提交订单，支付状态为待支付
			oidi.insert(orderInfo);
			//根据用户id查询购物车里面的信息
			List<ShoppingCar> shopList=new ShoppingCarDaoImpl().ListShoppingCar(id);
			OrderDetailDaoImpl oddi=new OrderDetailDaoImpl();
			for (int i=0;i<shopList.size();i++) {
				//获得商品编号
				String productCode=shopList.get(i).getProduct_code();
				//获得商品的数量
				int num=shopList.get(i).getNum();
				System.out.println(productCode+"=="+num);
				//添加到订单明细表里面
				OrderDetail orderDetail=new OrderDetail(orderCode, productCode, num);
				oddi.addDetail(orderDetail);
				
			}
			
			//根据user_id查询出对应的余额
			UserDaoImpl udi=new UserDaoImpl();
			//余额
			float yuE=udi.getBalance(id);
			
			//删除userid=1的购物车表的数据订单
			new ShoppingCarDaoImpl().removeProduct(id);
			
			//将这些属性转发到checkMoney.jsp
			request.setAttribute("yuE", yuE);
			request.setAttribute("money", money);
			request.setAttribute("orderCode", orderCode);
			request.setAttribute("point", point);
			request.setAttribute("address", address);
			request.getRequestDispatcher("checkMoney.jsp").forward(request, response);
	}
}
