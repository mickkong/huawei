<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" href="css/initialize.css">
	<link  rel="icon" href="images/hw.jpg">
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<title>华为商城</title>
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
	</script>
</head>
<body>
<!-- 头部 -->
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
					<ul style="width: 390px">
						<li class="header_right_li"><a id="firstLogin" href="login.jsp">请登录</a></li>
						<li class="header_right_li"><a id="firstRegiest" href="regiest.jsp">注册</a></li>
						<li class="header_right_li"><a href="order?type=myOrder">我的订单</a></li>
						<li class="header_right_li">
							<a href="shoppingCar?type=list">
							<span class="header_right_span">
								<img src="images/gwc.png">
							</span>购物车
							</a>
							<div class="header_right_div">
								<p>
									<img src="images/big_gwc.png"></br>
									<span>快来查看你的购物车吧~</span>
								</p>
							</div>
						</li>
						<li class="header_right_li"><a href="user?type=exit">退出</a></li>
					</ul>
				</div>
		</div>
<!-- 图标栏 -->
		<div class="header_short">
				<div class="short_div">
					<div class="left">
					<a href="index.jsp">
						<div class="logo"></div>
					</a>
						<div class="naver"> 
							<ul>
								<li class="naver_li"><a href="user?type=showProList">手机</a></li>
								<li class="naver_li"><a href="#">笔记本&平板</a></li>
								<li class="naver_li"><a href="#">穿戴</a></li>
								<li class="naver_li"><a href="#">智能家居</a></li>
								<li class="naver_li"><a href="#">通用配件</a></li>
								<li class="naver_li"><a href="#">专属配件</a></li>
							</ul>
						</div>
					</div>
					<div class="right">
						<div class="right_input">
							<form>
								<input type="text"  class="rigth_text" onclick="text()">
							</form>
							<div class="right_input_div">
								<a href="#">HUAWEI nova 2</a>&nbsp;&nbsp;
								<a href="#">荣耀8青春版</a>
							</div>
						</div>
						<button class="btn"></button>
					</div>
				</div>
			</div>
</div>
<!-- 轮播图 -->
<div class="hot_board">
<!-- 轮播图 -->
	<div class="container">
			<ul id="imgList">
				<li class="active">
	                <img src="images/lbt1.jpg" alt="">
				</li>
				<li>
	                <img src="images/lbt2.jpg" alt="">
				</li>
				<li>
	                <img src="images/lbt3.jpg" alt="">
				</li>
				<li>
	                <img src="images/lbt4.jpg" alt="">
				</li>
				<li>
	                <img src="images/lbt5.jpg" alt="">
				</li>
				<li>
	                <img src="images/lbt6.jpg" alt="">
				</li>
			</ul>
		<button type="button" id="prev" class="arrow">&lt;</button>
		<button type="button" id="next" class="arrow">&gt;</button>
			<ol id="btn" class="banNum clearFix">
				<li class="active">1</li>
				<li>2</li>
				<li>3</li>
				<li>4</li>
				<li>5</li>
				<li>6</li>
			</ol>
	</div>
