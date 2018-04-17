<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理首页</title>
	<link rel="stylesheet" type="text/css" href="css/header.css"/>
	<style type="text/css">
		.header .container ul li:nth-of-type(1) a p {
           	color: #2E96F8;
           }
         	.header .container ul li:nth-of-type(1) a span {
           	display: inline-block;
           }
	</style>
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/rem.js" ></script>
	<!--<script type="text/javascript" src="js/link-header.js" ></script>-->
</head>
<body>
	<div class="header">
		<div class="container">
			<img src="img/index/logo2.png" />
			<ul>
				<li><a href="pagefirst.action">
						<p>首页</p> <span></span>
				</a></li>
				<li><a href="pageweb.action">
						<p>官网设置</p> <span></span>
				</a></li>
				<li><a href="pageforums.action">
						<p>论坛设置</p> <span></span>
				</a></li>
			</ul>
			<ol>
				<li>欢迎你 : <span class="username">${existUser.name }</span></li>
				<li class="logoff"><a href="user/exit.action">退出</a></li>
			</ol>
		</div>
	</div>
</body>
</html>