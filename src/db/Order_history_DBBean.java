package db;


import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;


public class Order_history_DBBean {
	private SqlSession session = SqlMapClient.getSession();
	
	
	public int insertOrder(Order_history_DataBean orderDto) {
		return session.insert("db.insertOrder", orderDto);
	}


	
}