<!-- 二级导航 -->
	<div class="shopList_div">
	   <div class="shopList">
		<ul>
			<li>
					<div class="relative">
	                   <p><a href="shoujishow.html">手机</a></p>
	                   <p>
	                      <a href="#" title="">荣耀</a>&nbsp;&nbsp;
	                      <a href="#" title="">HUAWEI P系列</a>
	                   </p>
	                   <i></i>
					</div>
	               <div class="shopDesc">
	               	<div class="shopDesc_top">游览手机频道
	               	<i class="shopDesc_top_i">></i>
	               <!-- 	<p class="shopDesc_top_p"></p> -->
	               	</div>
	               	<div class="shopDesc_center">
	               		<p><a href="#">荣耀</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">HUAWEI P系列</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">畅玩</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">HUAWEI Mate系列</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">HUAWEI Nova系列</a></p>
	               		<p><a href="#">华为G系列</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">华为畅享系列</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">合约机</a></p>
	               	</div>
	               	<div class="shopDesc_bottom"></div>
	               </div>
			</li>
			<li>
	               <div class="relative">
	                   <p>笔记本&平板</p>
	                   <p>
	                      <a href="#" title="">平板电脑</a>&nbsp;&nbsp;
	                      <a href="#" title="">笔记本电脑</a>
	                   </p>
	                   <i></i>
					</div>
	               <div class="shopDesc">
						<div class="shopDesc_top">游览笔记本&平板频道
	               	<i class="shopDesc_top_i">></i>
	               	</div>
	               	<div class="shopDesc_center">
	               		<p><a href="#">平板电脑</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">笔记本电脑</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">笔记本配件</a></p>
	               	</div>
	               	<div class="shopDesc_bottom"></div>
	               </div>
			</li>
			<li>
	               <div class="relative">
	                   <p>穿戴</p>
	                   <p>
	                      <a href="#" title="">手环</a>&nbsp;&nbsp;
	                      <a href="#" title="">手表</a>
	                   </p>
	                   <i></i>
					</div>
	               <div class="shopDesc">
	               		<div class="shopDesc_top">游览穿戴频道
	               	<i class="shopDesc_top_i">></i>
	               	</div>
	               	<div class="shopDesc_center">
	               		<p><a href="#">手环</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">手表</a></p>
	               	</div>
	               	<div class="shopDesc_bottom">
	               		<div class="shopDesc_bottom_div">
	               		    <p class="shopDesc_bottom_p">
	               			<img src="images/pig34.png">
	               			</p>
	               			<p class="shopDesc_bottom_p1">荣耀手环3</p>
	               			<p class="shopDesc_bottom_p2">￥299</p>
	               		</div>
	               		<div class="shopDesc_bottom_div">
	               			<p class="shopDesc_bottom_p">
	               			<img src="images/pig35.png">
	               			</p>
	               			<p class="shopDesc_bottom_p1">荣耀手环3</p>
	               			<p class="shopDesc_bottom_p2">￥299</p>
	               		</div>
	               		<div class="shopDesc_bottom_div">
	               			<p class="shopDesc_bottom_p">
	               			<img src="images/pig36.png">
	               			</p>
	               			<p class="shopDesc_bottom_p1">荣耀手环3</p>
	               			<p class="shopDesc_bottom_p2">￥299</p>
	               		</div>
	               		<div class="shopDesc_bottom_div">
	               			<p class="shopDesc_bottom_p">
	               			<img src="images/pig37.png">
	               			</p>
	               			<p class="shopDesc_bottom_p1">荣耀手环3</p>
	               			<p class="shopDesc_bottom_p2">￥299</p>
	               		</div>
	               	</div>
	               </div>
			</li>
			<li>
	               <div class="relative">
	                   <p>智能家居</p>
	                   <p>
	                      <a href="#" title="">子路由器</a>&nbsp;&nbsp;
	                      <a href="#" title="">电视盒子</a>
	                   </p>
	                   <i></i>
					</div>
	               <div class="shopDesc">
	               		<div class="shopDesc_top">游览智能家居频道
	               	<i class="shopDesc_top_i">></i>
	               	</div>
	               	<div class="shopDesc_center">
	               		<p><a href="#">子母路由</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">电视盒子</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">路由器</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">电力猫</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">随身Wifi</a></p>
	               	</div>
	               	<div class="shopDesc_bottom">
	               		<div class="shopDesc_bottom_div">
	               		    <p class="shopDesc_bottom_p">
	               			<img src="images/pig38.png">
	               			</p>
	               			<p class="shopDesc_bottom_p1">华为路由 Q1</p>
	               			<p class="shopDesc_bottom_p2">￥599</p>
	               		</div>
	               		<div class="shopDesc_bottom_div">
	               			<p class="shopDesc_bottom_p">
	               			<img src="images/pig39.png">
	               			</p>
	               			<p class="shopDesc_bottom_p1">荣耀盒子Pro</p>
	               			<p class="shopDesc_bottom_p2">￥399</p>
	               		</div>
	               		<div class="shopDesc_bottom_div">
	               			<p class="shopDesc_bottom_p">
	               			<img src="images/pig40.png">
	               			</p>
	               			<p class="shopDesc_bottom_p1">华为路由A1 Lite</p>
	               			<p class="shopDesc_bottom_p2">￥169</p>
	               		</div>
	               		<div class="shopDesc_bottom_div">
	               			<p class="shopDesc_bottom_p">
	               			<img src="images/pig41.png">
	               			</p>
	               			<p class="shopDesc_bottom_p1">荣耀路由Pro</p>
	               			<p class="shopDesc_bottom_p2">￥315</p>
	               		</div>
	               	</div>
	               </div>
			</li>
			<li>
	               <div class="relative">
	                   <p>通用配件</p>
	                   <p>
	                      <a href="#" title="">移动电源</a>&nbsp;&nbsp;
	                      <a href="#" title="">耳机  &nbsp;&nbsp; 音箱</a>
	                   </p>
	                   <i></i>
					</div>
	               <div class="shopDesc">
	               		<div class="shopDesc_top">游览通用配件频道
	               	<i class="shopDesc_top_i">></i>
	               	</div>
	               	<div class="shopDesc_center">
	               		<p><a href="#">移动电源</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">耳机</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">音箱</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">自拍杆/支架</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">充电器/线材</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">排插</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">U盘/存储卡</a></p>
	               		<p><a href="#">摄像机/镜头</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">智能硬件</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">生活周边</a></p>
	               	</div>
	               	<div class="shopDesc_bottom">
	               		<div class="shopDesc_bottom_div">
	               		    <p class="shopDesc_bottom_p">
	               			<img src="images/pig42.png">
	               			</p>
	               			<p class="shopDesc_bottom_p1">华为移动充电宝</p>
	               			<p class="shopDesc_bottom_p2">￥199</p>
	               		</div>
	               		<div class="shopDesc_bottom_div">
	               			<p class="shopDesc_bottom_p">
	               			<img src="images/pig43.png">
	               			</p>
	               			<p class="shopDesc_bottom_p1">荣耀蓝牙运动耳机</p>
	               			<p class="shopDesc_bottom_p2">￥289</p>
	               		</div>
	               		<div class="shopDesc_bottom_div">
	               			<p class="shopDesc_bottom_p">
	               			<img src="images/pig44.png">
	               			</p>
	               			<p class="shopDesc_bottom_p1">荣耀体脂称</p>
	               			<p class="shopDesc_bottom_p2">￥199</p>
	               		</div>
	               		<div class="shopDesc_bottom_div">
	               			<p class="shopDesc_bottom_p">
	               			<img src="images/pig45.png">
	               			</p>
	               			<p class="shopDesc_bottom_p1">闪迪高速TF存储卡</p>
	               			<p class="shopDesc_bottom_p2">￥90</p>
	               		</div>
	               	</div>
	               </div>
			</li>
			<li>
	               <div class="relative">
	                   <p>专属配件</p>
	                   <p>
	                      <a href="#" title="">保护壳</a>&nbsp;&nbsp;
	                      <a href="#" title="">保护套 &nbsp;&nbsp;  贴膜</a>
	                   </p>
	                   <i></i>
					</div>
	               <div class="shopDesc">
	               		<div class="shopDesc_top">游览专属配件频道
	               	<i class="shopDesc_top_i">></i>
	               	</div>
	               	<div class="shopDesc_center">
	               		<p><a href="#">保护套</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">保护壳</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">贴膜</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">盒子专属配件</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">生活周边</a></p>
	               	</div>
	               	<div class="shopDesc_bottom">
	               		<div class="shopDesc_bottom_div">
	               		    <p class="shopDesc_bottom_p">
	               			<img src="images/pig46.png">
	               			</p>
	               			<p class="shopDesc_bottom_p1">HUAWEI VR</p>
	               			<p class="shopDesc_bottom_p2">￥499</p>
	               		</div>
	               		<div class="shopDesc_bottom_div">
	               			<p class="shopDesc_bottom_p">
	               			<img src="images/pig47.png">
	               			</p>
	               			<p class="shopDesc_bottom_p1">荣耀VR全景相机</p>
	               			<p class="shopDesc_bottom_p2">￥699</p>
	               		</div>
	               		<div class="shopDesc_bottom_div">
	               			<p class="shopDesc_bottom_p">
	               			<img src="images/pig48.png">
	               			</p>
	               			<p class="shopDesc_bottom_p1">荣耀畅玩6X皮套</p>
	               			<p class="shopDesc_bottom_p2">￥129</p>
	               		</div>
	               		<div class="shopDesc_bottom_div">
	               			<p class="shopDesc_bottom_p">
	               			<img src="images/pig49.png">
	               			</p>
	               			<p class="shopDesc_bottom_p1">HUAWEI Mate 9皮套</p>
	               			<p class="shopDesc_bottom_p2">￥229</p>
	               		</div>
	               	</div>
	               </div>
			</li>
		</ul>
	    </div>
	</div>
