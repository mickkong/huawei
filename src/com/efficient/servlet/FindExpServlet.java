package com.efficient.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import com.google.gson.Gson;

/**
 * 查询快递servlet
 * @author 田锦辉
 * @Date 2017/07
 */
public class FindExpServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        //取得快递公司名字
		String type= request.getParameter("type");
		//取得快递单号
		String postid=request.getParameter("postid");
		
		//jdk1.7以前的比较方式
		String[] typeAry={"申通","EMS","顺丰","圆通","中通","韵达","天天","汇通",
				"全峰","德邦","宅急送"};
		String[] typeS={"shentong","EMS","shunfeng","yuantong","zhongtong",
				"yunda","tiantian","huitongkuaidi","quanfengkuaidi","debangwuliu","zhaijisong"};
		int j=0;
		
		for(int i=0;i<typeAry.length;i++){
			if(type.equals(typeAry[i])){
				j=i;
				break;
			}	
		}
		
		String typeO=typeS[j];	
		
		//数据交互操作
		Document jsondoc;
		try {
			jsondoc = Jsoup
					.connect(
							"http://www.kuaidi100.com/query?type="+typeO+"&postid="+postid+"")
					.timeout(10000).get();
			String jsonData = jsondoc.text();
			JSONObject jsonObject = new JSONObject(jsonData);
			JSONArray data = jsonObject.getJSONArray("data");
			
			System.out.println("查询结果：" + jsonObject.getString("message"));
			if (jsonObject.getString("message").equals("ok")) {
	    		List<String> listS=new ArrayList<String>();
	    		// 具体信息
				for (int i = data.length() - 1; i > 0; i--) {
					JSONObject object = data.getJSONObject(i);
					//把信息分成一行
					String str=object.getString("time")+"#" + object.getString("context");
					//加入list		
					listS.add(str);			
				}
				PrintWriter out = response.getWriter();
				Gson gson=new Gson();
				String jsonAll = gson.toJson(listS);
				out.print(jsonAll);
				out.flush();
				out.close();
			}

		} catch (IOException e) {
			e.printStackTrace();
			System.out.print("没找到！");
		}
	
		
		

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}