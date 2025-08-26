package com.user;

import java.sql.Timestamp;

public class Post {
    private int id;
    private String title;
    private String content;
    private Timestamp pdate;
    private UserDetails uid;
    private String author;
    private String category;
    private String imgUrl;
    private int likes;

    // Constructors
    public Post() {
        super();
    }

    public Post(int id, String title, String content, String author, String category, Timestamp pdate, String imgUrl) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.author = author;
        this.category = category;
        this.pdate = pdate;
        this.imgUrl = imgUrl;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Timestamp getPdate() {
        return pdate;
    }

    public void setPdate(Timestamp pdate) {
        this.pdate = pdate;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public UserDetails getUid() {
        return uid;
    }

    public void setUid(UserDetails uid) {
        this.uid = uid;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }
}
