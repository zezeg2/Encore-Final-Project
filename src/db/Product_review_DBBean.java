package db;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;


public class Product_review_DBBean {
	private SqlSession session = SqlMapClient.getSession();
	
	public int insertReview(Product_review_DataBean reviewDto) {
		return session.insert("db.insertReview", reviewDto);
	}
	
	public List<Product_review_DataBean> getReview( int product_id ) {
		return session.selectList("db.getReview", product_id);
	}
	
	public int updateReview(Product_review_DataBean reviewDto) {
		return session.update("db.updateReview", reviewDto);
	}
	
	public int deleteReview( int review_id ) {
		return session.delete("db.deleteReview", review_id);
	}
	
	
	public int order_count(Product_review_DataBean reviewDto){
		return session.selectOne("db.order_count",reviewDto);
		
	}

	
}
