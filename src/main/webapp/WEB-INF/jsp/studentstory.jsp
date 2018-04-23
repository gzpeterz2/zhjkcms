<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>轮播图列表</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	var url;

	function openGoodsAddDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "添加商品信息");
		url = "goods!save";
	}

	function openGoodsModifyDialog() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length != 1) {
			$.messager.alert("系统提示", "请选择一条要编辑的数据！");
			return;
		}
		var row = selectedRows[0];
		$("#dlg1").dialog("open").dialog("setTitle", "编辑商品信息");
		$("#Gname2").val(row.Gname);
		$("#Gprovider2").val(row.Gprovider);
		url = "goods!save?Gid=" + row.Gid;
	}

	function deleteGoods() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length == 0) {
			$.messager.alert("系统提示", "请选择要删除的数据！");
			return;
		}
		var strIds = [];
		for (var i = 0; i < selectedRows.length; i++) {
			strIds.push(selectedRows[i].Gid);
		}
		var ids = strIds.join("','");
		$.messager.confirm("系统提示", "您确认要删掉这<font color=red>"
				+ selectedRows.length + "</font>条数据吗？", function(r) {
			if (r) {
				$.post("${pageContext.request.contextPath}/goods!delete", {
					delIds : ids
				}, function(result) {
					if (result.success) {
						$.messager.alert("系统提示", "您已成功删除<font color=red>"
								+ result.delNums + "</font>条数据！");
						$("#dg").datagrid("reload");
					} else {
						$.messager.alert('系统提示', '<font color=red>'
								+ selectedRows[result.errorIndex].goodsName
								+ '</font>' + result.errorMsg);
					}
				}, "json");
			}
		});
	}

	/* 商品展示 */

	function showimages() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length != 1) {
			$.messager.alert("系统提示", "请选择一条要展示图片的商品！");
			return;
		}
		var row = selectedRows[0];
		$("#dlg4").dialog('open').dialog('setTitle', '商品图片展示');
		document.getElementById('imgInit').src = row.src;
	}

	function saveGoods() {
		$("#fm").form("submit", {
			url : url,
			onSubmit : function() {
				return $(this).form("validate");
			},
			success : function(result) {
				var obj = jQuery.parseJSON(result);
				if (obj.errorMsg) {
					$.messager.alert("系统提示", obj.errorMsg);
					return error;
				} else {
					$.messager.alert("系统提示", "保存成功");
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}
			}
		});
	}

	function saveGoods1() {
		$("#fm1").form("submit", {
			url : url,
			onSubmit : function() {
				return $(this).form("validate");
			},
			success : function(result) {
				if (result.success) {
					$.messager.alert("系统提示", "保存失败");
					return error;
				} else {
					$.messager.alert("系统提示", "保存成功");
					resetValue();
					$("#dlg1").dialog("close");
					$("#dg").datagrid("reload");
				}
			}
		});
	}

	function closeGoodsDialog() {
		$("#dlg").dialog("close");
		resetValue();
	}

	function closeGoodsDialog1() {
		$("#dlg1").dialog("close");
		resetValue();
	}

	function uploadImages() {
		$("#uploadImg").form("submit", {
			success : function(result) {
				//var result=eval('('+result+')');//这样才能搞成JS对象
				var obj = jQuery.parseJSON(result);
				if (obj.errorMsg) {
					$.messager.alert("系统提示", obj.errorMsg);
					return error;
				} else {
					$.messager.alert("系统提示", "上传成功");
					$("#dlg4").dialog("close");
					$("#dg").datagrid("reload");
				}
			}
		});
	}
</script>

</head>
<body>
	<!-- 管理员操作栏-->
	<div id="tb">
		<div>
			<a href="javascript:openGoodsAddDialog()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">添加</a> <a
				href="javascript:openGoodsModifyDialog()" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">修改</a> <a
				href="javascript:deleteGoods()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除</a> <a
				href="javascript:showimages()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">图片展示</a>
		</div>
	</div>
	<!-- 属性栏  -->
	<table id="dg" title="轮播图管理" class="easyui-datagrid" fitColumns="true"
		height="800px" pagination="true" rownumbers="true" fit="true"
		url="json/homeBanner.action" toolbar="#tb">
		<!--  fitColumns="true" th自适应宽度； pagination：翻页；rownumbers：添加行号；url：必须返回json形式 -->
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="name" width="15">轮播标题</th>
				<th field="src" width="25">轮播图</th>
				<th field="url" width="33">轮播图链接</th>
			</tr>
		</thead>
	</table>
	<!-- 添加窗口 -->
	<div id="dlg" class="easyui-dialog"
		style="width: 580px; height: 350px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="5px;">
				<tr>
					<td height="15px"></td>
				</tr>
				<tr>
					<td>轮播标题：</td>
					<td><input type="text" name="name" id="name"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>轮播图：</td>
					<td><input type="text" name="src" id="src"
						class="easyui-validatebox" required="true" /></td>
					<td>轮播图链接：</td>
					<td><input type="text" name="url" id="url"
						class="easyui-validatebox" required="true" /></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 修改窗口 -->
	<div id="dlg1" class="easyui-dialog"
		style="width: 580px; height: 350px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons1">
		<form id="fm1" method="post">
			<table cellspacing="5px;">
				<tr>
					<td height="15px"></td>
				</tr>
				<tr>
					<td>商品名称：</td>
					<td><input type="text" name="goods.Gname" id="Gname2"
						class="easyui-validatebox" required="true" /></td>
					<td>商品规格：</td>
					<td><input type="text" name="goods.gspecifications"
						id="Gspecifications2" class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>商品产地：</td>
					<td><input type="text" name="goods.glocation" id="Glocation2"
						class="easyui-validatebox" required="true" /></td>
					<td>商品材质：</td>
					<td><input type="text" name="goods.gmaterial" id="Gmaterial2"
						class="easyui-validatebox" required="true" /></td>
				</tr>
			</table>
		</form>
	</div>

	<div id="dlg-buttons">
		<a href="javascript:saveGoods()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeGoodsDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>

	<div id="dlg-buttons1">
		<a href="javascript:saveGoods1()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeGoodsDialog1()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>


	<!-- 图片展示	 -->
	<div id="dlg4" class="easyui-dialog"
		style="width: 1000px; height: 450px; padding: 15px 10px" closed="true"
		buttons="#dlg-buttons4">
<!-- 		<form id="uploadImg" method="post" action="goods!uploadPhoto" -->
<!-- 			enctype="multipart/form-data"> -->
<!-- 			<span style="white-space: pre"> </span>上传图片1：<input type="file" -->
<!-- 				name="upload"><br /> <br /> -->
<!-- 		</form> -->
		<div>
			<img src="?" id="imgInit" alt="未上传图片" width="650" height="420" />
		</div>
	</div>


</body>
</html>