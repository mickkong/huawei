<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" hre f="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/shopCar.css">
	<link rel="stylesheet" href="css/initialize.css">
	<link  rel="icon" href="images/hw.jpg">
	<title>华为商城官网-荣耀9、华为P10、华为Mate9、荣耀V9、荣耀8青春版、荣耀6X、华为nova2、华为手环、华为平板、华为笔记本官方网站</title>
	<script type="text/javascript" src="js/jquery-1.6.min.js"></script>
		<script type="text/javascript">
		$(function(){
			var cookies=document.cookie.split(";");
			for(var i=0;i<cookies.length;i++){
				var temp=cookies[i].split("=");
					if(temp[0].trim()=="name"){
						document.getElementById("firstRegiest").style.display="none";
						document.getElementById("firstLogin").innerHTML=temp[1]+"的个人中心";
						$("#firstLogin").attr("href","order?type=myOrder");
					}
				}
			});	
		
		//删除数据库数据
		function removeProduct(e){
			var id=$(e).parent().parent().find("td").eq(0).text();
			$.post("shoppingCar?type=remove",{id:id},function(data){
				if(data==1){
					$(e).parent().parent().remove();
					location.href="shoppingCar?type=list";
				}
			});
		}
		
		//删除cookie数据
		function removeCookie(e){
			var code=$(e).parent().parent().find("td").eq(0).text();
			$.post("shoppingCar?type=remove",{code:code},function(data){
				if(data==1){
					$(e).parent().parent().remove();
					location.href="shoppingCar?type=list";
				}
				});
			}
		
		//数量  cookie
		function sumCookiePrice(e){
			var num=document.getElementById("num").value;
			var code=$(e).parent().parent().find("td").eq(0).text();
			$.post("shoppingCar?type=updateNum",{num:num,code:code},function(data){
			if(data==1){
				location.href="shoppingCar?type=list";
				}
			});
		}
		
		//数据库商品数量
		function sumPrice(e){
			var num=document.getElementById("num").value;
			document.getElementById("num").value=num;
			var id=$(e).parent().parent().find("td").eq(0).text()
			$.post("shoppingCar?type=updateNum",{num:num,id:id},function(data){
			if(data==1){
				location.href="shoppingCar?type=list";
				}
			});
		}
		</script>
	
</head>
<body>
<!-- 头部 --><div>
	
</div>
<div class="head">
		<div class="head_short">
				<div class="header_left">
					<ul>
						<li><a href="#">华为官网</a></li>
						<li><a href="#">荣耀官网</a></li>
						<li><a href="#">花粉俱乐部</a></li>
						<li><a href="#">帮助中心</a></li>
						<li><a href="#">v码(优购码)</a></li>
						<li><a href="#">Select&nbsp;Region</a></li>
						<li><a href="#">更多精彩 <span class="tubiao"></span></a>
							<div class="tubiao_hover">
									<P class="tubiao_hover_p"><a href="#" class="tubiao_a">EMUI</a></P>
									<P class="tubiao_hover_p"><a href="#" class="tubiao_a">应用市场</a></P>
									<P class="tubiao_hover_p"><a href="#" class="tubiao_a">云服务</a></P>
									<P class="tubiao_hover_p"><a href="#" class="tubiao_a">开发者联盟</a></P>
									<P class="tubiao_hover_p1">
										<img src="images/ewm.jpg">
										<p class="tubiao_a">扫一扫 ,下载客户端</p>
									</P>
							</div>
						</li>
					</ul>
				</div>
				<div class="header_right">
					<ul >
						<li class="header_right_li"><a id="firstLogin" href="login.jsp">请登录</a></li>
						<li class="header_right_li"><a id="firstRegiest" href="regiest.jsp">注册</a></li>
						<li class="header_right_li"><a href="order?type=myOrder">我的订单</a></li>
					</ul>
				</div>
		</div>
<!-- 头部图标 -->
<div class="logo">
<a href="index.jsp">
<img src="images/jietu.png" alt="">
</a>
</div>  
<!-- 20131223-订单-商品-标题-start --> 
<!-- 20131223-购物车-商品列表-start --> 
<div class="layout">       
	<table border="0" cellspacing="0" cellpadding="0" style="text-align: center">
  <thead>
  <tr><!-- 20131223-订单-商品-标题-end -->
    <th class="tr-p1">商品</th>
    <th class="tr-p2">单价<em>（元）</em></th>
    <th class="tr-p3">数量</th>
    <th class="tr-p4">操作</th>
   </tr></thead>
   <tbody>
   <c:choose>
   		<c:when test="${id!=0}">
		<c:forEach items="${ListShoppingCar}" var="record">				
			<tr>
				<td style="display:none">${record.id}</td>
				<c:forEach items="${productList}" var="product">
					<c:if test="${record.product_code==product.code}">
						<td class="tr-p1">${product.name}</td>
						<td class="tr-p2">${product.price }</td>
					</c:if>
				</c:forEach>
				<td class="tr-p3"><input id="num" value="${record.num }" onblur="sumPrice(this)" /></td>
				<td class="tr-p4"><input type="button" onclick="removeProduct(this)" value="删除" class="tr_p4_input"/></td>
			</tr>
		</c:forEach>
		<tr class="tr_4">
   			<td ></td>
   			<td ></td>
			<td ></td>
			<td class="tr-p6" >
			总价格：<span id="addPrice">￥${sumPrice}</span>
			<a href="ShopCar?type=shopcar">去结算</a></td>
		</tr>
   		</c:when>
		<c:otherwise>
		<c:forEach items="${carList}" var="carList">
		<tr>
			<td  style="display:none">${carList.product_code }</td>
			<c:forEach items="${product}" var="proList">
			<c:if test="${carList.product_code==proList.code}">
			<td class="tr-p1">${proList.name}</td>
			<td class="tr-p2">${proList.price }</td>
			</c:if>
			</c:forEach>
			<td class="tr-p3"><input id="num" value="${carList.num }" onblur="sumPrice(this)" /></td>
			<td class="tr-p4" }><input type="button" onclick="removeCookie(this)" value="删除" class="tr_p4_input"/></td>
		
		</tr>
		</c:forEach>
		<tr class="tr_4">
   			<td ></td>
   			<td ></td>
			<td ></td>
			<td class="tr-p6" >
			
			<a href="ShopCar?type=shopcar">去结算</a></td>
		</tr>
		</c:otherwise>
   </c:choose>
   </tbody>

   </table>
