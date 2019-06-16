<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>登录</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css"/>
</head>
<body>
<div class="htmleaf-container">
	<div class="wrapper">
		<div class="container">
			<h1>${projectName}| 入口</h1>
			
			<form action="#" method="post" class="form" onsubmit="return false">
				<input name="username" type="text" placeholder="用户名">
				<input type="password" placeholder="密码">
				<c:if test="${isNotWhiteIp && googleAuthEnable}">
				<input name="googleKey" type="text" placeholder="请输入google动态验证码">
				</c:if>
				<button type="submit" id="login-button" onclick="check()">登录</button>
			</form>
		</div>
		
		<ul class="bg-bubbles">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
</div>

<script src="${pageContext.request.contextPath}/js/md5.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/plugins/jquery/jquery.min.js" type="text/javascript"></script>
<script>
function check(obj){
	toggleView();
	var children = $("form").children();
	
	if(!/^\w{4,16}$/.test(children[0].value)){
		alert("请输入4-16位用户名");
		toggleView();
		return;
	}
	if(!/^[\s\S]{6,32}$/.test(children[1].value)){
		alert("请输入6-32位密码");
		toggleView();
		return;
	}
	<c:if test="${isNotWhiteIp && googleAuthEnable}">
	if(!/^\d{6}$/.test(children[2].value)){
		alert("请输入6位数字验证码");
		toggleView();
		return;
	}
	</c:if>

	try{
		$.post("${pageContext.request.contextPath}/proxybill/login",$("form").serialize()+"&password="+hex_hmac_md5(children[1].value,children[0].value),function(res){
				if(res.code == 1){
					window.location.reload();
				}else{
					toggleView();
					alert(res.msg);
				}
			}
		).fail(function(){
			toggleView();
			alert("通讯异常,请重试");
		});
	}catch(err){
		alert("通讯异常,请重试");
		throw err;
	}
	
	return false;
}

function toggleView(){
	$('form').fadeToggle("fast");
	$('.wrapper').toggleClass('form-success');
}

$(function(){
	if("${logMSG}"){
		alert("${logMSG}");
	}
});
</script>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';color:#000000">
</div>
</body>
</html>