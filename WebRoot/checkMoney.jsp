<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
	<link rel="stylesheet" href="css/initialize.css">
	<link  rel="icon" href="images/hw.jpg">
	<link rel="stylesheet" type="text/css" href="css/jsy.css">
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<title>结算页</title>
	<% 
	   //获得订单编号
	   String orderCode=(String)request.getAttribute("orderCode");
	   //获得用户此次购物获得的积分
	   int point=(Integer)(request.getAttribute("point"));
	   //获得用户的余额
	   float yuE=(Float)request.getAttribute("yuE");
	   //获得实收金额
	   float money=(Float)request.getAttribute("money");
	   
	 %>
	<script type="text/javascript">
	
		$(function(){
			var cookies=document.cookie.split(";");
			for(var i=0;i<cookies.length;i++){
				var temp=cookies[i].split("=");
					if(temp[0].trim()=="name"){
						document.getElementById("firstLogin").innerHTML=temp[1]+"的个人中心";
						document.getElementById("firstLogin2").innerHTML=temp[1];
						$("#firstLogin").attr("href","order?type=myOrder");
					}
				}
			});
		
		
			//然后写一个定时器
			window.setInterval(function(){
			 second --;
			 document.getElementById("showTimes").innerHTML = toDays();
			}, 1000);
	
			var second =86400; // 剩余秒数
			// 写一个方法，将秒数专为天数
			function toDays(){
			 var s = second % 60; // 秒
			 var mi = (second - s) / 60 % 60; // 分钟
			 var h =  ((second - s) / 60 - mi ) / 60 % 24; // 小时
			 var d =  (((second - s) / 60 - mi ) / 60 - h ) / 24 // 天
			 return "支付时间剩余：" + d + "天" + h + "小时" + mi + "分钟" + s + "秒，否则订单将自动取消。";
			}
		
			function paymoney(){
				if(<%=yuE%>><%=money%>){
					alert("支付成功！您的宝贝正在准备出库~"); 
					location.href='order?type=orderPayMoney&orderCode=<%=orderCode%>&point=<%=point%>&yuE=<%=yuE%>&money=<%=money%>';
				}else{
					alert("支付失败！您的余额不足，请去充值中心充值~"); 
				}
			}
	
			function order(){
			$("#orderdesc").css("display","block");
			}
	
</script>
</head>
<body>
<!-- 头部左边部分 -->
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
				<!-- 头部右边 -->
	  <div class="header2_right2" style="width: 360px">
		<ul >
			<li class="hjkl" style="width: 150px">
				<a href="#" id="firstLogin">157****8834 
				<span class="tubiao"></span>
				</a>
				<div class="tubiao2_hover">
					<div class="tubiao_div">
						<p><img src="images/peoplelogo.png"></p>
						<div class="number">
							<p class="number_p" id="firstLogin2">157****8834</p>
							<p class="number_tubiao">
								<span class="number_tubiao_span">
									<img src="images/QQpig4.png">实名
								</span>
								<span class="number_tubiao_span">
									<img src="images/QQpig5.png">站内信
								</span>
							</p>
						</div>
					</div>
					<div class="dingdan">
						<span class="span1">我的订单</span>
						<span class="span2">更多></span>
					</div>
					<div class="wenzi">
						<span>待支付</span>
						<span>待收货</span>
						<span>待评价</span>
						<span>退换货</span>
						<span>旧机回收</span>
					</div>
					<div class="tb_show">
						<div class="fenbufen">
							<p class="fenbufen_p">
								<img src="images/QQpig1.png">
							</p>
							<p >积分</p>
							<p class="fenbufen_p1">${prePoint}分</p>
						</div>
						<div class="fenbufen">
							<p class="fenbufen_p">
								<img src="images/QQpig2.png">
							</p>
							<p >优惠券</p>
							<p class="fenbufen_p1">--张</p>
						</div>
						<div class="fenbufen">
							<p class="fenbufen_p">
								<img src="images/QQpig3.png">
							</p>
							<p >代金券</p>
							<p class="fenbufen_p1">0元</p>
						</div>
					</div>
					<button>退出登录</button>
				</div>
			</li>
			
			<li ><a href="order?type=myOrder">我的订单</a></li>
			
			<li class="header_right_li">
				<a href="#">
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
</div>

<!-- logo -->
	<div class="logo">
		<div class="left clearfix">
			<a href="#" ><img src="images/Avmall.png" title="华为商城"></a>
			<span style="color: #000000;">结算页</span>
		</div>
		<div class="right clearfix">
		</div>
	</div>
	
	<div class="order_confirm">
		<div class="h">
			<img src="images/bttn02.png"/>
			<div class="hh">
				<h3>订单提交成功！只差付款了~</h3>
				<p>付款金额（元）：<b class="red"><%=money %></b><b class="red">&nbsp;元</b></p>
				<div class="hh01" id="showTimes">
				</div>
			</div>
		</div>
		<div class="s">
			<a href="javascript:order()">订单详情</a>
			<div id="orderdesc" style="display: none;margin-left: 50px">
				收货地址：${address}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				订单编号：${orderCode}
			</div>
		</div>
	</div>
