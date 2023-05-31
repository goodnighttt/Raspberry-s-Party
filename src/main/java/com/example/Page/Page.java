package com.example.Page;

import java.util.Date;

public class Page {
    private String username;
    private String  publishtime;
    private String content;
    private String headtitle;
    private int likes;
    private int comments;

    //构造函数
    public Page(String username,String headtitle, String content, String publishtime, int likes,int comments) {
        this.username = username;
        this.publishtime = publishtime;
        this.content = content;
        this.headtitle = headtitle;
        this.likes = likes;
        this.comments = comments;
    }

    //getter和setter方法
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPublishtime() {
        return publishtime;
    }

    public void setPublishtime(String publishtime) {
        this.publishtime = publishtime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getHeadtitle() {
        return headtitle;
    }

    public void setHeadtitle(String headtitle) {
        this.headtitle = headtitle;
    }

    public int getLikes() { return likes; }

    public void setLikes(int likes) { this.likes = likes; }

    public int getComments() { return comments; }

    public void setComments(int comments) { this.comments = comments; }


}
//