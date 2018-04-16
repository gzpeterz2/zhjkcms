function description(listname,textnum){
	var text_area = $(listname+'.description textarea');
	var numalert = $(listname+'.description textarea span');
	text_area.bind('input propertychange',function(){
		var a=text_area.val().length;
		if(a>=textnum){
			text_area.attr("disabled",true);
			numalert.text("不能输入");
		}else{
			text_area.attr("disabled",false);
			numalert.text("还可输入"+(textnum-a)+"个字");
		}
	})
}
