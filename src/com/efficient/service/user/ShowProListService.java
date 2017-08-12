package com.efficient.service.user;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.efficient.bean.PropertyValue;
import com.efficient.bean.ShowProOne;

import com.efficient.daoImpl.ShowProductDaoImpl;
import com.efficient.service.IService;
import com.google.gson.Gson;

/**
 * ShowProListService
 * @author 田锦辉
 * @Date 2017/07
 */
public class ShowProListService implements IService {
	
	
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 商品编号
		String code = request.getParameter("code");	
		
		// 这个字段不等于空
		if (code != null) {	
			//转换图片
			String change =request.getParameter("change");		
			
			if(change==null){
			// 单独的商品显示页面
			ShowProOne proOne = new ShowProductDaoImpl().getOne(code);
			String name = request.getParameter("name");
			// 属性值
			List<PropertyValue> valueList = new ShowProductDaoImpl()
					.getValue(name);
			request.setAttribute("proOne", proOne);
			request.setAttribute("valueList", valueList);
		
			request.getRequestDispatcher("showproone.jsp").forward(request,
					response);
			}else{	
				String color=request.getParameter("color");
				String proName=request.getParameter("proName");
				ShowProductDaoImpl dao1=new ShowProductDaoImpl();
				PropertyValue value = new PropertyValue();
				value.setPropertyName(proName);
				value.setValue(color);
				List<String> imgPath=dao1.findImgByNC(value);
				Gson gosn = new Gson();
				PrintWriter out = response.getWriter();
				String jsonAll = gosn.toJson(imgPath);
				out.print(jsonAll);
				out.flush();
				out.close();				
			}	
		} else {
			// 是否排序
			String sort = request.getParameter("sort");
			if (sort == null) {
				List<ShowProOne> list = new ShowProductDaoImpl().getList();
				request.setAttribute("showProList", list);
				request.getRequestDispatcher("showpro.jsp").forward(request,
						response);
			}else{
				List<ShowProOne> list = new ShowProductDaoImpl().getListSort(sort);
				request.setAttribute("showProList", list);
				request.getRequestDispatcher("showpro.jsp").forward(request,
						response);
			}
		}
	}
}
