function picload(listname){
	
//	元素列表
	var picload_box = $(listname+" .picload");
	var select_button =  picload_box.children("input[type='button']");;
	var input_file = select_button.siblings("input[type='file']");
	var img_box = select_button.siblings("div");
	var span = select_button.siblings("span");
	
	
	var click_but = picload_box.siblings("button");
	var img_title = picload_box.siblings("input[type='text']");
	
//	点击button input触发file input
	select_button.click(function(){
		input_file.click();
	})
	
//	文件上传,需求支持h5，这里不做兼容
	input_file.change(function(){
		img_box.html("");
		
//		获取图片名
		var fileval=$(this).val();
		var imgname=fileval.split('\\');
		imgname=imgname.pop();
		
//		获取拓展名
		var expend = imgname.substr(imgname.lastIndexOf(".")).toUpperCase();
//		根据文件名判断文件格式,这里只添加jpg,gif,png
		if(expend==".JPG"||expend==".GIF"||expend==".PNG"){
			
//			运用fileReader方法，显示缩略图
			var file=this.files[0];
			var filesize = file.size;//文件大小
			var filepath = new FileReader();
			filepath.readAsDataURL(file);//文件转换成纯数据的方法
			
//			加载
			filepath.onload = function(){
				let img = new Image();
				img.src=this.result;
				img_box.append(img);
				
//				图片加载
				img.onload = function(){
					var img_width=this.width;
					var img_height=this.height;
					this.style.width="100%";
					this.style.height="auto";
					
					var bigfile=filesize/1024/1024 > 1 ? "警告，文件过大" : "" ;
					span.html(imgname+"<i class='size'>"+img_width+"x"+img_height+"&nbsp;&nbsp;"+bigfile+"</i>");//填充图片名和大小，图片宽高不传到外部
					span.css("color","#2E96F8");
					if(bigfile){
						span.children("i").css("color","red");
					}else{
						span.children("i").css("color","#d9d9d9");
					}
				}
			}
		}else{
			span.html("暂时仅支持jpg/png/gif格式图片上传");
			span.css("color","red");
		}
		
	})
	
	return picload_box;
}
