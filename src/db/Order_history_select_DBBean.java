package db;


import java.util.List;


import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;


public class Order_history_select_DBBean {
	
	private SqlSession session = SqlMapClient.getSession();
	
	public List<Order_history_select_DataBean> Order_confirmation(String user_id) {
		return session.selectList("db.Order_confirmation", user_id);
	}
	
	
	public List<Order_history_select_DataBean> Select_order_history(String user_id) {
		return session.selectList("db.Select_order_history", user_id);
	}
	
	
	
	public List<Order_history_select_DataBean> detailed_order_history(int order_num) {
		return session.selectList("db.detailed_order_history", order_num);
	}
	
	
	public int selectCountOrders(String user_id) {
		return session.selectOne("db.selectCountOrders", user_id);
	}
	
	
	
	public int selectconfirmation(String user_id) {
		return session.selectOne("db.selectconfirmation", user_id);
	}

	
}
