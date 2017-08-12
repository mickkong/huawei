package com.efficient.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.efficient.bean.ShowProOne;
import com.efficient.daoImpl.ShowProductDaoImpl;

/**
 * 系列排序
 * @author 田锦辉
 * @Date 2017/07
 */
public class ShowProSeries extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

      String ser=request.getParameter("ser");
      ShowProductDaoImpl  dao=new ShowProductDaoImpl() ;
      List<ShowProOne>  listp= dao.getListSeries(ser);
      request.setAttribute("showProList", listp);
	  request.getRequestDispatcher("showpro.jsp").forward(request,
				response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}