</div>
<!-- 轮播图下面的部分 -->
<div class="h">
	<!-- 上面的部分 -->
	<div class="hb">
		<div class="hb1">
			<div class="hb1_left">
				<img src="images/tx.png">
			</div>
			<div class="hb1_right">
				<div class="hb1_top">
					欢迎来到华为商城，请<a href="login.jsp">登录</a>还没账号？<a href="#">注册</a>？即可享受 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				<div class="hb1_bottom">
					<a href="#" class="hb1_bottom_a">新人福利</a>
					<a href="#" class="hb1_bottom_a">特权频道</a>
				</div>
			</div>
		</div>
		<div class="hb2">
			<ul>
				<li><a href="#">
					<div class="hb2_img">
						<img src="images/shiyong.png">
					</div>
					<div class="hb2_wz">1分钱试用</div>
				</a></li>
				<li><a href="#">
					<div class="hb2_img">
						<img src="images/huafei.png">
					</div>
					<div class="hb2_wz">话费充值</div>
				</a></li>
				<li><a href="#">
					<div class="hb2_img">
						<img src="images/huanxin.png">
					</div>
					<div class="hb2_wz">以旧换新</div>
				</a></li>
				<li><a href="#">
					<div class="hb2_img">
						<img src="images/hongbao.png">
					</div>
					<div class="hb2_wz">370元礼包</div>
				</a></li>
				<li><a href="#">
					<div class="hb2_img">
						<img src="images/erji.png">
					</div>
					<div class="hb2_wz">优选配件</div>
				</a></li>
				<li><a href="#">
					<div class="hb2_img">
						<img src="images/xinhao.png">
					</div>
					<div class="hb2_wz">数码特惠</div>
				</a></li>
			</ul>
		</div>
		<div class="hb3">
			<div class="hb3_top">
				<div class="hb3_top_left">
					<img src="images/icon3.png">
				</div>
				<div class="hb3_top_right">
					<marquee direction="UP" height="80" onMouseOver="this.stop()" onMouseOut="this.start()"  scrollamount="3" scrolldelay=1  >
						<ul class="hb3_top_right_ul">
							<li class="hb3_top_right_li"><a href="#">华为超品日，手机199元起</a></li>
							<li class="hb3_top_right_li"><a href="#">冰点价，耀痛快</a></li>
							<li class="hb3_top_right_li"><a href="#">花呗分期12期费率调整公告</a></li>
							<li class="hb3_top_right_li"><a href="#">1分钱试用 新品专场(第二期)</a></li>
							<li class="hb3_top_right_li"><a href="#">疯狂4小时-华为夜场</a></li>
						</ul>
					</marquee>
				</div>
			</div>
			<div class="hb3_bottom">
				<div class="hb3_bottom_div">
					<a href="#">
						<img src="images/sfz.png">
						实名认证
					</a>
				</div>
				<div class="hb3_bottom_div">
					<a href="#">
						<img src="images/zmxy.png">
						芝麻信用
					</a>
				</div>
				<div class="hb3_bottom_div">
					<a href="#">
						<img src="images/ygm.png">
						优购码
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 下面的部分 -->
	<div class="hx">
		<div class="hx_div"><a href="#">
			<img src="images/pig1.jpg">
		</a></div>
		<div class="hx_div"><a href="#">
			<img src="images/pig2.png">
		</a></div>
		<div class="hx_div"><a href="#">
			<img src="images/pig3.png">
		</a></div>
		<div class="hx_div"><a href="#">
			<img src="images/pig4.png">
		</a></div>
	</div>
