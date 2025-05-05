package com.user;

import java.io.InputStream;
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

	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}




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

	public String getAuthor() {
		return author;
	}



	public void setAuthor(String author) {
		this.author = author;
	}


	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public Timestamp getPdate() {
		return pdate;
	}



	public void setPdate(Timestamp pdate) {
		this.pdate = pdate;
	}



	public UserDetails getUid() {
		return uid;
	}



	public void setUid(UserDetails uid) {
		this.uid = uid;
	}



	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public String getImgUrl() {
		return imgUrl;
	}



	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

}