</div>
<!--购物车-商品列表 end -->		         <!--购物车-空数据 -->         
<!-- <div class="empty">亲，您购物车里还没有物品哦，快去逛逛吧!</div>  -->
<!-- 尾部 -->
<div class="foot_slogan">
	<ul>
		<li class="s1">
			<a href="#">
				<i class="i1"></i>
				500强企业&nbsp;品质保证
			</a>
		</li>
		<li class="s1">
			<a href="#">
				<i class="i2"></i>
				7天包退&nbsp;15天换货
			</a>
		</li>
		<li class="s1">
			<a href="#">
				<i class="i3"></i>
				48元起免运费
			</a>
		</li>
		<li class="s1">
			<a href="#">
				<i class="i4"></i>
				448家维修网点&nbsp;全国联保
			</a>
		</li>
	</ul>
</div>
<!-- 底部 -->
<div class="last">
	<div class="last_left">
		<ul>
			<li>
				<p>购物相关</p>
				<a href="#">购物指南</a><br>
				<a href="#">配送方式</a><br>
				<a href="#">支付方式</a><br>
				<a href="#">常见问题</a><br>
			</li>
			<li>
				<p>保修与退换货</p>
				<a href="#">保修政策</a><br>
				<a href="#">退换货政策</a><br>
				<a href="#">退换货流程</a><br>
				<a href="#">保修状态查询</a><br>
			</li>
			<li>
				<p>维修与技术支持</p>
				<a href="#">售后网点</a><br>
				<a href="#" class="peisong">配送方式</a><br>
				<a href="#" class="peisong1">手机寄修</a><br>
				<a href="#" class="peisong2">维修配件价格查询</a><br>
			</li>
			<li>
				<p>关于我们</p>
				<a href="#">公司介绍</a><br>
				<a href="#">华为商城简介</a><br>
				<a href="#">零售店铺</a><br>
				<a href="#">诚征英才</a><br>
			</li>
			<li>
				<p>关注我们</p>
				<a href="#">新浪微博</a><br>
				<a href="#">腾讯微博</a><br>
				<a href="#">花粉俱乐部</a><br>
			</li>
			<li>
				<p>友情链接</p>
				<a href="#">华为官网</a><br>
				<a href="#">华为消费者业务</a><br>
				<a href="#">荣耀官网</a><br>
				<a href="#">花粉俱乐部</a><br>
			</li>
		</ul>
	</div>
	<div class="last_right">
		<p  class="big">400-088-6888</p>
		<p class="small">24小时客服在线(仅收市话费)</p>
		<a href="#" class="last_a">
			<i></i>
			在线客服
		</a>
	</div>
</div>
<!--版权 -->
<div class="banquan">
	<div class="banquan_1">
		<div class="banquan_left">
			<div class="banquan_img">
				<img src="images/flogo.png">
			</div>
			<div class="information">
				<p><a href="#">隐私政策</a>&nbsp;<a href="#">服务协议</a> Copyright@2012-2017&nbsp;VMALL.com版权所有 保留一切权利</p>
				<p>
				公安备案&nbsp;<a href="#">苏公网安备320114020110009号</a> | <a href="#">苏ICP备17040376号-6</a> |  增值电信业务经营许可证：苏B2-20130048号 |
				</p>
				<p>
					网络文化经营许可证：<a href="#">苏网文[2015] 1599-026号</a>
				</p>
			</div>
		</div>
		<div class="banquan_right">
			<a href="#"><img src="images/weibu.png"></a>
		</div>
	</div>
</div>
<!-- 回到顶部 -->
<div id="box" class="box">
<div class="box-in"></div>
</div>
</body>
</html>
<script>
window.onload=function(){
var timer = null;
box.onclick = function(){
cancelAnimationFrame(timer);
timer = requestAnimationFrame(function fn(){
var oTop = document.body.scrollTop || document.documentElement.scrollTop;
if(oTop > 0){
document.body.scrollTop = document.documentElement.scrollTop = oTop - 50;
timer = requestAnimationFrame(fn);
}else{
cancelAnimationFrame(timer);
} 
});
}

var btn = document.getElementById("box")
		window.onscroll = function(){
			var top = document.documentElement.scrollTop||document.body.scrollTop;
			if(top >= 500){
				btn.style.display = "inline-block";
			}else{
				btn.style.display = "block";
			}
		}
}
</script>

