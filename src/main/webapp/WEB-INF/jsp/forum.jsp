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
	function openStudentsAddDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "添加学员信息");
		url = "succstudent/save.action";
	}
	//打开修改学员就业信息框
	function openStudentsModifyDialog() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length != 1) {
			$.messager.alert("系统提示", "请选择一条要编辑的数据！");
			return;
		}
		var row = selectedRows[0];
		$("#dlg1").dialog("open").dialog("setTitle", "编辑学员信息");
		$("#id2").val(row.id);
		$("#name2").val(row.name);
		$("#degree2").val(row.degree);
		$("#enterprize2").val(row.enterprize);
		$("#salary2").val(row.salary);
		$("#career2").val(row.career);
		$("#hiredate2").val(row.hiredate);
		$("#graduateschool2").val(row.graduateschool);
		$("#sendword2").val(row.sendword);
		$("#photos_src2").val(row.photos_src);
		$("#photos2").val("");
		url = "succstudent/update.action";
	}

	function deleteStudent() {
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
				$.post("${pageContext.request.contextPath}/forum/delete.action", {
					delIds : ids
				}, function(result) {
					if (result.success) {
						$.messager.alert("系统提示", "您已成功删除<font color=red>"
								+ result.delNums + "</font>条数据！");
						$("#dg").datagrid("reload");
					} else {
						$.messager.alert('系统提示', '<font color=red>'
								+ selectedRows[result.errorIndex].title
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
		$("#dlg4").dialog('open').dialog('setTitle', '学员照片展示');
		document.getElementById('imgInit').src = row.photos_src;
	}

	function saveStudent() {
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

	function saveStudent1() {
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

	function closeStudentsDialog() {
		$("#dlg").dialog("close");
		resetValue();
	}

	function closeStudentsDialog1() {
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
			<!-- <a href="javascript:openStudentsAddDialog()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">添加
			</a>
			<a href="javascript:openStudentsModifyDialog()" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">修改
			</a> -->
			<a href="javascript:deleteStudent()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除
			</a>
			<!-- <a href="javascript:showimages()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">图片展示</a> -->
		</div>
	</div>
	<!-- 属性栏  -->
	<table id="dg" title="论坛管理" class="easyui-datagrid" fitColumns="true"
		height="800px" pagination="true" rownumbers="true" fit="true"
		url="forum/selectByPage.action" toolbar="#tb"  striped=true>
		<!--  fitColumns="true" th自适应宽度； pagination：翻页；rownumbers：添加行号；url：必须返回json形式 -->
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="id" width="10" hidden=true>文章id</th>
				<th field="title" width="15">标题</th>
				<th field="author" width="15">作者</th>
				<th field="post_time" width="30">发表时间</th>
				<th field="views" width="20">查看次数</th>
				<th field="comments" width="20">评论次数</th>
				<th field="thumbups" width="20">点赞次数</th>
				<th field="editor" width="25">编辑者</th>
				<th field="edit_time" width="30">编辑时间</th>
				<th field="content" width="49">正文内容</th>
				<th field="type" width="50">分类</th>
				<th field="cover" width="50">封面</th>
				<th field="top" width="20">是否置顶</th>
				<th field="original" width="20">是否原创</th>
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
					<td>学员姓名：</td>
					<td><input type="text" name="name" id="name"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>学员学历：</td>
					<td><input type="text" name="degree" id="degree"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>毕业院校：</td>
					<td><input type="text" name="graduateschool" id="graduateschool"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>入职公司：</td>
					<td><input type="text" name="enterprize" id="enterprize"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>薪资：</td>
					<td><input type="text" name="salary" id="salary"
						class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>专业：</td>
					<td><input type="text" name="career" id="career"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>就职信息：</td>
					<td>
					<input type="text" name="hiredate" id="hiredate" class="easyui-datebox" required="true" />
					</td>
				</tr>
				<tr>
					<td>学员寄语：</td>
					<td><input type="text" name="sendword" id=""sendword""
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>学员照片：</td>
					<td><input type="file" name="photos" id="photos"
						class="easyui-validatebox" required="true" />
						<input type="hidden" name="photos_src" id="photos_src"/>
					</td>
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
					<td><input type="hidden" name="id" id="id2"/></td>
				</tr>
				<tr>
					<td>标题：</td>
					<td><input type="text" name="name" id="name2"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>封面：</td>
					<td><input type="text" name="degree" id="degree2"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>分类：</td>
					<td><input type="text" name="graduateschool" id="graduateschool2"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>是否置顶：</td>
					<td><input type="text" name="enterprize" id="enterprize2"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>是否原创：</td>
					<td><input type="text" name="salary" id="salary2"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>职业：</td>
					<td><input type="text" name="career" id="career2"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>就职信息：</td>
					<td><input type="text" name="hiredate" id="hiredate2"
						class="easyui-datebox" required="true" /></td>
				</tr>
				<tr>
					<td>学员寄语：</td>
					<td><input type="text" name="sendword" id="sendword2"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>学员照片：</td>
					<td><input type="file" name="photos" id="photos2"/>
					</td>
				</tr>
				<tr>
					<td><input type="hidden" name="photos_src" id="photos_src2"/></td>
				</tr>
			</table>
		</form>
	</div>

	<div id="dlg-buttons">
		<a href="javascript:saveStudent()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeStudentsDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>

	<div id="dlg-buttons1">
		<a href="javascript:saveStudent1()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeStudentsDialog1()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>


	<!-- 图片展示	 -->
	<div id="dlg4" class="easyui-dialog"
		style="width: 600px; height: 500px; padding: 15px 10px" closed="true"
		buttons="#dlg-buttons4" resizable=true>
<!-- 		<form id="uploadImg" method="post" action="Students!uploadPhoto" -->
<!-- 			enctype="multipart/form-data"> -->
<!-- 			<span style="white-space: pre"> </span>上传图片1：<input type="file" -->
<!-- 				name="upload"><br /> <br /> -->
<!-- 		</form> -->
		<div>
			<img src="?" id="imgInit" alt="未上传图片" width="100%" height="100%" />
		</div>
	</div>
	
	<!-- 关闭查看图片弹框之后清除复选框 -->
<!-- 	<script type="text/javascript">
		$("#dlg4").dialog({
			onClose:function(){
				$("#dg").datagrid("clearSelections");
				resetValue();
			}
		})
	</script> -->
</body>
</html>