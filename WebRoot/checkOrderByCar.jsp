<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="com.efficient.bean.ShoppingCar"%>
<%@ page import="com.efficient.bean.Product"%>
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
	<link rel="stylesheet" type="text/css" href="css/qjs.css">
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<title>去结算</title>
	<% int point=(Integer)request.getAttribute("point"); %>
	<%
		float total1=0.00f;
  		List<ShoppingCar> shop = (List<ShoppingCar>)request.getAttribute("shopList");
  		List<Product> product = (List<Product>)request.getAttribute("productList");
  		for(int i = 0;i<shop.size();i++) {
  		    for(int j = 0;j<product.size();j++){
  		    if(shop.get(i).getProduct_code().equals(product.get(j).getCode())){
  			  total1+=shop.get(i).getNum()*product.get(j).getPrice();
  			}
  		  }
  	 	}
  	 	float total=0.00f;
  	 	total=Float.parseFloat(String.format("%.2f", total1).toString());
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
		
		$(document).ready(function(){
		     //判断是否选中了复选框
			$("#checkbox").click(function(){
				//如果选中
				if ($("#checkbox").get(0).checked) {
				//若果积分兑换的钱大于了应付金额的百分之八十，则最多优惠金额的百分之八十,否则100积分兑换1元
					if((<%=point/100%>)>(<%=total%>*0.8)){
						$("#p1").html((<%=total*0.2%>).toFixed(2));
						$("#tdpoint").html("-￥"+<%=total*0.8%>.toFixed(2));
					}else{
						$("#p1").html((<%=total%>-<%=(float)point/100%>).toFixed(2));
						$("#tdpoint").html("-￥"+<%=(float)point/100%>.toFixed(2));
					}
				}//如果未被选中
				else{
				 	$("#p1").html((<%=total%>).toFixed(2));
				 	$("#tdpoint").html("-￥0.00");
				}
			});
		});

		//点击提交订单的时候触发（为了防止用户在网页上按F12对最后的应付金额进行修改）
		function jump(){
		var a=document.getElementById("selAddr");
	    var b=a.options[a.selectedIndex].value;
	    var c=a.options[a.selectedIndex].text;
	    if(c=="---请选择收货地址---"){
	    	alert("请选择收货地址");
	    }else{
		 var var2=(<%=total%>).toFixed(2); 
		 var userpoint=<%=Math.round(total/10) %> 	
		 if ($("#checkbox").get(0).checked) {
		    if((<%=point/100%>)>(<%=total%>*0.8)){
				var var1=(<%=total*0.2%>).toFixed(2);
		        location.href='order?type=orderInfo&money='+var1+'&allmoney='+var2+'&userpoint='+userpoint+'&address='+c+'&addrId='+b;  
			}else{
				var var1=(<%=total%>-<%=(float)point/100%>).toFixed(2);
		        location.href='order?type=orderInfo&money='+var1+'&allmoney='+var2+'&userpoint='+userpoint+'&address='+c+'&addrId='+b;  
			} 
		} else{
				//如果没有使用积分，则总积分=原始积分+此次购物获得的积分
				userpoint+=<%=point%>;
				var var1=<%=total%>.toFixed(2);
				location.href='order?type=orderInfo&money='+var1+'&allmoney='+var2+'&userpoint='+userpoint+'&address='+c+'&addrId='+b; 
				} 
			}
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
	<div class="header2_right2">
		<ul style="width: 320px">
			<li class="qqwe" style="width:160px">
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
			
		</ul>
	</div>
</div>

	<!-- logo -->
	<div class="logo">
		<div class="left clearfix">
			<a href="#" ><img src="images/Avmall.png" title="华为商城"></a>
			<span>确认订单</span>
		</div>
		<div class="right clearfix">
			<img src="images/Abbb.png" alt="">
		</div>
	</div>
		
	</div>


	<!-- 内容 -->
	<div class="ord-for">
		<h3 class="ord-tit ord-ass_div">收货人信息
			<a href="javascript:;" id="tck" data-id="model">[使用新地址]</a>
		</h3>
		<!-- 遮罩框 -->	
		<div id="model">
			<div class="modelbtn"   id="modelbtn">X</div> 
			<h3 class="model_h3">添加地址</h3>
			<div class="model_div">
				<div class="model_div1">
					<span class="model_span">&nbsp;&nbsp;&nbsp;&nbsp;*</span>
					<label class="model_label">收货人&nbsp;：</label>
					<input type="text"  class="model_div1_input">
				</div> 
				<div class="model_div1">
					<span class="model_span">*</span>
					<label class="model_label">收货地址&nbsp;：</label>
					<input type="text"  class="model_div1_input" placeholder="选择省—市—区-街道">
				</div> 
				<div class="model_div2">
					<input name="email" type="textarea" class="model_div2_input"
					 placeholder="如选择不到您的地区 请在此处详细描述">
				</div> 
				<div class="model_div1">
					<div class="model_div1_div">
						<span class="model_span">&nbsp;&nbsp;&nbsp;&nbsp;*</span>
						<label class="model_label">手机号码&nbsp;：</label>
						<input type="text"  class="model_div1_input1">
						
					</div> 
					<div class="model_div1_div">
						<label class="model_label">备选号码&nbsp;：</label>
						<input type="text"  class="model_div1_input1">
					</div> 
				</div> 
			</div> 
			<div class="model_btn">
			<button class="model_btn1">保存并使用</button> 
			<button class="model_btn1">取消</button> 
			</div> 
		</div>

		<!-- 地址 -->
		<!-- 地址 -->
		<div class="ord-ass">
				
			<div class="ord-tit ord-ass_div_1" style="margin-left: 20px">
			<p>
					<a href="receiveAddr?type=addrList" id="tck" data-id="model">添加</a>
					新地址
			</p>
			<select id="selAddr">
				<option>---请选择收货地址---</option>
				<c:forEach items="${listAddr}" var="listAddr">
				   <option value='${listAddr.id}'>${listAddr.receiver}-${listAddr.addr}
				     -${listAddr.zipcode}-${listAddr.phone}</option>
				</c:forEach>
			</select>
				
			</div>
		</div>
		<!-- 发票 -->
		<div class="ord-ivo">
			<h3 class="ord-tit">发票信息（注：如果商品由第三方卖家销售，发票内容由其卖家决定，发票由卖家开具并寄出）</h3>
			<div>
				<p>电子普通发票&nbsp;&nbsp;&nbsp;&nbsp;个人&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">修改</a></p>
			</div>
		</div>
	</div>

	<!-- 商品栏 -->
<div class="ord-shop">
	<div class="ord-pro">
		<table>
			<thead>
				<tr>
					<th style="height: 30px;">以下商品由&nbsp;<span>华为商城</span>&nbsp;选择合作快递</th>
				</tr>
			</thead>
		</table>
	</div >

	<div class="ord-pro2">
		<table>
			<thead>
				<tr>
					<th style="width:728px;">商品</th>
					<th>单价（元)</th>
					<th>数量</th>
					<th>小计（元）</th>
				</tr>
			</thead>
		</table>
	</div>

	<div class="ord-aera">
		<table>
			<tbody>
			
			 <c:forEach items="${shopList}" var="shop">
			   <c:forEach items="${productList}" var="product">
			   <c:if test="${shop.product_code==product.code}">
			 <tr>
			 	<td class="ord-left" style="width:728px;">
			 	<ul>
					<li><a href="#" >${product.name}</a></li>
					<li><i>[配]</i><a href="#" >荣耀V9 保护壳</a></li>
					<li><i>[配]</i><a href="#" >天际通 7天全球上网流量</a></li>
				</ul>
				</td>
				<td style="width:182px;">${product.price}</td>
				<td style="width:82px;">${shop.num}</td>
				<td><fmt:formatNumber type="number" value="${product.price*shop.num}" pattern="0.00" maxFractionDigits="2"/></td>
			 <tr>
			   </c:if>
			   </c:forEach>
			</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- 商品栏底部 -->
	<div class="ord-totla clearfix">
		<div class="totla_left">
			<ul>
				<li style="padding-top: 15px;"><input type="checkbox" name="" id="checkbox">
 					<p>使用积分</p>&nbsp;<a href="#" >（使用规则）</a>
					<br><p><font color="red"> ! 积分未满100不可用</font></p>
				</li>
				<li><input type="checkbox" name="">
					<p>使用优惠券</p>&nbsp;<a href="#" >（使用规则）</a>
				</li>
				<li><input type="checkbox" name="">
 					<p>使用花瓣</p>&nbsp;<a href="#" >（使用规则）</a>
				</li>
			</ul>
		</div>
		<div class="totla_right">
			<table>
				<tbody>
					<tr>
						<td>商品总金额：</td>
						<td class="xred">￥<%=total %></td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td>运费：</td>
						<td class="xred">￥0.00</td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td>使用优惠券：</td>
						<td class="xred">-￥0.00</td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td>使用积分：</td>
						<td class="xred" id="tdpoint">-￥0.00</td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td>使用花瓣：</td>
						<td class="xred">-￥0.00</td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td>商家活动：</td>
						<td class="xred">-￥0.00</td>
					</tr>
				</tbody>
				</table>

				<p>
 				<span> 结算金额：</span>
 				<b class="xred">￥<%=total %></b>
 				<span>可获得积分：<%=Math.round(total/10) %></span>
				</p>
			
		</div>
	</div>
