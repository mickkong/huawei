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
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/shouji.css" />
<link rel="stylesheet" href="css/initialize.css">
<link rel="icon" href="images/hw.jpg">
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
					$("#firstLogin").attr("href","receiveAddr?type=addrList");
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
					<li><a href="#">更多精彩 <span class="tubiao"></span> </a>
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
			<div class="header_right">
				<ul style="width: 320px">
					<li class="header_right_li"><a id="firstLogin" href="login.jsp">请登录</a>
					</li>
					<li class="header_right_li"><a id="firstRegiest" href="regiest.jsp">注册</a>
					</li>
					<li class="header_right_li"><a href="#">我的订单</a>
					</li>
					<li class="header_right_li"><a href="shoppingCar?type=list"> <span
							class="header_right_span"> <img src="images/gwc.png">
						</span>购物车 </a>
						<div class="header_right_div">
							<p>
								<img src="images/big_gwc.png"></br> <span>快来查看你的购物车吧~</span>
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
			<a href="index.jsp">
				<div class="logo"></div>
			</a>
				<div class="naver">
					<ul>
						<li class="naver_li"><a href="showpro.jsp">手机</a> <!--<div class="phone">
										<ul class="phone_a">
											<li><a href="#">全部手机<</a></li>
											<li><a href="#">荣耀</a></li>
											<li><a href="#">HUAWEI p系列 </a></li>
											<li><a href="#">畅玩</a></li>
											<li><a href="#">HUAWEI Mate系列</a></li>
											<li><a href="#">HUAWEI nova系列</a></li>
											<li><a href="#">HUAWEI G系列</a></li>
											<li><a href="#">华为畅享系列</a></li>
											<li><a href="#">合约机</a></li>
										</ul>
									</div>--></li>
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

	<div class="hr_20"></div>
	<div class="hr_10"></div>

	<div class="g">
		<div class="breadcrumb-area">
			<a href="index.jsp" title="首页">首页</a> <span class="x">></span> <span>${proOne.proName}</span>
		</div>
	</div>
	<div class="hr_10"></div>
	<div class="product">
		<div class="product_left">
			<div class="tt">
				<img id="imgPaths" src="imgs/${ proOne.proImgPath}">
			</div>
			<div class="product_dd"></div>
		</div>
		<div class="product_right">
			<div class="product_meta">
				<h1 id="showName">${proOne.proName}</h1>
				<a href="#">领券立减200元，用券成交价4499元，赠送价值299元智能视窗保护套</a>
				<p>
					<span id="showMoney">￥ ${proOne.proPrice}</span> <i>领劵</i>
				</p>
			</div>
			<div class="product_top">
				<label>配</label>
				<div class="parts">
					<a href="" title="天际通 7天全球上网流量"><img src="images/xiaotu1.jpg" />
					</a> <a href="" title="HUAWEI Mate 9 Pro 智能视窗保护套（深灰色）"><img
						src="images/xiaotu2.jpg" /> </a>
				</div>
				<div class="parts_right">
					<span class="huawei"><a href="#">选择</a> </span>
					<div class="hello">
						<span class="prtprt"><img src="images/xuanze01.png" /> </span> <span
							class="prtprt_a"><img src="images/xuanze02.jpg" /> </span>
					</div>
				</div>
			</div>
			<span class="fenqi">支持分期&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;赠送积分</span>
			<div class="fenqi-more">
				<span style="font-size:12px;margin-right: 21px;">支持分期</span> <span
					style="font-size:12px;color: #888;l">支持花呗付款</span> <br /> <span
					style="font-size:12px;margin-right: 21px;">赠送积分</span> <span
					style="font-size:12px;color: #888;l">购买即赠商城积分，积分可抵现~</span>
			</div>
			<div class="fw_desc">
				<ul class="fw_desct">
					<li>服务说明</li>
					<li>已满48元已免运费</li>
					<li>由华为商城负责发货，并提供售后服务</li>
				</ul>
			</div>
			<div class="hr_15"></div>
			<div class="choice">
				<div class="option clearfix">
					<span>选择颜色</span>
					<ul id="findImg">
						<c:forEach items="${valueList}" var="value" varStatus="vs">
							<c:choose>
								<c:when test="${vs.count%3==1 && vs.count<=10 }">
									<li ><a
										href="javascript:void(0)"> <i style="margin-left:25px;">${value.value}&nbsp;</i>
									</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
				</div>

				<script type="text/javascript">
				   $("#findImg a").bind("click",function(){
				    var color=$.trim($(this).text());   
                    var proName=$("#showName").text();		                    
				   $.post("user?type=showProList&code=code&change=change",{"proName":proName,"color":color},
                         function(data) {
	                    var imgPath = $.parseJSON(data);
	                    $("#imgPaths").attr("src", "imgs/"+imgPath);   
                        });  	    
				   });						   		  	  
							</script>

				<div class="option clearfix">
					<span>选择制式</span>
					<ul>
						<li><a href="javascript:void(0)"> <span>全网通标配版</span>
						</a></li>
						<li><a href="javascript:void(0)"> <span>全网通高配版</span>
						</a></li>
					</ul>
				</div>
				<div class="option clearfix">
					<span>选择容量</span>
					<ul>
						<li><a href="javascript:void(0)"> <span >2GB+16GB</span>
						    </a></li>
						    <li><a href="javascript:void(0)"> <span >3GB+32GB</span>
						    </a></li>
						    <li><a href="javascript:void(0)"> <span >4GB+64GB</span>
						    </a></li>
						
					</ul>
				</div>
				<div class="option clearfix">
					<span>选择套餐</span>
					<ul>
						<li ><a href="javascript:void(0)"> <i>官方标配</i> </a></li>
					</ul>
				</div>
				<div class="option  clearfix"
					style="margin-bottom: 10px; position: relative;">
					<span>保障服务</span> <span class="tryu"
						style="width: 118px;height: 30px; line-height: 30px;">可选保障服务</span>
					<div class="hello1">
						<span class="prtprt_z"><img src="images/baozhan1.png" /> </span>
						<span class="prtprt_v"><img src="images/baozhan2.png" /> </span>
					</div>
				</div>
				<div class="option tip" style="padding: 0;margin-bottom: 10px;">
					<span>已选择商品</span> <span style="width:500px;color: #CA151D;"
						id="tips"></span>
				</div>
			</div>
			<div class="product_operation">
				<div class="product_stock">
					<label id="showNumb" style="position: absolute; margin-left: 15px">1</label>
					<button id="addBtn" onclick="add()"
						style="width: 20px;height: 22px;border: 1px solid white;position: absolute;top:0;right:0;margin-left: 43px">+</button>
					<button id="detBtn()" onclick="det()"
						style="width: 20px;height: 23px;border: 1px solid white;position: absolute;bottom:0;right:0;margin-left: 43px;margin-top: 22px">-</button>
				</div>
				<script type="text/javascript">
				      $(".choice li").bind("click",function(){
				       $(this).css({"border":"1px solid red"}).siblings().css({"border":" #a4a4a4"});
			     $(this).addClass("a-choic").siblings().removeClass("a-choic");
			       str = $(".a-choic").text();
			          $("#tips").text(str);
	               });				
				   function add(){
				      var numb=$("#showNumb").html();
				      $("#showNumb").html(Number(numb)+1);
				   }
				   function det(){
				      var numb=$("#showNumb").html();
				      if(numb<=0){
				         $("#showNumb").html(0);
				      }else{
				      $("#showNumb").html(Number(numb)-1);
				      }
				   }
							</script>
				<div class="product_button">
					<button onclick="hc()">立即下单</button>
					<button onclick="lyt()">加入购物车</button>
				</div>
				<script type="text/javascript">
				  
					
	//商品编号
	var proCode = 0;
	//商品单价
	var money = 0;
    //商品名
	var pname="${proOne.proName}";

	//中文乱码问题
	$.ajaxSetup( {
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		async : false
	});
	function hc() {
	
	    var user_id=0;
		var cookies=document.cookie.split(";");
		for(var i=0;i<cookies.length;i++){
			var temp=cookies[i].split("=");
			if(temp[0].trim()=="id"){
				user_id=temp[1];
				}
			}
		var num = $("#showNumb").text();
		var msg = $("#tips").text();
		if(user_id!=0){
	    
		var msg = $("#tips").text();
		if (msg.length == 54||msg.length==55) {
			$.post("user?type=findCode", {
				"msg" : msg,"name":pname
			}, function(data) {
				proInf = $.parseJSON(data);
				if(proInf==1){
				  alert("该商品一售罄！");
				}else{
				var pro = proInf.split("#");
				proCode = pro[0];
				money = pro[1];
				$("#showMoney").text(money);
				}
			});
			var uname = "${proOne.proName}";
			var num = $("#showNumb").text();
			if (num > 0 && money != 0) {
				location.href = "user?type=userList&uname=" + uname + "&money="
						+ money + "&productCode=" + proCode + "&num=" + num + "";
			}
		} else {	
		    alert("请选择商品明细哦！");		
		}
		}else{
		   location.href="login.jsp";
		}
	}

	function lyt() {
		var num = $("#showNumb").text();
		var msg = $("#tips").text();
		if (msg.length == 54||msg.length==55) {
			$.post("user?type=findCode", {
				"msg" : msg,"name":pname
			}, function(data) {
				proInf = $.parseJSON(data);
				if(proInf==1){
				  alert("该商品一售罄！");
				}else{
				var pro = proInf.split("#");
				proCode = pro[0];
				money = pro[1];
				$("#showMoney").text(money);
				}
			});
			if(proCode!=0){
			$.post("shoppingCar?type=add&product_code=" + proCode + "&num="
					+ num + "", function() {
				alert("添加成功");
			});
			}
		} else {
		
		alert("请选择商品明细哦！");
			
		}
	}