</div>
<!-- 热销单品 -->
<div class="rx">
	<div class="h2">
		<h2>热销单品</h2>
	</div>
	<div class="dpsp">
		<div class="dpsp_left">
			<a href="#"><img src="images/pig5.jpg"></a><img src="">
		</div>
		<div class="dpsp_right">
			<div class="dpsp_right_div"><a href="#">
				<p class="dpsp_right_div_p">
					<img src="images/pig6.jpg">
				</p>
				<h3 class="dpsp_right_div_h3">荣耀V9</h3>
				<p class="dpsp_right_div_gesc">下单最高减200</p>
				<p class="dpsp_right_div_price">￥2599</p>
				<p class="dpsp_right_div_tips">
					<img src="images/remai.png">
				</p>
			</a></div>
			<div class="dpsp_right_div"><a href="#">
				<p class="dpsp_right_div_p">
					<img src="images/pig7.jpg">
				</p>
				<h3 class="dpsp_right_div_h3">HUAWEI Mate 9 Pro</h3>
				<p class="dpsp_right_div_gesc">领卷减200元</p>
				<p class="dpsp_right_div_price">￥4699</p>
				<p class="dpsp_right_div_tips">
					<img src="images/yongjuan.png">
				</p>
			</a></div>
			<div class="dpsp_right_div"><a href="#">
				<p class="dpsp_right_div_p">
					<img src="images/pig8.jpg">
				</p>
				<h3 class="dpsp_right_div_h3">荣耀畅玩6A</h3>
				<p class="dpsp_right_div_gesc">送PPTV会员权益/30元书卷</p>
				<p class="dpsp_right_div_price">￥799</p>
				<p class="dpsp_right_div_tips">
					<img src="images/xinpin.png">
				</p>
			</a></div>
			<div class="dpsp_right_div"><a href="#">
				<p class="dpsp_right_div_p">
					<img src="images/pig9.jpg">
				</p>
				<h3 class="dpsp_right_div_h3">HUAWEI Mate 9</h3>
				<p class="dpsp_right_div_gesc">最高优惠200元</p>
				<p class="dpsp_right_div_price">￥3599</p>
				<p class="dpsp_right_div_tips">
					<img src="images/maizeng.png">
				</p>
			</a></div>
			<div class="dpsp_right_div"><a href="#">
				<p class="dpsp_right_div_p">
					<img src="images/pig10.jpg">
				</p>
				<h3 class="dpsp_right_div_h3">荣耀8</h3>
				<p class="dpsp_right_div_gesc">最高优惠800</p>
				<p class="dpsp_right_div_price">￥2099</p>
				<p class="dpsp_right_div_tips">
					<img src="images/tehui.png">
				</p>
			</a></div>
			<div class="dpsp_right_div"><a href="#">
				<p class="dpsp_right_div_p">
					<img src="images/pig11.jpg">
				</p>

				<h3 class="dpsp_right_div_h3">华为畅享7 Plus</h3>
				<p class="dpsp_right_div_gesc">玩到爽 快到爽</p>
				<p class="dpsp_right_div_price">￥1699</p>

				<p class="dpsp_right_div_tips">
				</p>
			</a></div>
			<div class="dpsp_right_div"><a href="#">
				<p class="dpsp_right_div_p">
					<img src="images/pig12.jpg">
				</p>
				<h3 class="dpsp_right_div_h3">荣耀畅玩6X</h3>
				<p class="dpsp_right_div_gesc">最高优惠100元</p>
				<p class="dpsp_right_div_price">￥1299</p>
				<p class="dpsp_right_div_tips">
					<img src="images/tehui.png">
				</p>
			</a></div>
			<div class="dpsp_right_div"><a href="#">
				<p class="dpsp_right_div_p">
					<img src="images/pig13.jpg">
				</p>
				<h3 class="dpsp_right_div_h3">HUAWEI P10</h3>
				<p class="dpsp_right_div_gesc">领卷最高减300元+赠158元配件</p>
				<p class="dpsp_right_div_price">￥3788</p>
				<p class="dpsp_right_div_tips">
					<img src="images/remai.png">
				</p>
			</a></div>
		</div>
	</div>
