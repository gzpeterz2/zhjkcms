package com.hc.cms.po;
/**
 * 学员故事-pojo
 * @author administer
 *
 */
public class StudentStory {
	
	//学员id
	private Integer id;
	//学员姓名
	private String name;
	//发布时间
	private String post_time;
	//浏览量
    private Integer views;
    //点赞数
    private Integer thumbups;
    //编辑人
	private String editor;
	//编辑时间
	private String edit_time;
	//故事内容
	private String content;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPost_time() {
		return post_time;
	}
	public void setPost_time(String post_time) {
		this.post_time = post_time;
	}
	public Integer getViews() {
		return views;
	}
	public void setViews(Integer views) {
		this.views = views;
	}
	public Integer getThumbups() {
		return thumbups;
	}
	public void setThumbups(Integer thumbups) {
		this.thumbups = thumbups;
	}
	public String getEditor() {
		return editor;
	}
	public void setEditor(String editor) {
		this.editor = editor;
	}
	public String getEdit_time() {
		return edit_time;
	}
	public void setEdit_time(String edit_time) {
		this.edit_time = edit_time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	

}
