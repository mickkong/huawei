<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" type="text/css" href="css/dingdan.css">
	<link rel="stylesheet" href="css/initialize.css">
	<link  rel="icon" href="images/hw.jpg">
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<title>商品评价-个人中心-华为商城</title>
	<style type="text/css" media="screen">
		#myOrder-cate {
			margin-bottom: 25px;
		}
		.hr-20 {
			height: 20px;
		}
		.myOrder-record .col-price5 {
		    width: 300px;
		}
		.myOrder-record .col-quty5 {
		    width: 122px;
		}
	</style>
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
			<div class="header_right" style="width: 350px">
				<ul style="width: 330px">
					<li class="header_right_li" style="width: 160px"><a id="firstLogin" href="login.jsp">请登录</a>
					</li>
					<li class="header_right_li"><a id="firstRegiest" href="regiest.jsp">注册</a>
					</li>
					<li class="header_right_li"><a href="order?type=myOrder">我的订单</a>
					</li>
					<li class="header_right_li">
						<a href="#">
						<span class="header_right_span">
							<img src="images/gwc.png">
						</span>购物车
						</a>
						<div class="header_right_div">
							<p>
								<img src="images/big_gwc.png"> <br>
								<span>快来看看你的购物车吧~</span>
							</p>
						</div>
					</li>
				</ul>
			</div>
		</div>
    </div>
<!-- 图标栏 -->
	<div class="header_short">
		<div class="short_div">
			<div class="left">
				<div class="logo"></div>
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
<!-- 下划线 -->
	<div class="hr-10"></div>
	<div class="g">
		<div class="breadcrumb-area">
			<a href="" title="首页">首页</a>
			<em id="pathPoint">\</em>
            <a href="" title="我的商城" id="personCenter">我的商城</a>
			<em id="pathPoint">\</em>
			<a id="pathTitle">我的订单</a>
		</div>
	</div>
<!-- 我的商城左边 -->
	<div class="g">
		<div class="fl u-1-5">
			<div class="mc-menu-area">
				<div class="h">
					<a href="" title="" class="button-go-mc">我的商城</a>
				</div>
				<div class="b">
					<ul>
						<li>
                            <h3><span>订单中心</span></h3>
                            <ol>
                            	<li id="li-order">
                                    <a href="order?type=myOrder" title=""><span>我的订单</span></a>
                            	</li>
                            	<li id="li-exchange">
                                    <a href="returnThing.jsp" title=""><span>我的退货款</span></a>
                            	</li>
                            	<li id="li-recover">
                                    <a href="" title=""><span>我的回收单</span></a>
                            	</li>
                            </ol>
						</li>
						<li>
                            <h3><span>个人中心</span></h3>
                            <ol>
                            	<li id="li-myAppointment">
                                    <a href="" title=""><span>我的预约</span></a>
                            	</li>
                            	<li id="li-notification">
                                    <a href="" title=""><span>到货通知</span></a>
                            	</li>
                            	<li id="li-point">
                                    <a href="" title=""><span>等级与特权</span></a>
                            	</li>
                            	<li id="li-newpoint">
                                    <a href="order?type=myPoint"><span>我的积分</span></a>
                            	</li>
                            	<li id="li-zhima">
                                    <a href="" title=""><span>芝麻信用</span></a>
                            	</li>
                            	<li id="li-authentication">
                                    <a href="validate_realname.jsp" title=""><span>实名认证</span></a>
                            	</li>
                            	<li id="li-balance">
                                    <a href="" title=""><span>代金券</span></a>
                            	</li>
                            	<li id="li-petal">
                                    <a href="" title=""><span>我的花瓣</span></a>
                            	</li>
                            	<li id="li-coupon">
                                    <a href="" title=""><span>我的优惠券</span></a>
                            	</li>
                            	<li id="li-myAddress">
                                    <a href="receiveAddr?type=addrList"><span>收获地址管理</span></a>
                            	</li>
                            </ol>
						</li>
						<li>
                            <h3><span>社区中心</span></h3>
                            <ol>
                            	<li id="li-prdRemark"  class="current">
                                    <a href="user?type=evaluation" ><span>商品评论</span></a>
                            	</li>
                            	<li id="li-msg">
                                    <a href="" title=""><span>站内信</span></a>
                            	</li>
                            </ol>
						</li>
					</ul>
				</div>
			</div>
		</div>
<!-- 右边 -->
		<div class="fr u-4-5">
			<div class="section-header">
				<div class="fl">
					<h2>商品评价</h2>
				</div>
				<div class="fr">
					<div class="ec-tab" id="ec-tab">
						<ul>
							<li class="current" id="before">
	                            <a href="" title="">最近六个月商品</a>
	                            <!-- <div class="ec-tab-arrow" style="width: 122px; left: 0px; display: none"></div> -->
							</li>
							<li id="six">
								<a href="">六个月之前商品</a>
							<!-- 	<div class="ec-tab-arrow" style="width: 110px; left: 124px;"></div> -->
							</li>
						</ul>
						
					</div>
				</div>
			</div>
			<div class="hr-20"></div>
			<div class="myOrder-record" id="myOrders-list-content">
				<div class="list-group-title">
					<table border="0" cellpadding="0" cellspacing="0" style="text-align: center">
						<thead>
							<tr>
								<th class="col-pro5">商品</th>
								<th class="col-price5">评价</th>
								<th class="col-quty5">评价等级</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${product}" var="product">
							<tr>
							<td>${product.name}</td>
							<td style="width: 300px">${product.content}</td>
							<td style="width: 122px">${product.level}颗星</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="list-group" id="list-group">
						<div class="list-group-empty">已显示所有记录。</div>
				</div>
			</div>
		</div>
	</div>
	<div class="hr-80"></div>



    <div id="DDbottom">
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
	<!-- 版权 -->
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
    </div>
</body>
</html>
 
