<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
		<link rel="stylesheet" href="css/index.css" />
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="js/index.js"></script>
</head>
<body>
	<div class="bg-container">
			<div class="bg-wrap">
				<div class="bg-icon">
					<div class="container">
						<img src="img/index/logo.png"/>
						<div id="">
							<p>用户登录</p>
							<form action="user/login.action" method="post">
								<input type="text" class="account" name="username" placeholder="请输入您的账号"/>
								<input type="password" class="password" name="password" placeholder="请输入密码"/>
								<i style="color:red">${msg }</i>
								<div><span>√</span>记住密码</div>
								<a><input type="submit" value="登录"></a>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<% session.removeAttribute("msg"); %>
</body>
</html>