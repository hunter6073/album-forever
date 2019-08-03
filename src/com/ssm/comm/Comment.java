package com.ssm.comm;

import java.sql.Date;

public class Comment {
	
	private String albumid;
	private String username;//用户名
	private Date ctime;//评论时间
	private String comment;//评论内容
	private int rating;//类型
	private int ratings;
	


	public int getRatings() {
		return ratings;
	}

	public void setRatings(int ratings) {
		this.ratings = ratings;
	}

	@Override
	public String toString() {
		return "Comment [albumid=" + albumid + ", comment=" + comment
				+ ", ctime=" + ctime + ", rating=" + rating + ", username="
				+ username + "]";
	}

	public String getAlbumid() {
		return albumid;
	}

	public void setAlbumid(String albumid) {
		this.albumid = albumid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Date getCtime() {
		return ctime;
	}

	public void setCtime(Date ctime) {
		this.ctime = ctime;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}
	
	

}
