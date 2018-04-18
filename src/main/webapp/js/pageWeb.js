$(function(){
//	banner
	var banner_list_info=$.ajax({url:"http://localhost/zhjkcms/json/homeBanner.action",type:"GET",async:false})
	console.log(banner_list_info.responseJSON);
	
	for(var k in banner_list_info.responseJSON){
		$(".banner .main-content .show div table").append("<tr><td>"+banner_list_info.responseJSON[k].name+"</td><td><img src='"+banner_list_info.responseJSON[k].src+"'/></td><td>"+banner_list_info.responseJSON[k].url+"</td><td><span class='table_edit'>编辑</span><span class='table_delete'>删除</span></td></tr>")
	}
	
	picload(".banner");

	description(".banner",50);
	
//video
	var url = "json/video.action";
	$.post(url,function(data){
		$(data).each(function(i,n){
			/*var tr_bg=i%2?"#f2f2fa":"#e6ebf6";*/
			$(".video .main-content .show div table").append("<tr><td>"+n.v_title+"</td><td>"+n.v_type+"</td><td>"+n.v_teacher+"</td><td>"+n.v_link+"</td><td>"+n.v_date+"</td><td><span class='table_edit'>编辑</span><a href='deleteVideo.action?v_id="+n.v_id+"'><span class='table_delete'>删除</span></a></td></tr>")
		});
		
	},"json");
	
	picload(".video");
	description(".video",50);
})