</div>

<!-- 提交订单 -->
<div class="zf">
	<span>应付总额：<b id="p1">￥<%=total %></b>
	</span><br>
	<a href="javascript:jump()" title="提交订单" class="button_tj" seed="checkout-submit">提交订单</a>
</div>	
	  
 <!-- 底部   -->
     
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
				<a href="#" class="peisong">预约维修</a><br>
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
<script type="text/javascript">
		var  btn = document.getElementById("tck");
		var zDiv = document.createElement("div");
		var tDIV = document.getElementById("modelbtn");
		var mo = null;

		modelbtn.onclick = function(){
			modelbtn.style.display = 'none';
			mo.style.display = "none";
			zDiv.style.display = "none";
			tDIV.style.display = "block";
		}

		document.onkeydown = function(e){
			if(e.keyCode == 27){
				zDiv.style.display = 'none';
				mo.style.display = "none";
			}
		}

		btn.onclick = function(e){
			e.stopPropagation();
			zDiv.style = "position: absolute;left: 0;right: 0;bottom: 0;top:0;background: rgba(0,0,0,0.3);height:1366px;";
			document.body.appendChild(zDiv);
			
			mo = document.getElementById(this.getAttribute("data-id"));
			tDIV.style.display = "block";
			mo.style.position = "absolute";
			mo.style.zIndex = "50";
			mo.style.display = "block";


			modelPosi();

		}

		function modelPosi(){
			mo.style.left = (document.documentElement.clientWidth - mo.offsetWidth)/2 + "px";
			mo.style.top = (document.documentElement.clientHeight - mo.offsetHeight)/2 + "px";
		}

		window.onresize = function(){
			modelPosi();
		}
	</script>

 