</div>
<!-- 手机 -->
<div class="phone">
	<div class="phone_h">
		<h2 class="phone_titleo">手机</h2>
		<ul class="phone_ul">
			<li><a href="#">荣耀</a></li>
			<li><a href="#">HUAWEI P系列</a></li>
			<li><a href="#">荣耀畅玩系列</a></li>
			<li><a href="#">HUAWEI Mate系列</a></li>
			<li><a href="#">HUAWEI Nova系列</a></li>
			<li><a href="#">华为G系列</a></li>
			<li><a href="#">华为畅享系列</a></li>
			<li><a href="#">合约机</a></li>
		</ul>
		<a href="#" class="phone_a">更多></a>
	</div>
	<div class="phone_show">
		<div class="phone_pig">
			<a href="#"><img src="images/pig14.jpg"></a>
		</div>
		<div class="phone_pig">
			<a href="#">
				<p class="phone_img">
					<img src="images/pig15.jpg">
				</p>
				<h3 class="phone_title">HUAWEI Nova青春版</h3>
				<p class="phone_desc">赠价值158元配件</p>
				<p class="phone_price">￥1999</p>
				<p class="phone_tips">
					<img src="images/maizeng.png">
				</p>
			</a></div>
		<div class="phone_pig">
			<a href="#">
				<p class="phone_img">
					<img src="images/pig16.jpg">
				</p>
				<h3 class="phone_title">荣耀Magic</h3>
				<p class="phone_desc">限时特惠，下单立减300元</p>
				<p class="phone_price">￥3699</p>
				<p class="phone_tips">
					<img src="images/remai.png">
				</p>
			</a></div>
		<div class="phone_pig">
			<a href="#">
				<p class="phone_img">
					<img src="images/pig17.jpg">
				</p>
				<h3 class="phone_title">HUAWEI Nova 2Plus</h3>
				<p class="phone_desc">赠送价值178元大礼包</p>
				<p class="phone_price">￥2899</p>
				<p class="phone_tips">
					<img src="images/shoufa.png">
				</p>
			</a></div>
		<div class="phone_pig">
			<a href="#">
				<p class="phone_img">
					<img src="images/pig18.png">
				</p>
				<h3 class="phone_title">HUAWEI Mate 9 保时捷设计</h3>
				<p class="phone_desc">限量发售</p>
				<p class="phone_price">￥8999</p>
				<p class="phone_tips">
					<img src="images/xianliang.png">
				</p>
			</a></div>
		<div class="phone_pig">
			<a href="#">
				<p class="phone_img">
					<img src="images/pig19.jpg">
				</p>
				<h3 class="phone_title">华为畅享6s</h3>
				<p class="phone_desc">机身高颜值</p>
				<p class="phone_price">￥1299</p>
				<p class="phone_tips">
					<img src="images/maizeng.png">
				</p>
			</a></div>
		<div class="phone_pig">
			<a href="#">
				<p class="phone_img">
					<img src="images/pig20.jpg">
				</p>
				<h3 class="phone_title">荣耀8 吴亦凡定制版</h3>
				<p class="phone_desc">最高可优惠800元</p>
				<p class="phone_price">￥2199</p>
				<p class="phone_tips">
					<!-- <img src="images/remai.png"> -->
				</p>
			</a></div>
		<div class="phone_pig">
			<a href="#">
				<p class="phone_img">
					<img src="images/pig21.jpg">
				</p>
				<h3 class="phone_title">荣耀8 青春版</h3>
				<p class="phone_desc">送PPTV会员权益</p>
				<p class="phone_price">￥1399</p>
				<p class="phone_tips">
					<!-- <img src="images/remai.png"> -->
				</p>
			</a></div>
	</div>
