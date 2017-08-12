<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'KD.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <script type="text/javascript" src="js/jquery-1.6.min.js"></script>
  </head>
  
  <body>
    <a href="javascript:;" onclick="send()">测试快递</a>
    <script type="text/javascript">
      $(function(){
        $.post( "FindExp?",{type:"圆通",postid:"885917777578154585"},function(data){
         	var lists = $.parseJSON(data);
         	for(var i=0;i<lists.length;i++){
         	   var list=lists[i];
         	   var listO=list.split("#");
         	   var time=listO[0];
         	   var msg=listO[1];
   	           var lab=$("<p>").text(""+time+"  "+ msg+"");	
		       $("#shows").append(lab);
         	}
       });     
      });
    </script>
    
    <div id="shows"></div>
  </body>
</html>
