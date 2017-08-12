<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>登录</title>
		<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
		 <script type="text/javascript" src="js/jquery-1.6.min.js"></script>
		<script type="text/javascript" charset="utf-8">
		$(function(){
			var cookies=document.cookie.split(";");
			for(var i=0;i<cookies.length;i++){
				var temp=cookies[i].split("=");
				if(temp[0].trim()=="account"){
					 var acc=temp[1];
					 document.getElementById("account").value=acc;
					}
				}
			});
		function checkAcc(){
			var name=document.getElementById("account").value.trim();
			if(name==""){
				document.getElementById("acc_msg").innerHTML="用户名不能为空";
				}else{
				document.getElementById("acc_msg").innerHTML="";
				}
			}


		function checkPwd(){
			var pwd=document.getElementById("password").value.trim();
			if(pwd==""){
				document.getElementById("pwd_msg").innerHTML="密码不能为空";
				}else{
					document.getElementById("pwd_msg").innerHTML="";
				}
			}

		function Login(){
			var account=document.getElementById("account").value.trim();
			if(account!=""){
				var pwd=document.getElementById("password").value.trim();
				if(pwd!=""){
					var code=document.getElementById("input").value.trim();
					if(code!=""){
						$.post("user?type=login",{account:account,pwd:pwd},function(data){
							if(data==1){
								var rember=document.getElementById("rember").value;
								if(rember==1){
									$.post("user?type=rember",{account:account},function(data){
										});
									}	
								location.href="index.jsp";							
								}else{
									document.getElementById("account").value="";
									document.getElementById("password").value="";
									document.getElementById("input").value="";
									document.getElementById("che_code").innerHTML="";
									createCode();
									alert("账号或密码错误,请重新登录");
								}
							});
						}else{
						document.getElementById("che_code").innerHTML="验证码不能为空";
					}
				}else{
				document.getElementById("pwd_msg").innerHTML="密码不能为空";
			}
		}else{
		document.getElementById("acc_msg").innerHTML="请输入账号";
	}
}
		
		</script>
		<style type="text/css">
			#code
			{
				font-family:Arial;
				font-style:italic;
				font-weight:bold;
				border:0;
				letter-spacing:5px;
				color:blue;
			}
		</style>
		<script type = "text/javascript" src = "js/checkCode.js">
		</script>
	</head>
	<body style="background-color: ghostwhite;">
				<div class="container">
		<div class="row clearfix" style="height: 100px; margin-top: 8px;">
			<div class="col-md-2 column col-md-offset-1 text-right" >
				<img alt="140x140" src="img/huaweiLogo.png" />
			</div>
			<div class="col-md-9 column text-left" style="font-size: 20px; color: darkgray; margin-top: 10px; ">
				<strong>|华为商城</strong>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-7 column text-right">
				<img alt="500x500" src="img/bg11.jpg" />
			</div>
			<div class="col-md-4 column col-md-offset-1" style="margin-top: 50px;">
			
				<form role="form" action="user?type=login" method="post" >
					<div class="form-group" style="color: orangered; ">
						<h3>
							<strong>欢迎登录华为账号 </strong>
						</h3>
					</div>
					<div class="form-group" style="width: 283px; height: 41px; text-align: center;">
						<input class="form-control" id="account" name="account" type="text" onblur="checkAcc()" placeholder="请输入账号"/>
					</div>
					<div class="form-group">
						 <p name="acc_msg" id="acc_msg" style="color:#F00"></p>
					</div>
					<div class="form-group" style="width: 283px; height: 41px; ">
						 <input class="form-control" id="password" name="password" type="password" onblur="checkPwd()" placeholder="请输入密码"/>
					</div>
					<div class="form-group">
						 <p name="pwd_msg" id="pwd_msg" style="color:#F00"></p>
					</div>
					<div class="form-inline">
						<input class="form-control" id="input" type="text" style="width: 148px;height: 41px;" placeholder="不区分大小写" onblur="validate()"/>
						<input type = "button" id="code" onclick="createCode()"/>
					</div>
					<div class="form-group">
						 <p name="che_code" id="che_code" style="color:#F00"></p>
					</div>
					<div class="checkbox">
						 <label><input type="checkbox" name="rember" id="rember" value="1"/>记住账号</label>
					</div>
					<div class="form-group" style="color: darkgray;">
						<p>___________________________________</p>
					</div>
					
						<button class="btn btn-default" type="button" onclick="Login()" style="width: 283px; height: 50px; background-color: red;">登录</button>
					<div class="form-group" style="color: darkgray;">
						<br /><br />
						您还没有华为账号吧？<a href="regiest.jsp">免费注册</a><br /><br />
						<p>
							华为帐号适用于访问所有华为服务。您可登录
							该帐号，访问云服务、华为商城、华为/荣耀
							官网、花粉俱乐部及更多服务
						</p>
					</div>
				</form>
			</div>
		</div>
		<div class="row clearfix" >
			<div class="col-md-12 column" align="center" style="color: lightgray;">
			<br/><br/>
				<p >__________________________________________________________________________________________________________________________________________________</p>
				<br />
				<p><a href="#">用户协议</a>&nbsp;|&nbsp;<a href="#">&nbsp;隐私政策&nbsp;|&nbsp;</a><a href="#">&nbsp;常见问题</a></p>
				<p>
					 Copyright © 2011-2017 华为技术有限公司 版权所有 保留一切权利<br />
							苏B2-20070200号 | 苏ICP备09062682号-9
				</p>
				<br />
			</div>
		</div>
	</div>
	</body>
</html>


