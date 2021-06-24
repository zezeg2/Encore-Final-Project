package db;

import java.sql.Timestamp;

public class Order_history_select_DataBean {
	private int order_num;
	private String user_name;
	private String user_addr;
	private String user_addr2;
	private int product_price;
	private int order_qnt;
	private String product_name;
	private Timestamp order_date;
	private int product_id;
	
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_addr() {
		return user_addr;
	}
	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}
	public String getUser_addr2() {
		return user_addr2;
	}
	public void setUser_addr2(String user_addr2) {
		this.user_addr2 = user_addr2;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getOrder_qnt() {
		return order_qnt;
	}
	public void setOrder_qnt(int order_qnt) {
		this.order_qnt = order_qnt;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public Timestamp getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}
	
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	
	
}