</script>
			</div>
		</div>
	</div>

	<div class="hr_21"></div>

	<div class="layout">
		<h3>- 关联商品 -</h3>
		<div class="product_main">
			<ul class="grid_list">
				<li>
					<div class="grid_rtop">
						<div class="grid_rtop1">
							<img src="images/con01.jpg" />
						</div>
						<div class="grid_rtop2">
							<p>华为手环 B3</p>
							<p class="rtop_p" style="margin-top: 0;">¥ 999.00</p>
						</div>
					</div></li>
				<li>
					<div class="grid_rtop">
						<div class="grid_rtop1">
							<img src="images/con02.jpg" />
						</div>
						<div class="grid_rtop2">
							<p>HUAWEI Mate 9 Pro 手机导航套件</p>
							<p class="rtop_p" style="margin-top: 0;">¥ 199.00</p>
						</div>
					</div></li>
				<li>
					<div class="grid_rtop">
						<div class="grid_rtop1">
							<img src="images/con03.jpg" />
						</div>
						<div class="grid_rtop2">
							<p>HUAWEI Mate 9</p>
							<p class="rtop_p" style="margin-top: 0;">¥ 3599.00</p>
						</div>
					</div></li>
				<li>
					<div class="grid_rtop">
						<div class="grid_rtop1">
							<img src="images/con04.jpg" />
						</div>
						<div class="grid_rtop2">
							<p>(热门配件)HUAWEI</p>
							<p class="rtop_p" style="margin-top: 0;">¥ 109.00</p>
						</div>
					</div></li>
			</ul>
		</div>
	</div>

	<div class="product_tab">
		<p>
			<a href="#">商品详情</a> <a href="#">规格参数</a> <a href="#">包装与售后</a> <a
				href="#">用户评价(36368)</a>
		</p>
	</div>

	<div class="feature_content">
		<div class="feature_jpg">
			<img src="images/datu01.jpg" /> <img src="images/datu02.jpg" /> <img
				src="images/datu03.jpg" /> <img src="images/datu04.png" />
		</div>
		<div class="feature_png">
			<img src="images/datu05.png" /> <img src="images/datu06.png"
				/ style="width: 100%;"> <img src="images/datu07.png" />
		</div>
	</div>


	<div class="bg_gray">
		<div class="bggray">
			<div class="product_impress">
				<div class="product_zuo">
					<label>好评度</label>
					<h1>99</h1>
					<em>%</em>
				</div>
				<div class="product_you">
					<label>买家印象</label>
					<div class="you_you">
						<ul>
							<li><a href="#">系统流畅 26578</a>
							</li>
							<li><a href="#">手感很棒 25891</a>
							</li>
							<li><a href="#">颜值爆表 25787</a>
							</li>
							<li><a href="#">分辨率高 20326</a>
							</li>
							<li><a href="#">物流快 17848</a>
							</li>
							<li><a href="#">拍照一流 15770</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="productCommentId">
		<div class="productCommentId01">
			<div class="comment_user">
				<img src="images/tx.png" />
				<p>飘落的枫叶</p>
			</div>
			<div class="comment_right">
				<ul>
					<li style="border: none; color: red;">☆☆☆☆☆</li>
					<li><a href="#">分辨率高</a>
					</li>
					<li><a href="#">颜值爆表</a>
					</li>
					<li><a href="#">物流快 </a>
					</li>
				</ul>
				<div class="wujie">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;说实话哈，两个字完美</div>
				<div class="wujie">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2017-07-12
					12:41</div>
				<div class="tr_5"></div>
				<div class="wujie" style="font-size: 12px;">
					<span style="color: red;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;华为商城回复：</span>千言万语都抵不过这句完美，感谢您的认可！
				</div>
			</div>
		</div>
	</div>

	<div class="product_title">
		<h3>
			<span style="color: red;">|</span>&nbsp;购买咨询
		</h3>
		<div class="tr_52"></div>
		<div class="product_tool">
			<p>
				<a href="#" style="color: red; border-bottom: 2px solid red;">全部咨询</a>
				<a href="#">常见问题</a> <a href="#">商品咨询</a> <a href="#">支付</a> <a
					href="#">配送</a> <a href="#">售后</a>
			</p>
		</div>
		<div class="product_inquire">
			<label>温馨提示：</label>
			因产线可能更改商品包装、产地、附配件等未及时通知，且每位咨询者购买、提问时间等不同。为此，客服给到的回复仅对提问者3天内有效，其他网友仅供参考！
			<br> 给您带来的不便还请谅解，谢谢！
		</div>
		<div class="inquire_bottom">
			<div class="inquire_bottom01">
				网友： <span>yanmingyanming8888</span> <label>&nbsp;&nbsp;3</label> <em>&nbsp;&nbsp;&nbsp;2017-07-29
					08:52:34</em>
			</div>
			<div class="inquire_bottom02">
				<label><strong>咨询内容：</strong> </label> <span>装上两个电话卡后，还能放内存卡吗？</span>
			</div>
			<div class="inquire_bottom03">
				<p>
					<label><strong>回复：</strong> </label>尊敬的华为用户，您好！HUAWEI Mate 9 Pro
					不支持插内存卡。感谢您对华为商城的支持。
				</p>
				<em style="font-size: 12px; float:left;">2017-07-29 13:36:12</em>
			</div>
		</div>
	</div>


	<div class="myConsultation">
		<a href="#">我要咨询</a>
	</div>

	<div class="product_link">
		<h3>- 热销榜单 -</h3>
		<div class="hot_main">
			<ul>
				<li><a href="#"> <img src="images/aa01.jpg" />
						<div class="">
							<p>荣耀9</p>
							<em>￥2299</em>
						</div> </a></li>
				<li><a href="#"> <img src="images/aa02.jpg" />
						<div class="">
							<p>HUAWEI nova 2 Plus</p>
							<em>￥2899</em>
						</div> </a></li>
				<li><a href="#"> <img src="images/aa03.jpg" />
						<div class="">
							<p>荣耀8青春版</p>
							<em>￥1099</em>
						</div> </a></li>
				<li><a href="#"> <img src="images/aa04.jpg" />
						<div class="">
							<p>HUAWEI Mate 9</p>
							<em>￥3099</em>
						</div> </a></li>
				<li><a href="#"> <img src="images/aa05.jpg" />
						<div class="">
							<p>荣耀V9</p>
							<em>￥2599</em>
						</div> </a></li>
			</ul>
		</div>
	</div>

	<div class="product_link">
		<h3>- 浏览记录 -</h3>
		<div class="hot_main">
			<ul>
				<li><a href="#"> <img src="images/aa06.jpg" />
						<div class="">
							<p>HUAWEI Mate 9 Pro</p>
							<em>￥5299</em>
						</div> </a></li>
				<li><a href="#"> <img src="images/aa07.jpg" />
						<div class="">
							<p>华为手环 B3</p>
							<em>￥999</em>
						</div> </a></li>
				<li><a href="#"> <img src="images/aa08.jpg" />
						<div class="">
							<p>荣耀8青春版</p>
							<em>￥1099</em>
						</div> </a></li>
				<li><a href="#"> <img src="images/aa06.jpg" />
						<div class="">
							<p>HUAWEI Mate 9</p>
							<em>￥3099</em>
						</div> </a></li>
				<li><a href="#"> <img src="images/aa07.jpg" />
						<div class="">
							<p>华为手环 B3</p>
							<em>￥999</em>
						</div> </a></li>
			</ul>
		</div>
	</div>

	<!--底部-->

	<div class="dibu_foot">
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
	</div>
	<!-- 底部 -->
	<div class="dibu_last">
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
						class="peisong">预约维修</a><br> <a href="#" class="peisong1">手机寄修</a><br>
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
	</div>
	<!--版权 -->
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
				<a href="#"><img src="images/weibu.png"> </a>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function(){	
	$("#tips").text();
	$(".fenqi").hover(function(){
		$(".fenqi-more").show();
	},function(){
		$(".fenqi-more").hide();
	});
});

$(function(){
	$(".parts_right").hover(function(){
		$(".hello").show();
	},function(){
		$(".hello").hide();
	});
});
$(function(){
	$(".tryu").hover(function(){
		$(".hello1").show();
	},function(){
		$(".hello1").hide();
	});	
});
</script>
</html>
