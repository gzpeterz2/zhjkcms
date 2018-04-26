package com.hc.cms.po;

public class InstDynamic {
    private Integer art_id;

    private String post_time;

    private Integer views;

    private String title;

    private String content;

    

    @Override
	public String toString() {
		return "InstDynamic [art_id=" + art_id + ", post_time=" + post_time + ", views=" + views + ", title=" + title
				+ ", content=" + content + "]";
	}

	public Integer getArt_id() {
		return art_id;
	}

	public void setArt_id(Integer art_id) {
		this.art_id = art_id;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}