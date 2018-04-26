<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>知海匠库后台管理系统</title>

<script type="text/javascript" src="./jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript"
	src="./jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="./jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css"
	href="./jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="./jquery-easyui-1.3.3/themes/icon.css">
</head>
<script type="text/javascript">
	/* function openAdministratorModifyDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "编辑个人信息");
	} */

	function saveAdministrator() {
		$("#fm").form("submit", {
			url : url,
			onSubmit : function() {
				return $(this).form("validate");
			},
			success : function(result) {
				if (result.errorMsg) {
					$.messager.alert("系统提示", result.errorMsg);
					return error;
				} else {
					$("#dlg").dialog("close");
					$.messager.alert("系统提示", "保存成功");
					resetValue();
				}
			}
		});
	}

	function closeAdministratorDialog() {
		$("#dlg").dialog("close");
		resetValue();
	}

	$(function() {
		var treeData1 = [ {
			text : "轮播图列表",
			attributes : {
				url : "banner.action"
			}
		} ];
		$("#tree1").tree({
			data : treeData1,
			lines : true,
			onClick : function(node) {
				if (node.attributes) {
					openTab(node.text, node.attributes.url);
				}
			}
		});

		var treeData2 = [ {
			text : "教学视频列表",
			attributes : {
				url : "video.action"
			}
		} ];
		$("#tree2").tree({
			data : treeData2,
			lines : true,
			onClick : function(node) {
				if (node.attributes) {
					openTab(node.text, node.attributes.url);
				}
			}
		});

		var treeData3 = [ {
			text : "就业行情",
			children : [ {
				text : "学员信息管理",
				attributes : {
					url : "employment.action"
				}
			}, {
				text : "聊天截图",
				attributes : {
					url : "chatPrintscreen.action"
				}
			} ]
		} ];
		$("#tree3").tree({
			data : treeData3,
			lines : true,
			onClick : function(node) {
				if (node.attributes) {
					openTab(node.text, node.attributes.url);
				}
			}
		});

		var treeData4 = [ {
			text : "师资力量",
			attributes : {
				url : "banner.jsp"
			}
		} ];
		$("#tree4").tree({
			data : treeData4,
			lines : true,
			onClick : function(node) {
				if (node.attributes) {
					openTab(node.text, node.attributes.url);
				}
			}
		});

		var treeData5 = [ {
			text : "资讯动态列表",
			attributes : {
				url : "dynamic.action"
			}
		} ];
		$("#tree5").tree({
			data : treeData5,
			lines : true,
			onClick : function(node) {
				if (node.attributes) {
					openTab(node.text, node.attributes.url);
				}
			}
		});
		var treeData6 = [ {
			text : "学员故事",
			attributes : {
				url : "studentstory.action"
			}
		} ];
		$("#tree6").tree({
			data : treeData6,
			lines : true,
			onClick : function(node) {
				if (node.attributes) {
					openTab(node.text, node.attributes.url);
				}
			}
		});
		var treeData7 = [ {
			text : "关于我们",
			attributes : {
				url : "banner.jsp"
			},
			children : [ {
				text : "学院介绍",
				attributes : {
					url : "banner.jsp"
				}
			}, {
				text : "教学环境",
				attributes : {
					url : "banner.jsp"
				}
			} ]
		} ];
		$("#tree7").tree({
			data : treeData7,
			lines : true,
			onClick : function(node) {
				if (node.attributes) {
					openTab(node.text, node.attributes.url);
				}
			}
		});
		var treeData8 = [ {
			text : "报名序列",
			attributes : {
				url : "banner.jsp"
			}
		} ];
		$("#tree8").tree({
			data : treeData8,
			lines : true,
			onClick : function(node) {
				if (node.attributes) {
					openTab(node.text, node.attributes.url);
				}
			}
		});
		var treeData9 = [ {
			text : "友情链接列表",
			attributes : {
				url : "banner.jsp"
			}
		} ];
		$("#tree9").tree({
			data : treeData9,
			lines : true,
			onClick : function(node) {
				if (node.attributes) {
					openTab(node.text, node.attributes.url);
				}
			}
		});

		var treeData10 = [ {
			text : "论坛设置",
			attributes : {
				url : "banner.jsp"
			}
		} ];
		$("#tree10").tree({
			data : treeData10,
			lines : true,
			onClick : function(node) {
				if (node.attributes) {
					openTab(node.text, node.attributes.url);
				}
			}
		});

		function openTab(text, url) {
			if ($("#tabs").tabs('exists', text)) {
				$("#tabs").tabs('select', text);
			} else {
				var content = "<iframe frameborder='0' scrolling='auto'  style='width:100%;height:100%' src="
						+ url + "></iframe>";
				$("#tabs").tabs('add', {
					title : text,
					closable : true,
					content : content
				});
			}
		}
	});
