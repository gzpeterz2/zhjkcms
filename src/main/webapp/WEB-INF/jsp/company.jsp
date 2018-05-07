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
<script type="text/javascript" src="js/wangEditor.js"></script>
<style type="text/css">
        .toolbar {
            border: 1px solid #ccc;
        }
        .text {
            border: 1px solid #ccc;
            height: 600px;
        }
</style>
<script type="text/javascript">
	var url;

	//打开添加企业信息
	function openCompanysAddDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "添加企业简介");
		url = "companyIntro/save.action";
	}
	//打开修改企业信息框
	function openCompanysModifyDialog() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length != 1) {
			$.messager.alert("系统提示", "请选择一条要编辑的数据！");
			return;
		}
		var row = selectedRows[0];
		$("#dlg1").dialog("open").dialog("setTitle", "编辑企业信息");
		$("#c_id2").val(row.c_id);
		if(row.status==1){
			$("#status1").attr("checked","checked");
		}else{
			$("#status0").attr("checked","checked");
		}
		$("#c_pic2").val(row.c_pic);
		$("#picture2").val("");
		if(row.c_intro==null){
			editor.txt.html("");
		}
		editor.txt.html(row.c_intro);
		url = "companyIntro/update.action";
	}

	function deleteCompany() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length == 0) {
			$.messager.alert("系统提示", "请选择要删除的数据！");
			return;
		}
		var strIds = [];
		for (var i = 0; i < selectedRows.length; i++) {
			strIds.push(selectedRows[i].c_id);
		}
		var ids = strIds.join(",");
		$.messager.confirm("系统提示", "您确认要删掉这<font color=red>"
				+ selectedRows.length + "</font>条数据吗？", function(r) {
			if (r) {
				$.post("${pageContext.request.contextPath}/companyIntro/delete.action", {
					delIds : ids
				}, function(result) {
					if (result.success) {
						$.messager.alert("系统提示", "您已成功删除<font color=red>"
								+ result.delNums + "</font>条数据！");
						$("#dg").datagrid("reload");
					} else {
						$.messager.alert('系统提示', '<font color=red>'
								+ selectedRows[result.errorIndex].c_id
								+ '</font>' + result.errorMsg);
					}
				}, "json");
			}
		});
	}

	/* 图片展示 */

	function showimages() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length != 1) {
			$.messager.alert("系统提示", "请选择一条要展示图片的记录！");
			return;
		}
		var row = selectedRows[0];
		$("#dlg4").dialog('open').dialog('setTitle', '公司简介图片展示');
		document.getElementById('imgInit').src = row.c_pic;
	}

	function saveCompany() {
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
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}
			}
		});
	}

	function saveCompany1() {
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

	function closeCompanysDialog() {
		$("#dlg").dialog("close");
		resetValue();
	}

	function closeCompanysDialog1() {
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
			<a href="javascript:openCompanysAddDialog()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">添加
			</a>
			<a id="toUpdate" href="javascript:openCompanysModifyDialog()" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">修改
			</a>
			<a href="javascript:deleteCompany()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除
			</a>
			<a href="javascript:showimages()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">图片展示</a>
		</div>
	</div>
	<!-- 属性栏  -->
	<table id="dg" title="公司简介" class="easyui-datagrid" fitColumns="true"
		height="800px" pagination="true" rownumbers="true" fit="true"
		url="companyIntro/selectByPage.action" toolbar="#tb"  striped=true autoRowHeight=false>
		<!--  fitColumns="true" th自适应宽度； pagination：翻页；rownumbers：添加行号；url：必须返回json形式 -->
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="c_id" width="10" hidden=true>c_id</th>
				<th field="c_pic" width="15">公司图片</th>
				<th field="c_intro" width="15">公司简介</th>
				<th field="status" width="15">是否展示</th>
			</tr>
		</thead>
	</table>

	<!-- 添加窗口 -->
	<div id="dlg" class="easyui-dialog"
		style="width: 500px; height: 500px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons" modal=true resizable=true maximizable=true>
		<form id="fm" method="post" enctype="multipart/form-data">
			<table cellspacing="5px;">
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td>公司图片：</td>
					<td><input type="file" name="picture" id="picture"
						class="easyui-validatebox" required="true" />
					<input type="hidden" name="c_pic" id="c_pic"/>
					</td>
				</tr>
				<tr>
					<td>是否展示：</td>
					<td>
						<input type="radio" name="status" value="1"/>是
						<input type="radio" name="status" value="0"/>否
					</td>
				</tr>
				<tr>
					<td>公司简介：</td>
				</tr>
				<tr>
					<td colspan="4" id="editor"><!-- id="editor"  -->
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea id="text2" name="c_intro" style="width:100%; height:200px;display: none;"></textarea><!-- display: none; -->
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<!-- 修改窗口 -->
	<div id="dlg1" class="easyui-dialog"
		style="width: 580px; height: 500px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons1"  modal=true resizable=true maximizable=true>
		<form id="fm1" method="post" enctype="multipart/form-data">
			<table cellspacing="5px;">
				<tr>
					<td height="15px"></td>
					<!-- id -->
					<td><input type="hidden" name="c_id" id="c_id2"/></td>
				</tr>
				<tr>
					<td>公司图片：</td>
					<td><input type="file" name="picture" id="picture2"/></td>
					<td><input type="hidden" name="c_pic" id="c_pic2"/></td>
				</tr>
				<tr>
					<td>是否展示：</td>
					<td>
						<input id="status1" type="radio" name="status" value="1"/>是
						<input id="status0" type="radio" name="status" value="0"/>否
					</td>
				</tr>
				<tr>
					<td>公司简介：</td>
				</tr>
				<tr>
					<td colspan="4"><!-- id="editor"  -->
					<div id="editor_div1" class="toolbar"></div>
					<div id="editor_div2" class="text"> <!--可使用 min-height 实现编辑区域自动增加高度--></div>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea id="text1" name="c_intro" style="width:100%; height:200px;display: none;"></textarea><!-- display: none; -->
					</td>
				</tr>
			</table>
		</form>
	</div>

	<div id="dlg-buttons">
		<a href="javascript:saveCompany()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeCompanysDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>

	<div id="dlg-buttons1">
		<a href="javascript:saveCompany1()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeCompanysDialog1()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>


	<!-- 图片展示	 -->
	<div id="dlg4" class="easyui-dialog"
		style="width: 600px; height: 500px; padding: 15px 10px" closed="true"
		buttons="#dlg-buttons4" resizable=true>
<!-- 		<form id="uploadImg" method="post" action="Companys!uploadPhoto" -->
<!-- 			enctype="multipart/form-data"> -->
<!-- 			<span style="white-space: pre"> </span>上传图片1：<input type="file" -->
<!-- 				name="upload"><br /> <br /> -->
<!-- 		</form> -->
		<div>
			<img src="?" id="imgInit" alt="未上传图片" width="100%" height="100%" />
		</div>
	</div>
	<script type="text/javascript">
		var E = window.wangEditor;
		var editor = new E('#editor_div1','#editor_div2');
		var editor2 = new E('#editor')
		//配置上传图片
		//配置服务器端地址
		editor.customConfig.uploadImgServer = 'img/upload.action';
		editor2.customConfig.uploadImgServer = 'img/upload.action';
		//隐藏"网络图片"tab
		editor.customConfig.showLinkImg = false;
		editor2.customConfig.showLinkImg = false;
		//限制上传图片大小（ 3M）
		//editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024;
		//限制一次最多上传 5 张图片
		//editor.customConfig.uploadImgMaxLength = 5;
		editor.customConfig.uploadFileName = 'myFileName';
		editor2.customConfig.uploadFileName = 'myFileName';
		editor.customConfig.uploadImgHooks = {
			customInsert : function(insertImg, result, editor) {
				// 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
				// insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果
				// 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
				var url = result.data;
				insertImg(url);	
				// result 必须是一个 JSON 格式字符串！！！否则报错
			}
		}
		editor2.customConfig.uploadImgHooks = {
				customInsert : function(insertImg, result, editor) {
					// 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
					// insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果
					// 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
					var url = result.data;
					insertImg(url);	
					// result 必须是一个 JSON 格式字符串！！！否则报错
				}
			}
		//关闭粘贴文本样式过滤
		editor.customConfig.pasteFilterStyle = false;
		editor2.customConfig.pasteFilterStyle = false;
		//通过onchange来实现 textarea 中提交富文本内容
		var $text1 = $('#text1');
		var $text2 = $('#text2');
		editor.customConfig.onchange = function (html) {
            // 监控变化，同步更新到 textarea
            $text1.val(html);
        }
		editor2.customConfig.onchange = function (html) {
            // 监控变化，同步更新到 textarea
            $text2.val(html);
        }
		editor.create();
		editor2.create();
		//初始化 textarea 的值
		$text1.val(editor.txt.html());
		$text2.val(editor2.txt.html());
		
		document.getElementById('toUpdate').addEventListener('click', openCompanyModifyDialog(editor), false)
	</script>
	
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