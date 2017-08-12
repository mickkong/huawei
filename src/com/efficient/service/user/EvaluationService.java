package com.efficient.service.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.efficient.bean.Evaluation;
import com.efficient.bean.Product;
import com.efficient.bean.ProductEva;
import com.efficient.daoImpl.ProductDaoImpl;
import com.efficient.daoImpl.UserDaoImpl;
import com.efficient.service.IService;

/**
 * 点击评价管理后跳到此servlet来处理
 * @author 雷雨田
 * @Date 2017/07
 */
public class EvaluationService implements IService {

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//从cookie里面取得userid
		int userId=0;
		Cookie[] cookie=request.getCookies();
		for (Cookie cookie1 : cookie) {
			if(cookie1.getName().equals("id")){
				userId=Integer.parseInt(cookie1.getValue());
			}
		}
		
		//取得评价表中的东西
		List<Evaluation> evaluation=new UserDaoImpl().getEvaluation(userId);
		
		request.setAttribute("evaluation", evaluation);
		//取得商品的东西
		List<ProductEva> product=new ProductDaoImpl().getProductByCode(userId);
		
		request.setAttribute("product", product);
		request.getRequestDispatcher("evaluation.jsp").forward(request, response);
	}

}
