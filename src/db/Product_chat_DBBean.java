package db;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;


public class Product_chat_DBBean {
	private SqlSession session = SqlMapClient.getSession();
			
	public int insertChat_comment(Product_chat_DataBean chatDto) {
		return session.insert("db.insertChat_comment", chatDto);
	}
	
	
	public List<Product_chat_DataBean> getProduct_chat(int product_id ) {
		return session.selectList("db.getProduct_chat", product_id);
	}	

}
