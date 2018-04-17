<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath }/instDynamic/addDynamic.action" method="post" >
	<h2>资讯标题：</h2>
	<input name="title" type="text" placeholder="请输入标题"/>
	<h2>资讯内容：</h2>
	<input name="content" type="text" placeholder="请输入内容"/>	
	<input type="submit" value="添加">
</form>
</body>
</html>