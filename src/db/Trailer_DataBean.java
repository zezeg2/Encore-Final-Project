package db;

import java.sql.Timestamp;

public class Trailer_DataBean {
	private int trailer_id;
	private String trailer_name;
	private String trailer_title;
	private int trailer_price;
	private String trailer_image;
	private String trailer_aws_url;
	private String trailer_detail;
	private String trailer_launchdate;
	private Timestamp trailer_updatedate;
	private String user_id;
	
	public int getTrailer_id() {
		return trailer_id;
	}
	public void setTrailer_id(int trailer_id) {
		this.trailer_id = trailer_id;
	}
	public String getTrailer_name() {
		return trailer_name;
	}
	public void setTrailer_name(String trailer_name) {
		this.trailer_name = trailer_name;
	}
	public String getTrailer_title() {
		return trailer_title;
	}
	public void setTrailer_title(String trailer_title) {
		this.trailer_title = trailer_title;
	}
	public int getTrailer_price() {
		return trailer_price;
	}
	public void setTrailer_price(int trailer_price) {
		this.trailer_price = trailer_price;
	}
	public String getTrailer_aws_url() {
		return trailer_aws_url;
	}
	public void setTrailer_aws_url(String trailer_aws_url) {
		this.trailer_aws_url = trailer_aws_url;
	}
	public String getTrailer_detail() {
		return trailer_detail;
	}
	public void setTrailer_detail(String trailer_detail) {
		this.trailer_detail = trailer_detail;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getTrailer_image() {
		return trailer_image;
	}
	public void setTrailer_image(String trailer_image) {
		this.trailer_image = trailer_image;
	}
	public String getTrailer_launchdate() {
		return trailer_launchdate;
	}
	public void setTrailer_launchdate(String trailer_launchdate) {
		this.trailer_launchdate = trailer_launchdate;
	}
	public Timestamp getTrailer_updatedate() {
		return trailer_updatedate;
	}
	public void setTrailer_updatedate(Timestamp trailer_updatedate) {
		this.trailer_updatedate = trailer_updatedate;
	}


	
	
	
	
}
