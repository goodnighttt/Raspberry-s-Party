package com.example.Comment;

import java.sql.Timestamp;

public class Comment {
    private String username;
    private String content;
    private Timestamp commentTime;
    private int pageId;

    public Comment(String username, String content, Timestamp commentTime, int pageId) {
        this.username = username;
        this.content = content;
        this.commentTime = commentTime;
        this.pageId = pageId;
    }

    public String getUsername() {
        return username;
    }

    public String getContent() {
        return content;
    }

    public Timestamp getCommentTime() {
        return commentTime;
    }

    public int getPageId() {
        return pageId;
    }

    // add setters if necessary
}
