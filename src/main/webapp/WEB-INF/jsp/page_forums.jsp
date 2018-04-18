<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>论坛设置</title>

<link rel="stylesheet" type="text/css" href="css/header.css" />
<link rel="stylesheet" type="text/css" href="css/section.css" />
<link rel="stylesheet" type="text/css" href="css/show-list.css" />
<link rel="stylesheet" type="text/css" href="" />
<style type="text/css">
.header .container ul li:nth-of-type(3) a p {
	color: #2E96F8;
}

.header .container ul li:nth-of-type(3) a span {
	display: inline-block;
}
</style>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/rem.js"></script>
<!--<script type="text/javascript" src="js/link-header.js" ></script>-->
<script type="text/javascript" src="js/section.js"></script>
<script type="text/javascript" src="js/pageForums.js"></script>

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
	<div class="section">
		<div class="container">
			<ul>
				<li class="choosen">
					<p>
						帖子列表 <span></span>
					</p>
				</li>
				<li>
					<p>
						板块列表 <span></span>
					</p>
				</li>
				<li>
					<p>
						会员行情 <span></span>
					</p>
				</li>
			</ul>
			<ol>
				<li class="banner select">
					<p>
						论坛设置<i>></i><span>帖子列表</span>
					</p>
					<div></div>
				</li>
				<li class="video">
					<p>
						论坛设置<i>></i><span>板块列表</span>
					</p>
				</li>
				<li class="job">
					<p>
						论坛设置<i>></i><span>会员列表</span>
					</p>
				</li>
			</ol>
		</div>
	</div>
</body>
</html>