</script>
<body class="easyui-layout">

	<!-- 	北区：头部 -->
	<div region="north" class="top" style="width: 100%; height: 125px;">
		<img src="img/index/logo2.png" />
		<div style="padding-top: 1px;" class="zhu">
			<br> <a
				href="${pageContext.request.contextPath}/user/exit.action">注销</a>
			<br>欢迎您<a href="javascript:openAdministratorModifyDialog()"
				class="easyui-linkbutton" iconCls="icon-edit" plain="true">${existUser.name }</a>
		</div>
	</div>

	<!-- 西区：左边导航菜单 -->
	<div region="west" class="west" style="width: 168px;" title="导航菜单"
		split="true">
		<div class="left">
			<ul id="tree1"></ul>
			<ul id="tree2"></ul>
			<ul id="tree3"></ul>
			<ul id="tree4"></ul>
			<ul id="tree5"></ul>
			<ul id="tree6"></ul>
			<ul id="tree7"></ul>
			<ul id="tree8"></ul>
			<ul id="tree9"></ul>
			<ul id="tree10"></ul>
		</div>
	</div>

	<!-- 中间：窗口区域 -->
	<div region="center">
		<div class="easyui-tabs" fit="true" border="false" id="tabs">
			<div title="首页" class="shouye"></div>
		</div>
	</div>

<!-- 	<div region="east" class="east" style="width: 20px;"></div> -->




	<!-- 个人信息 -->
	<div id="dlg" class="easyui-dialog"
		style="width: 300px; height: 400px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<form id="fm" action="Login!modify?Aid=${currentUser.getAid()}"
			method="post" value="编辑个人信息">
			<table cellspacing="5px;">
				<tr>
					<td height="15px"></td>
				</tr>
				<tr>
					<td>姓名：</td>
					<td><input type="text" name="ad.aname" id="Aname"
						value="${currentUser.getAname()}" class="easyui-validatebox"
						required="true" /></td>
				</tr>
				<tr>
					<td>出生日期：</td>
					<td><input class="easyui-datebox" name="ad.abir" id="Abir"
						value="${currentUser.getAbir()}" editable="false" required="true" />
				</tr>
				<tr>
					<td>家庭住址：</td>
					<td><input type="text" id="Aadd" name="ad.aadd"
						value="${currentUser.getAadd()}" class="easyui-validatebox"
						required="true" /></td>
				</tr>
				<tr>
					<td>邮箱地址：</td>
					<td><input type="text" name="ad.amail" id="Amail"
						value="${currentUser.getAmail()}" class="easyui-validatebox"
						required="true" /></td>
				</tr>
				<tr>
					<td>手机号码：</td>
					<td><input type="text" name="ad.atel" id="Atel"
						value="${currentUser.getAtel()}" class="easyui-validatebox"
						required="true" /></td>
				</tr>
			</table>
		</form>
	</div>

	<div id="dlg-buttons">
		<a href="javascript:saveAdministrator()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a
			href="javascript:closeAdministratorDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>

</body>
</html>