</div>
<!-- 电脑 -->
<div class="computer">
	<div class="computer_h">
		<h2 class="computer_titleo">电脑</h2>
		<ul class="computer_ul">
			<li><a href="#">平板电脑</a></li>
			<li><a href="#">笔记本电脑</a></li>
			<li><a href="#">笔记本配件</a></li>
		</ul>
		<a href="#" class="computer_a">更多></a>
	</div>

	<div class="computer_show">
		<img src="images/pig22.jpg">
	</div>

	<div class="computer_show">
		<a href="#">
			<p class="computer_img">
				<img src="images/pig23.jpg">
			</p>
			<h3 class="computer_title">HUAWEI MathBookE</h3>
			<p class="computer_desc">享受6期免息</p>
			<p class="computer_price">￥4988</p>
			<p class="computer_tips">
				<img src="images/mianxi.png">
			</p>
		</a>
	</div>

	<div class="computer_show">
		<a href="#">
			<p class="computer_img">
				<img src="images/pig24.jpg">
			</p>
			<h3 class="computer_title">HUAWEI MathBookD</h3>
			<p class="computer_desc">享受6期免息</p>
			<p class="computer_price">￥4988</p>
			<p class="computer_tips">
				<img src="images/mianxi.png">
			</p>
		</a>
	</div>

	<div class="computer_show">
		<a href="#">
			<p class="computer_img">
				<img src="images/pig25.jpg">
			</p>
			<h3 class="computer_title">HUAWEI MathBook</h3>
			<p class="computer_desc">部分赠送拓展坞</p>
			<p class="computer_price">￥6688</p>
			<p class="computer_tips">
				<img src="images/maizeng.png">
			</p>
		</a>
	</div>
