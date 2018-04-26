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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/wangEditor.min.js"></script>
<script type="text/javascript">

	var url;

	function openVideosAddDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "添加视频");
		$("#v_title").val("");
		$("#v_type").val("");
		$("#v_teacher").val("");
		$("#v_link").val("");
		editor.txt.html("");
		editor2.txt.html("");
		$("#file1").val("");
		url = "${pageContext.request.contextPath }/video/addVideo.action";
	}

	function openVideosModifyDialog() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length != 1) {
			$.messager.alert("系统提示", "请选择一条要编辑的数据！");
			return;
		}
		var row = selectedRows[0];
		$.post("${pageContext.request.contextPath}/video/findById.action", {
			id : row.v_id
		}, function(result) {
			if(result!=null&&result.v_id>0){
				$("#dlg1").dialog("open").dialog("setTitle", "修改视频信息");
				$("#v_id1").val(result.v_id);
				$("#v_title1").val(result.v_title);
				$("#v_type1").val(result.v_type);
				$("#v_teacher1").val(result.v_teacher);
				$("#v_link1").val(result.v_link);
				$("input[name='v_isrecommend'][value='"+result.v_isrecommend+"']").prop("checked","checked");
				editor3.txt.html(result.v_desc);
				editor4.txt.html(result.v_describe);
			}
		}, "json"); 
		url = "${pageContext.request.contextPath }/video/update.action";
	}

	function deleteVideos() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length == 0) {
			$.messager.alert("系统提示", "请选择要删除的数据！");
			return;
		}
		var strIds = [];
		for (var i = 0; i < selectedRows.length; i++) {
			strIds.push(selectedRows[i].v_id);
		}
		var ids = strIds.join(",");
		$.messager.confirm("系统提示", "您确认要删掉这<font color=red>"
				+ selectedRows.length + "</font>条数据吗？", function(r) {
			if (r) {
				$.post("${pageContext.request.contextPath}/video/delete.action", {
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
			$.messager.alert("系统提示", "请选择一条要展示封面的视频！");
			return;
		}
		var row = selectedRows[0];
		$("#dlg4").dialog('open').dialog('setTitle', '商品图片展示');
		document.getElementById('imgInit').src = "/"+row.v_cover;
	}

	function saveVideos() {
		$("#fm").form("submit", {
			url : url,
			onSubmit : function() {
				return $(this).form("validate");
			},
			success : function(result) {
				//var obj = jQuery.parseJSON(result);
				var ret=jQuery.parseJSON(result);
				if (ret=="error") {
					$.messager.alert("系统提示", "保存失败");
				} else {
					$.messager.alert("系统提示", "保存成功");
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}
			}
		});
	}

	function saveVideos1() {
		$("#fm1").form("submit", {
			url : url,
			onSubmit : function() {
				return $(this).form("validate");
			},
			success : function(result) {
				var ret=jQuery.parseJSON(result);
				if (ret=="error") {
					$.messager.alert("系统提示", "保存失败");
				} else {
					$.messager.alert("系统提示", "保存成功");
					resetValue();
					$("#dlg1").dialog("close");
					$("#dg").datagrid("reload");
				}
			}
		});
	}

	function closeVideosDialog() {
		$("#dlg").dialog("close");
		resetValue();
	}

	function closeVideosDialog1() {
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
	
	function resetValue(){
		$("#dg").datagrid("load")
	}
</script>

</head>
<body>
	<!-- 管理员操作栏-->
	<div id="tb">
		<div>
			<a href="javascript:openVideosAddDialog()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">添加</a> <a
				href="javascript:openVideosModifyDialog()" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">修改</a> <a
				href="javascript:deleteVideos()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除</a> <a
				href="javascript:showimages()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">封面展示</a>
		</div>
	</div>
	<!-- 属性栏  -->
	<table id="dg" title="视频管理" class="easyui-datagrid" fitColumns="true"
		height="800px" pagination="true" rownumbers="true" fit="true"
		url="video/findByPage.action" toolbar="#tb">
		<!--  fitColumns="true" th自适应宽度； pagination：翻页；rownumbers：添加行号；url：必须返回json形式 -->
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="v_title" width="15">视频标题</th>
				<th field="v_type" width="25">视频类型</th>
				<th field="v_teacher" width="33">视频讲师</th>
				<th field="v_link" width="33">视频链接</th>
				<th field="v_date" width="33">日期</th>
			</tr>
		</thead>
	</table>
	<!-- 添加窗口 -->
	<div id="dlg" class="easyui-dialog"
		style="width: 750px; height: 580px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<form id="fm" method="post"  enctype="multipart/form-data">
			<table cellspacing="5px;">
				<tr>
					<td height="15px"></td>
				</tr>
				<tr>
					<td>视频标题：</td>
					<td><input type="text" name="v_title" id="v_title"
						class="easyui-validatebox" required="true" /></td>
						<td>视频类型：</td>
					<td><input type="text" name="v_type" id="v_type"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>视频讲师：</td>
					<td><input type="text" name="v_teacher" id="v_teacher"
						class="easyui-validatebox" required="true" /></td>
					<td>是否首页推荐：</td>
					<td><input type="radio" name="v_isrecommend" value="1" checked="checked"/>是
						<input type="radio" name="v_isrecommend" value="2"/>否</td>
				</tr>
				<tr>
					<td>视频链接：</td>
					<td><input type="text" name="v_link" id="v_link"
						class="easyui-validatebox" required="true" /></td>
						<td>视频封面：</td>
					<td><input type="file" name="videopictrue" id="file1"/></td>
					
				</tr>
				</table>
				
				<table>
				<tr>
					<td>
						<p>视频简介：</p>
						<input id="text1" name="v_desc" type="hidden" 
											style="width: 200px; height: 200px;"/>
						<div id="editor"></div>
					</td>
					
				</tr>
				
				<tr>
					
					<td>
						<p>视频详情：</p>
						<input id="text2" name="v_describe" type="hidden" 
											style="width: 200px; height: 200px;"/>
						<div id="editor2"></div>
					</td></tr>
			</table>
		</form>
		
		<script type="text/javascript">
										var E = window.wangEditor;
										var editor = new E('#editor');
										var editor2=new E('#editor2');
										editor.customConfig.menus=[
											'head',  // 标题
											'bold',  // 粗体
											'fontSize',  // 字号
											'fontName',  // 字体
											'italic',  // 斜体
											'underline',  // 下划线
											'strikeThrough',  // 删除线
											'foreColor',  // 文字颜色
											'backColor',  // 背景颜色	
											'undo',  // 撤销
											'redo'	// 重复
											    					]
										
										editor2.customConfig.menus=[
																	'head',  // 标题
																	'bold',  // 粗体
																	'fontSize',  // 字号
																	'fontName',  // 字体
																	'italic',  // 斜体
																	'underline',  // 下划线
																	'strikeThrough',  // 删除线
																	'foreColor',  // 文字颜色
																	'backColor',  // 背景颜色	
																	'undo',  // 撤销
																	'redo'	// 重复
																	    					]
										
										
										var $text1 = $('#text1')
										editor.customConfig.onchange = function(html) {
											// 监控变化，同步更新到 text
											$text1.val(html)
										}
									 	var $text2 = $('#text2')
										editor2.customConfig.onchange = function(html) {
											// 监控变化，同步更新到 text
											$text2.val(html)
										} 
										editor.create();
										editor2.create();
										//初始化 textarea 的值
										$text1.val(editor.txt.text())
										//初始化 textarea 的值
										$text2.val(editor2.txt.text())
									</script>
	</div>
	<!-- 修改窗口 -->
	<div id="dlg1" class="easyui-dialog"
		style="width: 750px; height: 580px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons1">
		<form id="fm1" method="post" enctype="multipart/form-data">
			<table cellspacing="5px;">
				<tr>
					<td height="15px"></td>
				</tr>
				<tr>
					<input type="hidden" name="v_id" id="v_id1"
						class="easyui-validatebox"  />
					<td>视频标题：</td>
					<td><input type="text" name="v_title" id="v_title1"
						class="easyui-validatebox" required="true" /></td>
						<td>视频类型：</td>
					<td><input type="text" name="v_type" id="v_type1"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>视频讲师：</td>
					<td><input type="text" name="v_teacher" id="v_teacher1"
						class="easyui-validatebox" required="true" /></td>
					<td>是否首页推荐：</td>
					<td><input type="radio" name="v_isrecommend" value="1"/>是
						<input type="radio" name="v_isrecommend" value="2"/>否</td>
				</tr>
				<tr>
					<td>视频链接：</td>
					<td><input type="text" name="v_link" id="v_link1"
						class="easyui-validatebox" required="true" /></td>
					<td>视频封面：</td>
					<td><input type="file" name="videopictrue"/></td>
				</tr>
				</table>
				<table>
				<tr>
					
					<td>
						<p>视频简介：</p>
						<input id="text3" name="v_desc" type="hidden" 
											style="width: 200px; height: 200px;"/>
						<div id="editor3"></div>
					</td>
					
				</tr>
				
				<tr>
					
					<td>
						<p>视频详情：</p>
						<input id="text4" name="v_describe" type="hidden" 
											style="width: 200px; height: 200px;"/>
						<div id="editor4"></div>
					</td></tr>
			</table>
		</form>
		
		<script type="text/javascript">
										var E = window.wangEditor;
										var editor3 = new E('#editor3');
										var editor4=new E('#editor4');
										editor3.customConfig.menus=[
											'head',  // 标题
											'bold',  // 粗体
											'fontSize',  // 字号
											'fontName',  // 字体
											'italic',  // 斜体
											'underline',  // 下划线
											'strikeThrough',  // 删除线
											'foreColor',  // 文字颜色
											'backColor',  // 背景颜色	
											'undo',  // 撤销
											'redo'	// 重复
											    					]
										
										editor4.customConfig.menus=[
																	'head',  // 标题
																	'bold',  // 粗体
																	'fontSize',  // 字号
																	'fontName',  // 字体
																	'italic',  // 斜体
																	'underline',  // 下划线
																	'strikeThrough',  // 删除线
																	'foreColor',  // 文字颜色
																	'backColor',  // 背景颜色	
																	'undo',  // 撤销
																	'redo'	// 重复
																	    					]
										
										
										var $text3 = $('#text3')
										editor3.customConfig.onchange = function(html) {
											// 监控变化，同步更新到 text
											$text3.val(html)
										}
									 	var $text4 = $('#text4')
										editor4.customConfig.onchange = function(html) {
											// 监控变化，同步更新到 text
											$text4.val(html)
										} 
										editor3.create();
										editor4.create();
										//初始化 textarea 的值
										$text3.val(editor3.txt.text())
										//初始化 textarea 的值
										$text4.val(editor4.txt.text())
									</script>
	</div>

	<div id="dlg-buttons">
		<a href="javascript:saveVideos()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeVideosDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>

	<div id="dlg-buttons1">
		<a href="javascript:saveVideos1()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeVideosDialog1()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>


	<!-- 封面展示	 -->
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