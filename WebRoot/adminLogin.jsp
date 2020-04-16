<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>管理员登录</title>
    <title>My JSP 'MyJsp.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="js/verificationNumbers.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
html{overflow-y:scroll;vertical-align:baseline;}
body{font-family:Microsoft YaHei,Segoe UI,Tahoma,Arial,Verdana,sans-serif;font-size:12px;color:#fff;height:100%;line-height:1;background:#999}
*{margin:0;padding:0}
ul,li{list-style:none}
h1{font-size:30px;font-weight:700;text-shadow:0 1px 4px rgba(0,0,0,.2)}
.login-box{width:410px;margin:120px auto 0 auto;text-align:center;padding:30px;background:url(images/mask.png);border-radius:10px;}
.login-box .name,.login-box .password,.login-box .code,.login-box .remember{font-size:16px;text-shadow:0 1px 2px rgba(0,0,0,.1)}
.login-box .remember input{box-shadow:none;width:15px;height:15px;margin-top:25px}
.login-box .remember{padding-left:40px}
.login-box .remember label{display:inline-block;height:42px;width:70px;line-height:34px;text-align:left}
.login-box label{display:inline-block;width:100px;text-align:left;vertical-align:middle;}
.login-box #code{width:120px}
.login-box .codeImg{float:right;}
.login-box img{width:148px;height:42px;border:none}
input[type=text],input[type=password]{width:270px;height:42px;margin-top:25px;padding:0px 15px;border:1px solid rgba(255,255,255,.15);border-radius:6px;color:#fff;letter-spacing:2px;font-size:16px;background:transparent;}
button{filter:alphalopacity=80;opacity:0.4;cursor:pointer;width:100%;height:44px;padding:0;background:#ef4300;border:1px solid #ff730e;border-radius:6px;font-weight:700;color:#fff;font-size:24px;letter-spacing:15px;text-shadow:0 1px 2px rgba(0,0,0,.1)}
input:focus{outline:none;box-shadow:0 2px 3px 0 rgba(0,0,0,.1) inset,0 2px 7px 0 rgba(0,0,0,.2)}
button:hover{box-shadow:0 15px 30px 0 rgba(255,255,255,.15) inset,0 2px 7px 0 rgba(0,0,0,.2)}
.screenbg{position:fixed;bottom:0;left:0;z-index:-999;overflow:hidden;width:100%;height:100%;min-height:100%;}
.screenbg ul li{display:block;list-style:none;position:fixed;overflow:hidden;top:0;left:0;width:100%;height:100%;z-index:-1000;float:right;}
.screenbg ul a{left:0;top:0;width:100%;height:100%;display:inline-block;margin:0;padding:0;cursor:default;}
.screenbg a img{vertical-align:middle;display:inline;border:none;display:block;list-style:none;position:fixed;overflow:hidden;top:0;left:0;width:100%;height:100%;z-index:-1000;float:right;}
.bottom{margin:8px auto 0 auto;width:100%;position:fixed;text-align:center;bottom:0;left:0;overflow:hidden;padding-bottom:8px;color:#ccc;word-spacing:3px;zoom:1;}
.bottom a{color:#FFF;text-decoration:none;}
.bottom a:hover{text-decoration:underline;}
.J_codeimg{width:148px;height:42px;border:none;padding-left: 5px;}
</style>

<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
function hh(element){
	return document.getElementById(element);
	}
	
	
function checkLoginId(){
	var loginId=hh("loginId").value;

	
	if(loginId.length==0){
		
		return false;
	}else{
		return true;
	}
}
	function checkPwd(){
		var pwd=hh("pwd").value;
		var pwd2=hh("pwd2");
	
		if(pwd.length==0){
			
			return false;
		}else{
			return true;
		}

}	
	
	function checkCode(){
		var code=hh("code").value;
		
		var code1=hh("code1").value;
		
		
		if (code.length!=0&&code==code1) {
			
			return true;
		}else{
			hh("sp").innerHTML=code1;
			return false;
		}
		
		
	}		
	

function createCode(){       
   var code = "";      
    var codeLength = 4;
    var selectChar = new Array(1,2,3,4,5,6,7,8,9,'a','b','c','d','e','f','g','h','j','k','l','m','n','p','q','r','s','t','u','v','w','x','y','z');      
    for(var i=0;i<codeLength;i++) {
       var charIndex = Math.floor(Math.random()*32);      
      code +=selectChar[charIndex];
    }      		
    hh("yanzhen").innerHTML=code;
    
    hh("code1").value=code;
    
}


function to_submit(){
	var res=checkCode();
	
	
	if (checkLoginId()&&checkPwd()&&res) {
		document.forms[0].submit();
	}
	
	}







$(function(){
	$(".screenbg ul li").each(function(){
		$(this).css("opacity","0");
	});
	$(".screenbg ul li:first").css("opacity","1");
	var index = 0;
	
	var li = $(".screenbg ul li");	
	var number = li.size();
	function change(index){
		li.css("visibility","visible");
		li.eq(index).siblings().animate({opacity:0},3000);
		li.eq(index).animate({opacity:1},3000);
	}
	function show(){
		index = index + 1;
		if(index<=number-1){
			change(index);
		}else{
			index = 0;
			change(index);
		}
	}
	t = setInterval(show,5000);
	//根据窗口宽度生成图片宽度
	var width = $(window).width();
	$(".screenbg ul img").css("width",width+"px");
});
</script>

  </head>
  
  <body>

<div class="login-box">
	<h1>花店后台登录</h1>
	<form method="post" action="AdminLogin">
		<div class="name">
			<label>管理员账号：</label>
			<input type="text" name="loginId" id="loginId" tabindex="1" onblur="checkLoginId()"  />
			
		</div>
		<div class="password">
			<label>密  码：</label>
			<input type="password" name="pwd" maxlength="16" id="pwd" tabindex="2" onblur="checkPwd()"/>
			
			
		</div>
		<div class="code">
			<label>验证码：</label>
			
			
			<input type="text" name="code" maxlength="4" id="code" tabindex="3" onblur="checkCode()"/>
			<div class="codeImg">
			
			
			
			
			<div class="J_codeimg" style="clear: both;" >
			<input type="hidden" id="code1" name="code1"/>		
			<div id="yanzhen"  style="float: left;margin-top: 26px;font-size: 23px;width: 63px;background-color:#80FF00;padding: 10px;height: 20px; "></div>
			<input type="button" onclick="createCode()" value="验证" style="width: 40px;float: right; margin-top: 32px;margin-right: 5px;padding: 5px;" >
			
			</div>
			<!-- <canvas class="J_codeimg" id="myCanvas" onclick="createCode()" name="txtVerification"></canvas> -->	
			</div>
		</div>
		<div class="remember">
			<input type="checkbox" id="remember" tabindex="4">
			<label>记住密码</label>
		</div>
		<div class="login">
			<button type="button" tabindex="5" onclick="to_submit()">登录</button>
		</div>
	</form>
</div>

<div class="bottom">©2014 Leting <a href="javascript:;" target="_blank">关于</a> <span>欢迎光临:**花店</span><img width="13" height="16" src="images/copy_rignt_24.png" /></div>

<div class="screenbg">
	<ul>
		<li><a href="javascript:;"><img src="images/0.jpg"></a></li>
		<li><a href="javascript:;"><img src="images/1.jpg"></a></li>
		<li><a href="javascript:;"><img src="images/2.jpg"></a></li>
	</ul>
</div>

</body>
</html>
