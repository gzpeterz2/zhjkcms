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

	//打开添加学员就业信息框
	function openForumsAddDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "添加学员信息");
		url = "forum/save.action";
	}
	//打开修改学员就业信息框
	function openForumsModifyDialog() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length != 1) {
			$.messager.alert("系统提示", "请选择一条要编辑的数据！");
			return;
		}
		var row = selectedRows[0];
		$("#dlg1").dialog("open").dialog("setTitle", "编辑论文信息");
		$("#id2").val(row.id);
		$("#title2").val(row.title);
		$("#author2").val(row.author);
		$("#post_time2").val(row.post_time);
		$("#views2").val(row.views);
		$("#comments2").val(row.comments);
		$("#thumbups2").val(row.thumbups);
		if(row.editor==null){
			$("#editor2").val("111");
			row.editor="${existUser.name }";
			$("#editor2").val(row.editor);
		}
		$("#editor2").val(row.editor);
		$("#edit_time2").val(row.edit_time);
		$('#type2').combobox('setValue', row.type);
		if(row.top==1){
			$("#top1").attr("checked","checked");
		}else{
			$("#top0").attr("checked","checked");
		}
		if(row.original==1){
			$("#original1").attr("checked","checked");
		}else{
			$("#original0").attr("checked","checked");
		}
		$("#thumbuper2").val(row.thumbuper);
		$("#cover2").val(row.cover);
		$("#file_cover2").val("");
		if(row.content==null){
			editor.txt.html("");
		}
		editor.txt.html(row.content);
		url = "forum/update.action";
	}

	function deleteForum() {
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
		document.getElementById('imgInit').src = row.cover;
	}

	function saveForum() {
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

	function saveForum1() {
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

	function closeForumsDialog() {
		$("#dlg").dialog("close");
		resetValue();
	}

	function closeForumsDialog1() {
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
			<!-- <a href="javascript:openForumsAddDialog()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">添加
			</a> -->
			<a id="toUpdate" href="javascript:openForumsModifyDialog()" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">修改
			</a>
			<a href="javascript:deleteForum()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除
			</a>
			<a href="javascript:showimages()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">图片展示</a>
		</div>
	</div>
	<!-- 属性栏  -->
	<table id="dg" title="论坛管理" class="easyui-datagrid" fitColumns="true"
		height="800px" pagination="true" rownumbers="true" fit="true"
		url="forum/selectByPage.action" toolbar="#tb"  striped=true autoRowHeight=false>
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
				<th field="thumbuper" width="20">点赞者id记录</th>
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
		buttons="#dlg-buttons1"  modal=true resizable=true maximizable=true>
		<form id="fm1" method="post" enctype="multipart/form-data">
			<table cellspacing="5px;">
				<tr>
					<td height="15px"></td>
					<!-- 文章id -->
					<td><input type="hidden" name="id" id="id2"/></td>
					<!-- 发表时间 -->
					<td><input type="hidden" name="post_time" id="post_time2" /></td>
					<!-- 编辑时间 -->
					<td><input type="hidden" name="edit_time" id="edit_time2" /></td>
					<!-- 点赞者id记录 -->
					<td><input type="hidden" name="thumbuper" id="thumbuper2" /></td>
				</tr>
				<tr>
					<td>标题：</td>
					<td><input type="text" name="title" id="title2"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>作者：</td>
					<td><input type="text" name="author" id="author2"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>查看次数：</td>
					<td><input type="text" name="views" id="views2"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>评论次数：</td>
					<td><input type="text" name="comments" id="comments2"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>点赞次数：</td>
					<td><input type="text" name="thumbups" id="thumbups2"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>编辑者：</td>
					<td><input type="text" name="editor" id="editor2"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>分类：</td>
					<td>
					<select id="type2" class="easyui-combobox" name="type" editable=false style="width: 173px">   
					    <option value="resource">资源分享</option>   
					    <option value="technology">技术交流</option>   
					    <option value="new">最新活动</option>   
					</select>
					<!-- <input type="" name="type" id="type2"
						class="easyui-datebox" required="true" /> -->
					</td>
				</tr>
				<tr>
					<td>封面：</td>
					<td><input type="file" name="coverpic" id="file_cover"/></td>
					<td><input type="hidden" name="cover" id="cover2"/></td>
				</tr>
				<tr>
					<td>是否置顶：</td>
					<td>
						<input id="top1" type="radio" name="top" value="1"/>是
						<input id="top0" type="radio" name="top" value="0"/>否
					</td>
				</tr>
				<tr>
					<td>是否原创：</td>
					<td>
						<input id="original1" type="radio" name="original" value="1"/>是
						<input id="original0" type="radio" name="original" value="0"/>否
					</td>
				</tr>
				<tr>
					<td>正文内容：</td>
				</tr>
				<tr>
					<td colspan="4"><!-- id="editor"  -->
					<div id="editor_div1" class="toolbar"></div>
					<div id="editor_div2" class="text"> <!--可使用 min-height 实现编辑区域自动增加高度--></div>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea id="text1" name="content" style="width:100%; height:200px;"></textarea><!-- display: none; -->
					</td>
				</tr>
			</table>
		</form>
	</div>

	<div id="dlg-buttons">
		<a href="javascript:saveForum()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeForumsDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>

	<div id="dlg-buttons1">
		<a href="javascript:saveForum1()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeForumsDialog1()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>


	<!-- 图片展示	 -->
	<div id="dlg4" class="easyui-dialog"
		style="width: 600px; height: 500px; padding: 15px 10px" closed="true"
		buttons="#dlg-buttons4" resizable=true>
<!-- 		<form id="uploadImg" method="post" action="Forums!uploadPhoto" -->
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
		//配置上传图片
		//配置服务器端地址
		editor.customConfig.uploadImgServer = 'img/upload.action';
		//隐藏"网络图片"tab
		editor.customConfig.showLinkImg = false;
		//限制上传图片大小（ 3M）
		//editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024;
		//限制一次最多上传 5 张图片
		//editor.customConfig.uploadImgMaxLength = 5;
		editor.customConfig.uploadFileName = 'myFileName';
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
		//关闭粘贴文本样式过滤
		editor.customConfig.pasteFilterStyle = false;
		
		//通过onchange来实现 textarea 中提交富文本内容
		var $text1 = $('#text1');
		editor.customConfig.onchange = function (html) {
            // 监控变化，同步更新到 textarea
            $text1.val(html);
        }
		editor.create();
		//初始化 textarea 的值
		$text1.val(editor.txt.html());
		
		document.getElementById('toUpdate').addEventListener('click', openForumModifyDialog(editor), false)
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