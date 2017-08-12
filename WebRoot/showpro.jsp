<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>华为商城手机</title>
	<script type="text/javascript" src="js/jquery-1.6.min.js"></script>
	<script type="text/javascript">
	$(function(){
		var cookies=document.cookie.split(";");
		for(var i=0;i<cookies.length;i++){
			var temp=cookies[i].split("=");
				if(temp[0].trim()=="name"){
					document.getElementById("firstRegiest").style.display="none";
					document.getElementById("firstLogin").innerHTML=temp[1]+"个人中心";
					$("#firstLogin").attr("href","order?type=myOrder");
				}
			}
		});	
	</script>
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/shoujishow.css">
	<link rel="stylesheet" href="css/initialize.css">
	<link  rel="icon" href="images/hw.jpg">
	<style type="text/css">
	.spxg:hover{
		color:white;
		background-color: red;
	}
	</style>
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
				<div class="header_right" >
					<ul style="width: 320px">
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
								<li class="naver_li"><a href="#">手机</a></li>
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
<!-- 选择栏 -->
	<!-- 分割线 -->
	<p class="fenge_p"></p>
	<div class="fenge">
		<p><a href="index.jsp" class="fenge_p_a">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;手机</p>
	</div>
	<div class="cg"></div>
	<div class="jiage">
		<div class="jiage_top">
			<div class="jiage_top_left">
				<span class="jiage_top_left_span">分类&nbsp;&nbsp;</span>
				<span class="jiage_top_left_span1"><a href="user?type=showProList">全部</a></span>
			</div>
			<div class="jiage_top_right">
				<span class="jiage_top_right_span"><a href="Series?ser=荣耀">荣耀</a></span>
				<span class="jiage_top_right_span"><a href="Series?ser=HUAWEI P系列">HUAWEI P系列</a></span>
				<span class="jiage_top_right_span"><a href="Series?ser=荣耀畅玩系列">荣耀畅玩系列</a></span>
				<span class="jiage_top_right_span"><a href="Series?ser=HUAWEI Mate系列">HUAWEI Mate系列</a></span>
				<span class="jiage_top_right_span"><a href="Series?ser=HUAWEI nova系列">HUAWEI nova系列</a></span>
				<span class="jiage_top_right_span"><a href="Series?ser=华为 G系列">华为 G系列</a></span>
				<span class="jiage_top_right_span"><a href="Series?ser=华为畅享系列">华为畅享系列</a></span>
				<span class="jiage_top_right_span"><a href="Series?ser=合约机">合约机</a></span>

			</div>
		</div>
		<div class="jiage_bottom">
			<div class="jiage_top_left">
				<span class="jiage_top_left_span">排序&nbsp;&nbsp;</span>
				<span class="jiage_top_left_span1"><a href="#">默认</a></span>
			</div>
			<div class="jiage_top_right">
				<span class="jiage_top_right_span"><a href="user?type=showProList&sort=priceUp">价格<i></i></a></span>
				<span class="jiage_top_right_span"><a href="user?type=showProList&sort=priceDown">评价数<b></b></a></span>
				<span class="jiage_top_right_span"><a href="user?type=showProList&sort=priceUp">上架时间<i></i></a></span>
			</div>
		</div>
	</div>
<!-- 商品展示区 -->
	<div class="shangpinshow clearFix">
		<div style="width:1200px;height:384px;background:white;padding:0 15px 15px 0;margin-top: 15px;margin-left: 17px;">
			<c:forEach items="${showProList}" var="proList"><a href="user?type=showProList&code=${proList.proCode}&name=${proList.proName}&price=${proList.proPrice}&imgPath=${proList.proImgPath}">
			<div style="width: 215px;float:left;height: 367px;margin-right:22px;margin-top:10px;border:1px solid #9e9e9e" onmouseover="this.style.border='1px solid red';"onmouseout="this.style.border='1px solid #9e9e9e';;">
				<p style="width: 215px;height:244px;padding:38px 0 24px 0;">
					<img  style="width: 100%;height: 100%;vertical-align: middle;padding:0 8px"  
					src="imgs/${proList.proImgPath}">
				</p>
				<p style="width: 215px;height: 48px;color: #a4a4a4;text-align: center;line-height: 20px;padding: 0 20px;font-size: 16px;" onmouseover="this.style.color='red';"onmouseout="this.style.color='#a4a4a4';">
					 ${proList.proName}
				</p>
				<p style="width: 215px;height: 35px;text-align: center;line-height: 35px;font-size: 20px;font-family: 微软雅黑;color: red;">
				￥ ${proList. proPrice}
				</p>
				<p style="width:215px;height:30px;border-top:1px solid #a4a4a4;margin-top:7px;">
					<span style="width:107px;height:30px;border-right:1px solid #a4a4a4;display:inline-block;text-align:center;line-height:29px;
					font-size:13px;"  class="spxg">选购</span>
					<span style="width:103px;height:30px;display:inline-block;text-align:center;line-height:29px;color:#a4a4a4;font-size:13px;">${proList.evlCount}人评价</span>
				</p>
			</div>
			</a>
			</c:forEach>
		</div>

	</div>
<!-- 跳转页面的按钮 -->
	<div class="button ">
		<ul>
			<li class="ul_li1"><<</li>
			<li class="ul_li1"><</li>
			<li class="ul_li3">1</li>
			<li class="ul_li4">2</li>
			<li class="ul_li2">></li>
			<li class="ul_li2">>></li>
		</ul>
	</div>
<!-- 尾部 -->
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
</body>
</html>