</div>
<!-- 平板电脑 -->
<div class="pingban">
	<div class="pingban_h">
		<h2 class="pingban_titleo">精品平板</h2>
		<ul class="pingban_ul">
			<li><a href="#">平板电脑</a></li>
			<li><a href="#">笔记本电脑</a></li>
			<li><a href="#">笔记本配件</a></li>
		</ul>
		<a href="#" class="pingban_a">更多></a>
	</div>
	<div class="pingban_shon">
		<div class="pingban_show">
			<img src="images/pig26.jpg">
		</div>
		<div class="pingban_show">
			<a href="#">
				<p class="pingban_img">
					<img src="images/pig27.jpg">
				</p>
				<h3 class="pingban_title">荣耀畅玩平板28英寸</h3>
				<p class="pingban_desc">3+32G  Wifi高配版首发</p>
				<p class="pingban_price">￥799</p>
				<p class="pingban_tips">
					<img src="images/baokuan.png">
				</p>
			</a>
		</div>
		<div class="pingban_show">
			<a href="#">
				<p class="pingban_img">
					<img src="images/pig28.jpg">
				</p>
				<h3 class="pingban_title">华为平板 M3青春版 10.1英寸</h3>
				<p class="pingban_desc">哈曼卡顿品质立体声</p>
				<p class="pingban_price">￥1899</p>
				<p class="pingban_tips">
					<img src="images/shoufa.png">
				</p>
			</a>
		</div>
		<div class="pingban_show">
			<a href="#">
				<p class="pingban_img">
					<img src="images/pig29.jpg">
				</p>
				<h3 class="pingban_title">华为平板 M3青春版 8英寸</h3>
				<p class="pingban_desc">哈曼卡顿品质立体声</p>
				<p class="pingban_price">￥1399</p>
				<p class="pingban_tips">
					<img src="images/shoufa.png">
				</p>
			</a>
		</div>
		<div class="pingban_show">
			<a href="#">
				<p class="pingban_img">
					<img src="images/pig30.png">
				</p>
				<h3 class="pingban_title">华为平板 M3</h3>
				<p class="pingban_desc">2K高清屏幕 麒麟950</p>
				<p class="pingban_price">￥1888</p>
				<p class="pingban_tips">
					<img src="images/remai.png">
				</p>
			</a>
		</div>
		<div class="pingban_show">
			<a href="#">
				<p class="pingban_img">
					<img src="images/pig31.jpg">
				</p>
				<h3 class="pingban_title">荣耀平板2</h3>
				<p class="pingban_desc">限时优惠最高直降50</p>
				<p class="pingban_price">￥1249</p>
				<p class="pingban_tips">
					<img src="images/remai.png">
				</p>
			</a>
		</div>
		<div class="pingban_show">
			<a href="#">
				<p class="pingban_img">
					<img src="images/pig32.png">
				</p>
				<h3 class="pingban_title">荣耀畅玩平板 LTE版</h3>
				<p class="pingban_desc">限时优惠最高直降50</p>
				<p class="pingban_price">￥749</p>
				<p class="pingban_tips">
				<!-- 	<img src="images/maizeng.png"> -->
				</p>
			</a>
		</div>
		<div class="pingban_show">
			<a href="#">
				<p class="pingban_img">
					<img src="images/pig30.jpg">
				</p>
				<h3 class="pingban_title">荣耀畅玩平板 9.0英寸</h3>
				<p class="pingban_desc">限时直降50</p>
				<p class="pingban_price">￥1149</p>
				<p class="pingban_tips">
					<!-- <img src="images/maizeng.png"> -->
				</p>
			</a>
		</div>
	</div>
