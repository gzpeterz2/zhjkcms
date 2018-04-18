package com.hc.cms.po;

public class InstDynamic {
    private Integer artId;

    private String postTime;

    private Integer views;

    private String title;

    private String content;

    @Override
	public String toString() {
		return "InstDynamic [artId=" + artId + ", postTime=" + postTime + ", views=" + views + ", title=" + title
				+ ", content=" + content + "]";
	}

	public Integer getArtId() {
        return artId;
    }

    public void setArtId(Integer artId) {
        this.artId = artId;
    }

    public String getPostTime() {
        return postTime;
    }

    public void setPostTime(String postTime) {
        this.postTime = postTime == null ? null : postTime.trim();
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