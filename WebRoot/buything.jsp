<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <script type="text/javascript">
     
  </script>
  <body>
    This is my JSP page. <br>
    <form action="user?type=userList" method="post">
    	<input  type="text" name="uname">商品名
    	<input  type="text" name="num">数量
    	<input  type="text" name="money">单价
    	<input  type="text" name="productCode">商品编号
    	<input type="submit" value="立即结算">
    </form>
  	<a href="ShopCar?type=shopcar"><button>加入购物车</button></a>
  </body>
</html>
