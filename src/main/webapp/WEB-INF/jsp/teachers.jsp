<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>轮播图列表</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/black/easyui.css">
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

	//打开添加学员就业信息框
	function openTeacherAddDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "添加老师信息");
		url = "teacher/save.action";
	}
	//打开修改学员就业信息框
	function openTeacherModifyDialog() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length != 1) {
			$.messager.alert("系统提示", "请选择一条要编辑的数据！");
			return;
		}
		var row = selectedRows[0];
		$("#dlg1").dialog("open").dialog("setTitle", "编辑老师信息");
		$("#t_id2").val(row.t_id);
		$("#t_name2").val(row.t_name);
		$("#t_course2").val(row.t_course);
		$("#t_introduction2").val(row.t_introduction);
		$("#t_photos2").val(row.t_photos);
		$("#photos2").val("");
		url = "teacher/update.action";
	}

	function deleteTeacher() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length == 0) {
			$.messager.alert("系统提示", "请选择要删除的数据！");
			return;
		}
		var strIds = [];
		for (var i = 0; i < selectedRows.length; i++) {
			strIds.push(selectedRows[i].id);
		}
		var ids = strIds.join(",");
		$.messager.confirm("系统提示", "您确认要删掉这<font color=red>"
				+ selectedRows.length + "</font>条数据吗？", function(r) {
			if (r) {
				$.post("${pageContext.request.contextPath}/teacher/delete.action", {
					delIds : ids
				}, function(result) {
					if (result.success) {
						$.messager.alert("系统提示", "您已成功删除<font color=red>"
								+ result.delNums + "</font>条数据！");
						$("#dg").datagrid("reload");
					} else {
						$.messager.alert('系统提示', '<font color=red>'
								+ selectedRows[result.errorIndex].t_name
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
			$.messager.alert("系统提示", "请选择一条要展示照片的记录！");
			return;
		}
		var row = selectedRows[0];
		$("#dlg4").dialog('open').dialog('setTitle', '老师照片展示');
		document.getElementById('imgInit').src = row.t_photos;
	}

	function saveTeacher() {
		$("#fm").form("submit", {
			url : url,
			onSubmit : function() {
				return $(this).form("validate");
			},
			success : function(result) {
				var obj = jQuery.parseJSON(result);
				if (obj.errorMsg) {
					$.messager.alert("系统提示", obj.errorMsg,"error");
					return error;
				} else {
					$.messager.alert("系统提示", "保存成功","info");
					/* resetValue(); */
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}
			}
		});
	}

	function saveTeacher1() {
		$("#fm1").form("submit", {
			url : url,
			onSubmit : function() {
				return $(this).form("validate");
			},
			success : function(result) {
				if (result.success) {
					$.messager.alert("系统提示", "保存失败","error");
					return error;
				} else {
					$.messager.alert("系统提示", "保存成功");
					/* resetValue(); */
					$("#dlg1").dialog("close");
					$("#dg").datagrid("reload");
				}
			}
		});
	}

	function closeTeacherDialog() {
		$("#dlg").dialog("close");
		resetValue();
	}

	function closeTeacherDialog1() {
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
			<a href="javascript:openTeacherAddDialog()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openTeacherModifyDialog()" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteTeacher()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除</a>
			<a href="javascript:showimages()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">图片展示</a>
		</div>
	</div>
	<!-- 属性栏  -->
	<table id="dg" title="师资力量管理" class="easyui-datagrid" fitColumns="true"
		height="800px" pagination="true" rownumbers="true" fit="true"
		url="teacher/selectByPage.action" toolbar="#tb" striped=true>
		<!--  fitColumns="true" th自适应宽度； pagination：翻页；rownumbers：添加行号；url：必须返回json形式 -->
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="t_id" width="10" hidden=true>老师id</th>
				<th field="t_name" width="15">老师姓名</th>
				<th field="t_course" width="15">所教课程</th>
				<th field="t_introduction" width="20">老师介绍</th>
				<th field="t_photos" width="33">老师照片</th>
			</tr>
		</thead>
	</table>

	<!-- 添加窗口 -->
	<div id="dlg" class="easyui-dialog"
		style="width: 500px; height: 500px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons" modal=true>
		<form id="fm" method="post" enctype="multipart/form-data">
			<table cellspacing="5px;">
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td>老师姓名：</td>
					<td><input type="text" name="t_name" id="t_name"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>所教课程：</td>
					<td><input type="text" name="t_course" id="t_course"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>老师介绍：</td>
					<td><input type="text" name="t_introduction" id="t_introduction"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>老师照片：</td>
					<td><input type="text" name="t_photos" id="t_photos"
						class="easyui-validatebox" required="true" /></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 修改窗口 -->
	<div id="dlg1" class="easyui-dialog"
		style="width: 580px; height: 500px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons1"  modal=true>
		<form id="fm1" method="post" enctype="multipart/form-data">
			<table cellspacing="5px;">
				<tr>
					<td height="15px"></td>
					<td><input type="hidden" name="t_id" id="t_id2"/></td>
				</tr>
				<tr>
					<td>老师姓名：</td>
					<td><input type="text" name="t_name" id="t_name2"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>所教课程：</td>
					<td><input type="text" name="t_course" id="t_course2"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>老师介绍：</td>
					<td><input type="text" name="t_introduction" id="t_introduction2"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>老师照片：</td>
					<td><input type="file" name="photos" id="photos2"/>
					</td>
				</tr>
				<tr>
					<td><input type="text" name="t_photos" id="t_photos2"/></td>
				</tr>
			</table>
		</form>
	</div>

	<div id="dlg-buttons">
		<a href="javascript:saveTeacher()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeTeacherDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>

	<div id="dlg-buttons1">
		<a href="javascript:saveTeacher1()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeTeacherDialog1()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>


	<!-- 图片展示	 -->
	<div id="dlg4" class="easyui-dialog"
		style="width: 600px; height: 500px; padding: 15px 10px" closed="true"
		buttons="#dlg-buttons4" resizable=true>
<!-- 		<form id="uploadImg" method="post" action="Teacher!uploadPhoto" -->
<!-- 			enctype="multipart/form-data"> -->
<!-- 			<span style="white-space: pre"> </span>上传图片1：<input type="file" -->
<!-- 				name="upload"><br /> <br /> -->
<!-- 		</form> -->
		<div>
			<img src="?" id="imgInit" alt="未上传图片" width="100%" height="100%" />
		</div>
	</div>
	
	<!-- 关闭查看图片弹框之后清除复选框 -->
	<script type="text/javascript">
		$("#dlg4").dialog({
			onClose:function(){
				$("#dg").datagrid("clearSelections");
				resetValue();
			}
		})
	</script>
</body>
</html>