$(function(){
//	banner
	var banner_list_info=$.ajax({url:"http://localhost/zhjkcms/json/homeBanner.action",type:"GET",async:false})
	console.log(banner_list_info.responseJSON);
	
	for(var k in banner_list_info.responseJSON){
		$(".banner .main-content .show div table").append("<tr><td>"+banner_list_info.responseJSON[k].name+"</td><td><img src='"+banner_list_info.responseJSON[k].src+"'/></td><td>"+banner_list_info.responseJSON[k].url+"</td><td><span class='table_edit'>编辑</span><span class='table_delete'>删除</span></td></tr>")
	}
	
	picload(".banner");
	description(".banner",50);
})