<!-- 选择部分 -->
	<div class="xuanzebufen">
		选择支付方式&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">[&nbsp;重新选择&nbsp;]</a>
	</div>
<!-- 选择栏 -->
	<div class="xuanzelan">
		<div class="h">第三方支付平台</div>
		<div class="xuanzelan_div">
			<div class="xuanzelan_div1">
				<input type="radio" class="radio">
				<label>
					<img src="images/logo1.png" style="width:93px;height:34px;">
					<img src="images/logo2.jpg" style="width:21px;height:34px;">
				</label>
			</div>
			<div class="xuanzelan_div1">
				<input type="radio" class="radio">
				<label>
					<img src="images/wechat_logo.gif" style="width:93px;height:34px;">
				</label>
			</div>
			<div class="xuanzelan_div1">
				<input type="radio" class="radio">
				<label>
					<img src="images/tenpay_logo.gif" style="width:93px;height:34px;">
				</label>
			</div>
		</div>
	</div>
	<div class="xuanzelan">
		<div class="h">分期付款：支持以下各银行储蓄卡及信用卡，查看分期付款</div>
		<div class="xuanzelan_div">
			<div class="xuanzelan_div1">
				<input type="radio" class="radio">
				<label>
					<img src="images/HB_OUT.gif" style="width:93px;height:34px;">
				</label>
			</div>
			<div class="xuanzelan_div1">
				<input type="radio" class="radio">
				<label>
					<img src="images/QQpig6.png" style="width:93px;height:34px;">
				</label>
			</div>
		</div>
	</div>
	<div class="xuanzelan">
		<div class="h">银行网银&nbsp;&nbsp;<span>支持以下各银行储蓄卡及信用卡</span>&nbsp;&nbsp;<a href="#">[查看支付限额]</a></div>
		<div class="xuanzelan_div">
			<div class="xuanzelan_div1">
				<input type="radio" class="radio">
				<label>
					<img src="images/ABC_OUT.gif" style="width:93px;height:34px;">
				</label>
			</div>
			<div class="xuanzelan_div1">
				<input type="radio" class="radio">
				<label>
					<img src="images/BOC_OUT.gif" style="width:93px;height:34px;">
				</label>
			</div>
			<div class="xuanzelan_div1">
				<input type="radio" class="radio">
				<label>
					<img src="images/CCB_OUT.gif" style="width:93px;height:34px;">
				</label>
			</div>
			<div class="xuanzelan_div1">
				<input type="radio" class="radio">
				<label>
					<img src="images/CMB_OUT.gif" style="width:93px;height:34px;">
				</label>
			</div>
			<div class="xuanzelan_div1">
				<input type="radio" class="radio">
				<label>
					<img src="images/COMM_OUT.gif" style="width:93px;height:34px;">
				</label>
			</div>
			<div class="xuanzelan_div1">
				<input type="radio" class="radio">
				<label>
					<img src="images/ICBC_OUT.gif" style="width:93px;height:34px;">
				</label>
			</div><div class="xuanzelan_div1">
				<input type="radio" class="radio">
				<label>
					<img src="images/PSBC_OUT.gif" style="width:93px;height:34px;">
				</label>
			</div>
		</div>
	</div>
	<div class="xuanzelan">
		<div class="h">信用卡快捷支付&nbsp;&nbsp;<span>无需网银</span></div>
		<div class="xuanzelan_div">
			<div class="xuanzelan_div1">
				<input type="radio" class="radio">
				<label>
					<img src="images/ABC_OUT.gif" style="width:93px;height:34px;">
				</label>
			</div>
			<div class="xuanzelan_div1">
				<input type="radio" class="radio">
				<label>
					<img src="images/CCB_OUT.gif" style="width:93px;height:34px;">
				</label>
			</div>
			<div class="xuanzelan_div1">
				<input type="radio" class="radio">
				<label>
					<img src="images/BOC_OUT.gif" style="width:93px;height:34px;">
				</label>
			</div>
			<div class="xuanzelan_div1">
				<input type="radio" class="radio">
				<label>
					<img src="images/COMM_OUT.gif" style="width:93px;height:34px;">
				</label>
			</div>
			<div class="xuanzelan_div1">
				<input type="radio" class="radio">
				<label>
					<img src="images/CMB_OUT.gif" style="width:93px;height:34px;">
				</label>
			</div>
			<div class="xuanzelan_div1">
				<input type="radio" class="radio">
				<label>
					<img src="images/CEB_OUT.gif" style="width:93px;height:34px;">
				</label>
			</div><div class="xuanzelan_div1">
				<input type="radio" class="radio">
				<label>
					<img src="images/COMM_OUT.gif" style="width:93px;height:34px;">
				</label>
			</div>
		</div>
	</div>
<!-- 按钮栏 -->
	<div class="button">
		<input type="checkbox">使用代金券支付
		<span>可用代金券金额:&nbsp;0.00元</span>
		<a href="javascript:paymoney()" class="button_a">确认支付</a>
	</div>
<!--底部 -->
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
