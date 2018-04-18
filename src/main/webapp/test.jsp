<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="http://localhost:8080/zhjkcms/img/upload.action"
		method="post" enctype="multipart/form-data">
		<input id="text1" type="hidden" name="text1"
			style="width: 100%; height: 200px;"></input>

		<div id="editor">
			<b>wangEditor</b>
		</div>

		<input type="submit" value="GO">
	</form>

	<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="./js/wangEditor.js"></script>
	<script type="text/javascript">
		
		var E = window.wangEditor;
		var editor = new E('#editor');
		editor.customConfig.uploadImgServer = 'http://localhost:8080/zhjkcms/img/upload.action'; //上传URL
		//editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024;
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

		var $text1 = $('#text1')
		editor.customConfig.onchange = function(html) {
			// 监控变化，同步更新到 text
			$text1.val(html)
		}
		editor.customConfig.showLinkImg = false
		editor.create()
		
		//初始化 textarea 的值
		$text1.val(editor.txt.text())
	</script>

</body>
</html>

