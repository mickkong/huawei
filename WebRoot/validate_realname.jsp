<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/dingdan.css">
	<link rel="stylesheet" type="text/css" href="css/renzheng.css">
	<link rel="stylesheet" href="css/initialize.css">
	<link  rel="icon" href="images/hw.jpg">
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<title>实名认证引导页-个人中心-华为商城</title> 
	<script type="text/javascript">
	$(function(){
		var cookies=document.cookie.split(";");
		for(var i=0;i<cookies.length;i++){
			var temp=cookies[i].split("=");
				if(temp[0].trim()=="id"){
					var id=temp[1];
					$.post("user?type=findUserById",{id:id},function(data){
						if(data!=0){
							var user=$.parseJSON(data).split("#");
							document.getElementById("owner").value=user[0];
							document.getElementById("ID").value=user[1];
							document.getElementById("card").value=user[2];
							document.getElementById("owner").readOnly="true";
							document.getElementById("ID").readOnly="true";
							document.getElementById("card").readOnly="true";
							document.getElementById("Button").style.display="none";
						}
					});
				}if(temp[0].trim()=="name"){
						document.getElementById("firstRegiest").style.display="none";
						document.getElementById("firstLogin").innerHTML=temp[1]+"个人中心";
						$("#firstLogin").attr("href","receiveAddr?type=addrList");
						}
			}
		});	
	//检测姓名
	function checkName(){
		var name=document.getElementById("owner").value;
		var regName =/^[\u4e00-\u9fa5]{2,4}$/;
		if(!regName.test(name)){
			document.getElementById("realName").innerHTML="真实姓名填写有误,请重新输入";
		    document.getElementById("owner").value="";
		}else{
			document.getElementById("realName").innerHTML="";
		}
	}
	//检测身份证号
	function checkID(){
		var id=document.getElementById("ID").value;
		var regIdNo = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
		 if(!regIdNo.test(id)){
		   document.getElementById("IDCard").innerHTML="身份证号填写有误";
		   document.getElementById("ID").value="";
		 }else{
			 document.getElementById("IDCard").innerHTML="";
			}
	}
	
	//检测银行卡号
	function checkCard(){
	  var num = /^\d*$/; //全数字
	  var card=document.getElementById("card").value; 
	   //开头6位
	   var strBin = "10,18,30,35,37,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,58,60,62,65,68,69,84,87,88,94,95,98,99";
	  if(card==""||card.length<16||card.length>19||!num.exec(card)||strBin.indexOf(card.substring(0,2))==-1) {
		  document.getElementById("bankCard").innerHTML="银行卡号不正确";
		  document.getElementById("card").value="";
	   }
	   else{
		   document.getElementById("bankCard").innerHTML="";
		   }
	}
	
	//提交
	function button(){
		var name=document.getElementById("owner").value.trim();
		if(name!=""){
			var id=document.getElementById("ID").value.trim();
			if(id!=""){
				var card=document.getElementById("card").value.trim();
				if(card!=""){
					$.post("user?type=validate",{name:name,id:id,card:card},function(data){
						if(data==1){
							alert("认证成功");
							document.getElementById("owner").readOnly="true";
							document.getElementById("ID").readOnly="true";
							document.getElementById("card").readOnly="true";
							document.getElementById("Button").style.display="none";
							}else{
							alert("认证失败");
							}
						});
					}else{
						document.getElementById("bankCard").innerHTML="银行卡号不能为空";
					}
				}else{
					document.getElementById("IDCard").innerHTML="身份证号不能为空";
				}
			}else{
				document.getElementById("realName").innerHTML="姓名不能为空";
			}
		}
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
			<div class="header_right" >
				<ul style="width: 320px">
					<li class="header_right_li"><a id="firstLogin" href="login.jsp">请登录</a></li>
					<li class="header_right_li"><a id="firstRegiest" href="regiest.jsp">注册</a></li>
					<li class="header_right_li"><a href="#">我的订单</a></li>
					<li class="header_right_li">
						<a href="#">
						<span class="header_right_span">
							<img src="images/gwc.png">
						</span>购物车
						</a>
						<div class="header_right_div">
							<p>
								<img src="images/big_gwc.png"> <br>
								<span>快来查看你的购物车吧~</span>
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
                                    <a href="order?type=myPoint"  title=""><span>我的积分</span></a>
                            	</li>
                            	<li id="li-zhima">
                                    <a href="" title=""><span>芝麻信用</span></a>
                            	</li>
                            	<li id="li-authentication"  class="current">
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
                                    <a href="receiveAddr?type=addrList" title=""><span>收货地址管理</span></a>
                            	</li>
                            </ol>
						</li>
						<li>
                            <h3><span>社区中心</span></h3>
                            <ol>
                            	<li id="li-prdRemark">
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
					<h2>实名认证</h2>
				</div>
				<div class="fr">
					<div class="progress-area">
						<div class="progress1"></div>
					</div>
				</div>
			</div>
			<div class="hr-20"></div>
		    <div class="form-edit">
				<form id="identity">
					<div class="form-table">
						<table border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<th>
                                        <span class="icon">*</span>
                                        <label for="id1">持卡人:</label>
									</th>
									<td>
                                        <input  id="owner" onblur="checkName()" placeholder="请输入持卡人姓名">
										<span id="realName" style="color:#F00"></span>
									</td>
								</tr>
								<tr>
									<th>
                                        <span class="icon">*</span>
                                        <label for="id2">身份证号:</label>
									</th>
									<td>
                                        <input  id="ID" onblur="checkID()" placeholder="请输入持卡人身份证号">
										<span id="IDCard" style="color:#F00"></span>
									</td>
								</tr>
								<tr>
									<th>
                                        <span class="icon">*</span>
                                        <label for="id3">卡号:</label>
									</th>
									<td>
                                        <input  id="card" onblur="checkCard()" placeholder="请输入银行卡号">
										<span id="bankCard" style="color:#F00"></span>
									</td>
								</tr>
								<tr class="action">
									<th>&nbsp;</th>
									<td>
                                        <button type="button" onclick="button()" id="Button">完成</button>
										
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
			</div>
			<div class="wxts">
				<img src="images/温馨提示.png" alt="">
			</div>
			<div class="agreeYHK">
				<img src="images/支持银行.png" alt="">
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
