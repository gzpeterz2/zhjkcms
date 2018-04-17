<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/wangEditor.min.js"></script>

</head>
<body>
<%-- <form action="${pageContext.request.contextPath }/instDynamic/addDynamic.action" method="post" >
	<h2>资讯标题：</h2>
	<input name="title" type="text" placeholder="请输入标题"/>
	<h2>资讯内容：</h2>
	<input name="content" type="text"/>
		
	<input type="submit" value="添加">	
</form> --%>
<div id="div1">
<script type="text/javascript">
	var E = window.wangEditor;
	var editor = new E('#div1');   
        /* // 上传图片（举例）
        editor.config.uploadImgUrl = 'http://localhost:8080/zhjkcms/instDynamic/fileupload';
        
        // 设置 headers（举例）
        editor.config.uploadHeaders = {
            'Accept' : 'multipart/form-data'
        };

        // 设置 headers（举例）
        editor.config.uploadImgFileName = 'myFileName';
         */
        editor.create();
        $('#btn1').click(function () {
            // 获取编辑器区域完整html代码
            var html = editor.$txt.html();
    
            // 获取编辑器纯文本内容
            var text = editor.$txt.text();
    
            // 获取格式化后的纯文本
            var formatText = editor.$txt.formatText();
            
            alert(html);
        });
    </script>
	</div>
	<button id="btn1">获取内容</button>
	<div id="editor">
		<script type="text/javascript">
			var E = window.wangEditor;
			var editor = new E('#editor');
			 editor.customConfig.uploadImgServer = 'http://localhost:8080/zhjkcms/instDynamic/fileupload.action'; //上传URL
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
			editor.create();
		</script>
	</div>
</body>
</html>