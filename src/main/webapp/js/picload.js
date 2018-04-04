function picload(listname){
	var picload_box = $(listname+" .picload");
	var select_button =  picload_box.children("input[type='button']");;
	var input_file = select_button.siblings("input[type='file']");
	var span = select_button.siblings("span");
	
	select_button.click(function(){
		input_file.click();
	})
	
	input_file.change(function(){
//		获取图片名
		var fileval=$(this).val();
		console.log(fileval);
		var imgname=fileval.split('\\');
		imgname=imgname.pop();
		
//		获取拓展名
		var expend = imgname.substr(imgname.lastIndexOf(".")).toUpperCase();
//		根据文件名判断文件格式,这里只添加jpg,gif,png
		if(expend==".JPG"||expend==".GIF"||expend==".PNG"){
			span.html(imgname);//填充图片名和大小，图片宽高不传到外部
			span.css("color","#2E96F8");
		}else{
			span.html("暂时仅支持jpg/png/gif格式图片上传");
			span.css("color","red");
		}
		
		
	})
}

