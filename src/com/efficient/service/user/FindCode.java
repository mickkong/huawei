package com.efficient.service.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.efficient.bean.DescBean;
import com.efficient.bean.ShowProOne;
import com.efficient.daoImpl.ShowProductDaoImpl;
import com.efficient.service.IService;
import com.google.gson.Gson;

public class FindCode implements IService {

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 取得传进来的字符串
		String msg = request.getParameter("msg");
		// 商品名
		String name = request.getParameter("name");
		// 拼接为查找字符串
		String color = null;
		String zhis = null;
		String rongl = null;
		String desc = null;
		if (msg.length() == 55) {
			color = msg.substring(1, 4);
			rongl = msg.substring(16, 24).trim();
			zhis = msg.substring(30, 38).trim();
			desc = color + "," + zhis + "," + rongl;
		} else {
			color = msg.substring(1, 3);
			rongl= msg.substring(15, 24).trim();
			zhis= msg.substring(29, 38).trim();
			desc = color + "," + zhis + "," + rongl;
		}

		// 去查找取得编号
		ShowProductDaoImpl dao = new ShowProductDaoImpl();
		DescBean dsb = new DescBean();
		dsb.setDescContent(desc);
		dsb.setProName(name);
		String proCode = dao.fingCode(dsb);

		if(proCode==null){
			String desc1=rongl+","+zhis+","+color;
			DescBean dsb1 = new DescBean();
			dsb1.setDescContent(desc1);
			dsb1.setProName(name);
			proCode = dao.fingCode(dsb1);
		}	
		
		
		Gson gosn = new Gson();
		PrintWriter out = response.getWriter();

		if (proCode != null) {
			ShowProOne pone = new ShowProOne();
			pone.setProCode(proCode);

			float price = dao.fingProOne(pone).getPrice();
			String jsonCode = gosn.toJson(proCode + "#" + price);
			out.print(jsonCode);
			out.flush();
			out.close();
		} else {
			out.print(1);
			out.flush();
			out.close();
		}

	}

}
