<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.efficient.bean.OrderInfo"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/dingdan.css">
<link rel="stylesheet" href="css/initialize.css">
<link rel="icon" href="images/hw.jpg">
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script src="bootstrap/js/bootstrap.js"> </script>
<title>我的订单-个人中心-华为商城</title>


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

		function jump(id1,id2,id3,id4,id5,id6,li1,li2,li3,li4,li5,li6){
			$("#"+id1).css("display","block");
			$("#"+id2).css("display","none");
			$("#"+id3).css("display","none");
			$("#"+id4).css("display","none");
			$("#"+id5).css("display","none");
			$("#"+id6).css("display","none");
//			document.getElementById(id1).style.display="block";
//			document.getElementById(li1).setAttribute("class","current");
			$("#"+li1).attr("class","current");
			$("#"+li2).attr("class","");
			$("#"+li3).attr("class","");
			$("#"+li4).attr("class","");
			$("#"+li5).attr("class","");
			$("#"+li6).attr("class","");
			
		}
		
		function payMoney(orderNo,amt){
		    location.href='order?type=orderToMoney&orderNo='+orderNo+'&amt='+amt;
		}
		
		
		function clearOrder(orderNo){
			$.post("order?type=clearOrder&orderNo="+orderNo,function(data){
				var num=$.parseJSON(data);
				if(num==1){
				 alert("订单已取消！");
				}
				window.location.reload()
			})
		}
		
		function sureOrder(orderNo){
			$.post("order?type=sureOrder&orderNo="+orderNo,function(data){
				alert("已确认收货！");
				window.location.reload()
			})
		}
		
		function getcode(e){
			var code=e;
			$("#orderNo").val(code);
		}
		
	</script>
