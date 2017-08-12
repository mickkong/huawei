<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<link  rel="icon" href="images/hw.jpg">
	<link rel="stylesheet"  href="css/zhuce.css">
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<title>注册_华为账号</title>
	<script type="text/javascript">
	function checkAcc(){
		var name=document.getElementById("account").value.trim();
		var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
		if(!myreg.test(name)){
			document.getElementById("acc_msg").innerHTML="账号格式错误";
			}else{
				document.getElementById("acc_msg").innerHTML="";
				$.post("user?type=checkAcc",{name:name},function(data){
					if(data==0){
						}else{
						document.getElementById("acc_msg").innerHTML="该用户已存在，请重新输入！";
						document.getElementById("account").value="";
					}
				});
			}		
		}

	function checkPwd(){
		var pwd=document.getElementById("pwd").value.trim();
		if(pwd.length<8 || pwd.length>20){
			document.getElementById("pwd").value="";
			document.getElementById("acc_pwd").innerHTML="不得少于8个或大于20个字符，请重新输入";
		}else{
			document.getElementById("acc_pwd").innerHTML="";
		};
	}
	function comfirmPwd(){
		var pwd=document.getElementById("pwd").value.trim();
		var comfirmPwd=document.getElementById("comfirmPwd").value.trim();
		if(comfirmPwd!=pwd){
			document.getElementById("acc_pwd_two").innerHTML="两次密码不一致，请重新输入";
			document.getElementById("comfirmPwd").value="";
			}else{
				document.getElementById("acc_pwd_two").innerHTML="";
			}
		}
	function regiest(){
		var name=document.getElementById("account").value.trim();
		if(name!=""){
			var pwd=document.getElementById("pwd").value.trim();
			if(pwd!=""){
				var comfirmPwd=document.getElementById("comfirmPwd").value.trim();
				if(comfirmPwd!=""){
					$.post("user?type=regiest",{name:name,pwd:pwd},function(data){
						if(data==1){
							alert("注册成功，请登录")
							location.href="login.jsp";
							}else{
							alert("注册失败");
								}
						});
					}else{
						document.getElementById("acc_pwd_two").innerHTML="两次密码不一致，请重新输入";
						}
				}else{
					document.getElementById("acc_pwd").innerHTML="不得少于8个或2个字符，请重新输入";
					}
			}else{
				document.getElementById("acc_msg").innerHTML="请输入账号";
				}
		}
	</script>
</head>
<body>
<!-- 图片 -->
<div class="header">
	<div class="tubiao">
		<img src="images/logo2.png">
		<b>|&nbsp;华为商城</b>
	</div>
</div>
<!-- 登录 -->
<div class="denglu">
	已有华为账号&nbsp;&nbsp;<a href="login.jsp" title="登录">登录</a>&nbsp;▶
</div>
<!-- 注册中心 -->
<div class="zhuce">
	<h3 class="zhuce_h3">注册华为账号</h3>
	<p class="node-intro">华为帐号适用于访问所有华为服务。</p>
	<div class="box-shadow-in"></div>
<!-- 选择国家 -->
	<div class="node" id="chooseCountry">			
		<div class="node-title">国家/地区
			</div>
				<div class="foot-selectCountry-margin selectCountry-right">
					<div class="selectCountryImg_style"></div>	    
					<div class="selectedCountry_style"><div>
				    <div id="selectedCountry">中国</div>
				    </div>
			  </div>
			</div>					
			<div id="regXCountry" class="node-intro">您正在注册中国的华为帐号。</div>
	</div>
	<div class="box-shadow-in"></div>
<!-- 华为账号 -->
	<div class="node" id="chooseCountry">			
		<div class="node-title">华为账号</div>				
			<div id="regXCountry" class="node-intro">输入您的手机号作为华为账号，用于登录，重设密码，验证身份</div>
		<div class="node_input">
			<span>手机号:</span><input type="text" onblur="checkAcc()" id="account" placeholder="输入手机号" class="size">
			<span id="acc_msg" style="color:#F00"></span>
		</div>
		<div class="node_input">
			<span>验证码:</span><input type="text" class="size" placeholder="短信验证码">
			<input type="button" class="node_btn" value="获取验证码">
		</div>
	</div>
	<div class="box-shadow-in"></div>
<!-- 登录密码 -->
	<div class="node" id="chooseCountry">			
		<div class="node-title">设置登录密码</div>				
		<div class="node_input">
			<span class="denglu_span1">密码:</span><input type="password" id="pwd" onblur="checkPwd()" placeholder="8~20个字符" class="size length">
			<span id="acc_pwd" style="color:#F00"></span>
		</div>
		<div class="node_input">
			<span class="denglu_span">确认密码:</span><input type="password" id="comfirmPwd" onblur="comfirmPwd()" placeholder="8~20个字符" class="size length">
			<span id="acc_pwd_two" style="color:#F00"></span>
		</div>
	</div>
	<div class="box-shadow-in"></div>
<!-- 华为账号服务条款 -->
	<div class="regAgrTitleNew node-title">华为帐号服务条款</div>
	<div id="agreement">
		<div class="node-intro">
			<div class="agrLineH">华为将为您创建唯一的华为帐号，来标识您和提供更优服务，且需搜集和处理以下信息：
			</div>

			<div class="agrLineH marginTop2">•&nbsp;&nbsp;设备信息，包括：IMEI、IMSI、SN、国家/地区、语言、型号和版本号；
			</div>

			<div class="agrLineH marginTop2">•&nbsp;&nbsp;个人信息，包括：手机号、邮件地址、密码、头像、昵称、生日、姓名和性别；
			</div>

			<div class="agrLineH marginTop8">上述数据将传输并保存至华为全球的服务器。您可通过销户删除所有个人数据。
			</div>

			<div class="agrLineH marginTop8">华为帐号用户可以通过手机号或邮件地址搜索到您，并可查看您的公开信息，包括：头像、昵称、城市等。您也可以在华为帐号的设置中关闭此功能。
			</div>

			<div class="agrLineH marginTop8">点击“注册”，即表示您同意上述内容及<a href="https://hwid1.vmall.com/CAS/portal/agreements/userAgreement/zh-cn_userAgreement.html?version=china" target="_blank" class="loginAndRegLink">华为帐号用户协议</a>并确认您已阅读<a href="https://hwid1.vmall.com/CAS/portal/agreements/userPrivacyPolicy/zh-cn_userPrivacyPolicy.html" target="_blank" class="loginAndRegLink">华为隐私政策</a>。
			</div>
		</div>
	</div>
	<div class="box-shadow-in"></div>
</div>
<!-- 按钮 -->
<div class="reg-btn" align="center">
	<input type="button" class="btn btn-reg sel" id="btnSubmit" onclick="regiest()" value="注册" tabindex="7">
</div>
<div class="box-shadow"></div>
<!-- 底部 -->
<div class="reg-content">
		<p class="footer">
			<a id="foot_EULA" href="#" class="rule" target="_blank">用户协议</a>
			<em class="foot_em">|</em>
			<a id="foot_privacy" href="#" class="rule" target="_blank">隐私政策</a>
			<em class="foot_em">|</em>
			<a style="padding:0 10px;" target="blank" href="#" class="rule" >常见问题</a>
		</p>
		<p class="footer">
		Copyright&nbsp;@&nbsp;2011-2017&nbsp;&nbsp;华为软件技术有限公司&nbsp;&nbsp;版权所有&nbsp;&nbsp;保留一切权利&nbsp;&nbsp;苏B2-20070200号&nbsp;|&nbsp;苏ICP备09062682号-9</p>	
</div>
</body>
</html>
