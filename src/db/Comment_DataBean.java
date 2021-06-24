package db;

import java.sql.Timestamp;

public class Comment_DataBean {
	private int comment_id;
	private String comment_content;
	private Timestamp comment_date;
	private String user_id;
	private int trailer_id;
	private String user_name;
	
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public Timestamp getComment_date() {
		return comment_date;
	}
	public void setComment_date(Timestamp comment_date) {
		this.comment_date = comment_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getTrailer_id() {
		return trailer_id;
	}
	public void setTrailer_id(int trailer_id) {
		this.trailer_id = trailer_id;
	}
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	
}
