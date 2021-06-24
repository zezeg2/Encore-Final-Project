package db;

import java.sql.Timestamp;

public class Order_history_DataBean {
	private int order_num;
	private int order_qnt;
	private Timestamp order_date;
	private int product_id;
	private String user_id;
	
	
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public int getOrder_qnt() {
		return order_qnt;
	}
	public void setOrder_qnt(int order_qnt) {
		this.order_qnt = order_qnt;
	}
	public Timestamp getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}	
	
}