</head>
<body>
	<!-- 头部 -->
	<div class="head">
		<div class="head_short">
			<div class="header_left">
				<ul>
					<li><a href="#">华为官网</a>
					</li>
					<li><a href="#">荣耀官网</a>
					</li>
					<li><a href="#">花粉俱乐部</a>
					</li>
					<li><a href="#">帮助中心</a>
					</li>
					<li><a href="#">v码(优购码)</a>
					</li>
					<li><a href="#">Select&nbsp;Region</a>
					</li>
					<li><a href="#">更多精彩 <span class="tubiao"></span>
					</a>
						<div class="tubiao_hover">
							<P class="tubiao_hover_p">
								<a href="#" class="tubiao_a">EMUI</a>
							</P>
							<P class="tubiao_hover_p">
								<a href="#" class="tubiao_a">应用市场</a>
							</P>
							<P class="tubiao_hover_p">
								<a href="#" class="tubiao_a">云服务</a>
							</P>
							<P class="tubiao_hover_p">
								<a href="#" class="tubiao_a">开发者联盟</a>
							</P>
							<P class="tubiao_hover_p1">
								<img src="images/ewm.jpg">
							<p class="tubiao_a">扫一扫 ,下载客户端</p>
							</P>
						</div></li>
				</ul>
			</div>
			<div class="header_right" >
				<ul style="width: 320px">
					<li class="header_right_li"><a id="firstLogin" href="login.jsp">请登录</a>
					</li>
					<li class="header_right_li"><a id="firstRegiest" href="regiest.jsp">注册</a>
					</li>
					<li class="header_right_li"><a href="order?type=myOrder">我的订单</a>
					</li>
					<li class="header_right_li"><a href="#"> <span
							class="header_right_span"> <img src="images/gwc.png">
						</span>购物车 </a>
						<div class="header_right_div">
							<p>
								<img src="images/big_gwc.png"> <br> <span>快来查看你的购物车吧~</span>
							</p>
						</div></li>
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
						<li class="naver_li"><a href="#">手机</a>
						</li>
						<li class="naver_li"><a href="#">笔记本&平板</a>
						</li>
						<li class="naver_li"><a href="#">穿戴</a>
						</li>
						<li class="naver_li"><a href="#">智能家居</a>
						</li>
						<li class="naver_li"><a href="#">通用配件</a>
						</li>
						<li class="naver_li"><a href="#">专属配件</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="right">
				<div class="right_input">
					<form>
						<input type="text" class="rigth_text" onclick="text()">
					</form>
					<div class="right_input_div">
						<a href="#">HUAWEI nova 2</a>&nbsp;&nbsp; <a href="#">荣耀8青春版</a>
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
			<a href="" title="首页">首页</a> <em id="pathPoint">\</em> <a href=""
				title="我的商城" id="personCenter">我的商城</a> <em id="pathPoint">\</em> <a
				id="pathTitle">我的订单</a>
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
							<h3>
								<span>订单中心</span>
							</h3>
							<ol>
								<li id="li-order" class="current">
								<a href="order?type=myOrder" title=""><span>我的订单</span>
								</a></li>
								<li id="li-exchange"><a href="returnThing.jsp" title=""><span>我的退货款</span>
								</a></li>
								<li id="li-recover"><a href="" title=""><span>我的回收单</span>
								</a></li>
							</ol></li>
						<li>
							<h3>
								<span>个人中心</span>
							</h3>
							<ol>
								<li id="li-myAppointment"><a href="" title=""><span>我的预约</span>
								</a></li>
								<li id="li-notification"><a href="" title=""><span>到货通知</span>
								</a></li>
								<li id="li-point"><a href="" title=""><span>等级与特权</span>
								</a></li>
								<li id="li-newpoint"><a href="order?type=myPoint"><span>我的积分</span>
								</a></li>
								<li id="li-zhima"><a href="" title=""><span>芝麻信用</span>
								</a></li>
								<li id="li-authentication"><a href="validate_realname.jsp" title=""><span>实名认证</span>
								</a></li>
								<li id="li-balance"><a href="" title=""><span>代金券</span>
								</a></li>
								<li id="li-petal"><a href="" title=""><span>我的花瓣</span>
								</a></li>
								<li id="li-coupon"><a href="" title=""><span>我的优惠券</span>
								</a></li>
								<li id="li-myAddress"><a href="receiveAddr?type=addrList"><span>收货地址管理</span>
								</a></li>
							</ol></li>
						<li>
							<h3>
								<span>社区中心</span>
							</h3>
							<ol>
								<li id="li-prdRemark"><a href="user?type=evaluation" ><span>商品评论</span>
								</a></li>
								<li id="li-msg"><a href="" title=""><span>站内信</span>
								</a></li>
							</ol></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 右边 -->
		<div class="fr u-4-5">
			<div class="section-header">
				<div class="fl">
					<h2>我的订单</h2>
				</div>
				<div class="fr">
					<div class="ec-tab" id="ec-tab">
						<ul>
							<li class="current" id="before"><a href="" title="">最近六月内订单</a>
							</li>
							<li id="six"><a href="">六个月前订单</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="myOrder-cate" id="myOrder-cate">
				<ul>
					<li class="current" id="li1"><a
						href="javascript:jump('list-group1','list-group2','list-group3','list-group4','list-group5','list-group6','li1','li2','li3','li4','li5','li6')">全部有效订单</a>
					</li>
					<li id="li2"><a
						href="javascript:jump('list-group2','list-group1','list-group3','list-group4','list-group5','list-group6','li2','li1','li3','li4','li5','li6')">待支付</a>
					</li>
					<li id="li3"><a
						href="javascript:jump('list-group3','list-group1','list-group2','list-group4','list-group5','list-group6','li3','li1','li2','li4','li5','li6')">待评价</a>
					</li>
					<li id="li4"><a
						href="javascript:jump('list-group4','list-group1','list-group2','list-group3','list-group5','list-group6','li4','li1','li2','li3','li5','li6')">待收货</a>
					</li>
					<li id="li5"><a
						href="javascript:jump('list-group5','list-group1','list-group2','list-group3','list-group4','list-group6','li5','li1','li2','li3','li4','li6')">已完成</a>
					</li>
					<li id="li6"><a
						href="javascript:jump('list-group6','list-group1','list-group2','list-group3','list-group4','list-group5','li6','li1','li2','li3','li4','li5')">已取消</a>
					</li>
				</ul>
			</div>
			<div class="myOrder-record" id="myOrders-list-content">
				<div class="myOrder-control">
					<div class="quanxuan">
						<label class="inputbox" for="checkAllBox"> <input
							class="checkbox" type="checkbox" id="checkAllBox"
							name="checkAllBox" /> <span>全选</span> </label>
					</div>
					<a href="" class="button-operate-merge-pay" id="topButton">合并支付</a>
				</div>
				<div class="list-group-title">

					<table border="0" cellpadding="0" cellspacing="0"
						style="text-align:center">
						<thead>
							<tr>
								<th class="col-pro">商品编号</th>
								<th class="col-price">下单时间</th>
								<th class="col-quty">应付款/元</th>
								<th class="col-pay">实付款/元</th>
								<th class="col-operate">订单状态及操作</th>
							</tr>
						</thead>
					</table>
				</div>
				<!--全部有效订单-->
				<div class="list-group" id="list-group1" style="display:block;">
					<table style="text-align: center">
						<c:forEach items="${partList}" var="orderList">
							<tr height="80px">
								<td width="295px">${orderList.orderNo}</td>
								<td width="231px">${orderList.createDate}</td>
								<td width="124px">${orderList.amt}</td>
								<td width="124px">${orderList.finalAmt}</td>
								<td><c:choose>
										<c:when test="${orderList.state==('待支付')}">
											<p>${orderList.state}</p>
											<p>
												<a
													href="javascript:payMoney('${orderList.orderNo}','${orderList.amt}')">立即支付</a>
											</p>
											<p>
												<a href="javascript:clearOrder('${orderList.orderNo}')">取消订单</a>
											</p>
										</c:when>
										<c:when test="${orderList.state==('已发货')}">
											<p>${orderList.state}</p>
											<p>
												<a href="javascript:sureOrder('${orderList.orderNo}')">确认收货</a>
											</p>
											<p>
												<a href="KD.jsp">查看物流</a>
											</p>
										</c:when>
										<c:when test="${orderList.state==('待评价')}">
											<p>${orderList.state}</p>
											<p>
												<a data-user="${orderList.orderNo}" data-toggle="modal"
													data-target="#exampleModal"
													onclick="getcode(${orderList.orderNo})">立即评价</a>
											</p>
										</c:when>
										<c:otherwise>
											<p>${orderList.state}</p>
										</c:otherwise>
									</c:choose></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!--待支付订单-->
				<div class="list-group" id="list-group2" style="display: none;">
					<table style="text-align: center">
						<c:forEach items="${noPayList}" var="noPayList">
							<tr height="80px">
								<td width="295px">${noPayList.orderNo}</td>
								<td width="231px">${noPayList.createDate}</td>
								<td width="124px">${noPayList.amt}</td>
								<td width="124px">${noPayList.finalAmt}</td>
								<td><p>${noPayList.state}</p>
									<p>
										<a
											href="javascript:payMoney('${noPayList.orderNo}','${noPayList.amt}')">立即支付</a>
									</p>
									<p>
										<a href="javascript:clearOrder('${noPayList.orderNo}')">取消订单</a>
									</p></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!--待评价订单-->
				<div class="list-group" id="list-group3" style="display: none;">
					<table style="text-align: center">
						<c:forEach items="${noEvaList}" var="noEvaList">
							<tr height="80px">
								<td width="295px">${noEvaList.orderNo}</td>
								<td width="231px">${noEvaList.createDate}</td>
								<td width="124px">${noEvaList.amt}</td>
								<td width="124px">${noEvaList.finalAmt}</td>
								<td><p>${noEvaList.state}</p>
									<p>
										<a data-user="${noEvaList.orderNo}" data-toggle="modal"
													data-target="#exampleModal"
													onclick="getcode(${noEvaList.orderNo})">立即评价</a>
									</p>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!--待收货订单-->
				<div class="list-group" id="list-group4" style="display: none;">
					<table style="text-align: center">
						<c:forEach items="${noRecList}" var="noRecList">
							<tr height="80px">
								<td width="295px">${noRecList.orderNo}</td>
								<td width="231px">${noRecList.createDate}</td>
								<td width="124px">${noRecList.amt}</td>
								<td width="124px">${noRecList.finalAmt}</td>
								<td><p>${noRecList.state}</p>
									<p>
										<a href="javascript:sureOrder('${noRecList.orderNo}')">确认收货</a>
									</p>
									<p>
									<a href="KD.jsp">查看物流</a>
									</p>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!--已完成订单-->
				<div class="list-group" id="list-group5" style="display: none;">
					<table style="text-align: center">
						<c:forEach items="${finishList}" var="finishList">
							<tr height="80px">
								<td width="295px">${finishList.orderNo}</td>
								<td width="231px">${finishList.createDate}</td>
								<td width="124px">${finishList.amt}</td>
								<td width="124px">${finishList.finalAmt}</td>
								<td><p>${finishList.state}</p>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!--已取消订单-->
				<div class="list-group" id="list-group6" style="display: none;">
					<table style="text-align: center">
						<c:forEach items="${cutOffList}" var="cutOffList">
							<tr height="80px">
								<td width="295px">${cutOffList.orderNo}</td>
								<td width="231px">${cutOffList.createDate}</td>
								<td width="124px">${cutOffList.amt}</td>
								<td width="124px">${cutOffList.finalAmt}</td>
								<td><p>${cutOffList.state}</p>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="list-group-empty">已显示所有相关记录。</div>
			</div>
		</div>
	</div>
	<div class="hr-80"></div>

	<div id="DDbottom">
		<!-- 尾部 -->
		<div class="foot_slogan">
			<ul>
				<li class="s1"><a href="#"> <i class="i1"></i>
						500强企业&nbsp;品质保证 </a></li>
				<li class="s1"><a href="#"> <i class="i2"></i>
						7天包退&nbsp;15天换货 </a></li>
				<li class="s1"><a href="#"> <i class="i3"></i> 48元起免运费 </a></li>
				<li class="s1"><a href="#"> <i class="i4"></i>
						448家维修网点&nbsp;全国联保 </a></li>
			</ul>
		</div>
		<!-- 底部 -->
		<div class="last">
			<div class="last_left">
				<ul>
					<li>
						<p>购物相关</p> <a href="#">购物指南</a><br> <a href="#">配送方式</a><br>
						<a href="#">支付方式</a><br> <a href="#">常见问题</a><br></li>
					<li>
						<p>保修与退换货</p> <a href="#">保修政策</a><br> <a href="#">退换货政策</a><br>
						<a href="#">退换货流程</a><br> <a href="#">保修状态查询</a><br></li>
					<li>
						<p>维修与技术支持</p> <a href="#">售后网点</a><br> <a href="#"
						class="peisong">配送方式</a><br> <a href="#" class="peisong1">手机寄修</a><br>
						<a href="#" class="peisong2">维修配件价格查询</a><br></li>
					<li>
						<p>关于我们</p> <a href="#">公司介绍</a><br> <a href="#">华为商城简介</a><br>
						<a href="#">零售店铺</a><br> <a href="#">诚征英才</a><br></li>
					<li>
						<p>关注我们</p> <a href="#">新浪微博</a><br> <a href="#">腾讯微博</a><br>
						<a href="#">花粉俱乐部</a><br></li>
					<li>
						<p>友情链接</p> <a href="#">华为官网</a><br> <a href="#">华为消费者业务</a><br>
						<a href="#">荣耀官网</a><br> <a href="#">花粉俱乐部</a><br></li>
				</ul>
			</div>
			<div class="last_right">
				<p class="big">400-088-6888</p>
				<p class="small">24小时客服在线(仅收市话费)</p>
				<a href="#" class="last_a"> <i></i> 在线客服 </a>
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
						<p>
							<a href="#">隐私政策</a>&nbsp;<a href="#">服务协议</a>
							Copyright@2012-2017&nbsp;VMALL.com版权所有 保留一切权利
						</p>
						<p>
							公安备案&nbsp;<a href="#">苏公网安备320114020110009号</a> | <a href="#">苏ICP备17040376号-6</a>
							| 增值电信业务经营许可证：苏B2-20130048号 |
						</p>
						<p>
							网络文化经营许可证：<a href="#">苏网文[2015] 1599-026号</a>
						</p>
					</div>
				</div>
				<div class="banquan_right">
					<a href="#"><img src="images/weibu.png">
					</a>
				</div>
			</div>
		</div>
	</div>

	<!-- 模态框 -->

	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">评价</h4>
				</div>
				
				<div class="modal-body">
					<form action="order?type=evaOrder" method="post">
						<input type="hidden" name="orderNo" id = "orderNo">
						<div class="form-group">
							<label style="display:none">商品编号</label> 
							<input style="display:none" type="text" name="orderNo" id="orderNo" /> 
							<label for="recipient-name"class="control-label">评价等级:
							</label> 
								<input type="radio" name="level" value="1">☆&nbsp;&nbsp; 
								<input type="radio" name="level" value="2">☆☆&nbsp;&nbsp; 
								<input type="radio" name="level" value="3">☆☆☆&nbsp;&nbsp; 
								<input type="radio" name="level" value="4">☆☆☆☆&nbsp;&nbsp; 
								<input type="radio" name="level" value="5" checked="checked">☆☆☆☆☆&nbsp;&nbsp;

						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">评价内容:</label>
							<textarea class="form-control" id="message-text" name="content"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" style="width: 80px" data-dismiss="modal">关闭</button>
							<button type="submit" style="width: 80px">提交</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

</body>
</html>