</div>
<!-- 尾部 -->
<div class="foot_img">
	<img src="images/pig33.jpg">
</div>
<div class="dibu_foot">
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
</div>
<!-- 底部 -->
<div class="dibu_last">
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
<script type="text/javascript">
		var btns = $('#btn li');
		var imgList = $('#imgList li');
		var container = $('.container');
		var prev = $('#prev');
		var next = $('#next');
		var index = 0;

		prev.click(function(){
			index--;
			if(index<0){
				index=imgList.length-1;
			}
			fade(index);
		});
		next.click(play);

		btns.click(function(){
			index = $(this).index();
			fade(index);
		});

		function play(){
			index++;
			if(index>imgList.length-1){
				index=0;
			}
			fade(index);
		}

		function fade(num){
			btns.eq(num).addClass("active").siblings().removeClass("active");
			imgList.eq(num).fadeIn().siblings().fadeOut();
		}

		var timer = setInterval(play,2000);

		container.hover(function(){
			clearInterval(timer);
		},function(){
			timer = setInterval(play,3000);
		});

		//文本框点击a链接消失
		 function text(){
		 	var texm = document.getElementsByClassName("right_input_div");
		 	//texm.style.display="none";
		 	for (var i = 0; i<texm.length;i++) {
   			texm[i].style.display="none";
 			};
		 }
</script>
<script>
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
</script>
<script type="text/javascript">
var btn = document.getElementById("box")
		window.onscroll = function(){
			var top = document.documentElement.scrollTop||document.body.scrollTop;
			if(top >= 500){
				btn.style.display = "inline-block";
			}else{
				btn.style.display = "none";
			}
		}
</script>






  
 
    
  
