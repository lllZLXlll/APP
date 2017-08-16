<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../include/base.jsp"%> 
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>系统维护中</title>
	<style type="text/css">
	*{margin:0;border:0;padding:0;}
	body{font:14px/24px 'Microsoft Yahei';color:#777777;}
	.top{width:100%;height:504px;background:url(${basePath}images/system.png) top center no-repeat;}
	.center{width:1000px;margin: 25px auto 100px;}
	.title{height:60px;line-height:60px;font-size:20px;text-align: center;border-bottom: 1px solid #e4e4e4;}
	.greet{margin:10px 0;}
	</style>
</head>
<body>
	<div class="main">
		<div class="top"></div>
		<div class="center">
			<p class="title">系统维护公告</p>
			<p class="greet">亲爱的普金资本用户：</p>
			<p>${msg }</p>
		</div>
	</div>
</body>
</html>