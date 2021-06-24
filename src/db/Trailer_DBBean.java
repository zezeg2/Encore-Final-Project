package db;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;

public class Trailer_DBBean{
	private SqlSession session = SqlMapClient.getSession();
	
///////////////////////상혁///////////////////////////////////
	public int insertTrailer(Trailer_DataBean trailer_dto) {
		return session.insert("db.insertTrailer", trailer_dto);
	}

	
	public Trailer_DataBean detialProduct(int product_id) {
		return session.selectOne("db.detialProduct", product_id);
	}

	
	public List<Trailer_DataBean> trailer_select(String user_id) {
		return session.selectList("db.trailer_select", user_id);
	}
	
	
	
	public int selectCounttrailer(String user_id) {
		return session.selectOne("db.selectCounttrailer", user_id);
	}
	
	
	
///////////////////종현 /////////////////////////////
	public List<Product_DataBean> selectProduct(String user_id) {
		return session.selectOne("db.selectProduct", user_id);
	}


	public Product_DataBean getProductid( ) {
		return session.selectOne("db.getUser");
	}


	public List<Product_DataBean> selectMenusByCategory(int product_category) {
		return session.selectList("db.selectMenusByCategory", product_category);
	}

	public List<Trailer_DataBean> allTrailer() {
		return session.selectList("db.allTrailer");
	}
	
	public Trailer_DataBean detailTrailer(int trailer_id) {
		return session.selectOne("db.detailTrailer", trailer_id);
	}
	
	public List<Trailer_DataBean> findTrailerByKeyword(String keyword) {
		return session.selectList("db.findTrailerByKeyword", keyword);
	}
	
	
	
	public List<Trailer_DataBean> findTrailerByUser(String keyword) {
		return session.selectList("db.findTrailerByUser", keyword);
	}
	
	
	public List<Trailer_DataBean> findTrailerTitle(String keyword) {
		return session.selectList("db.findTrailerTitle", keyword);
	}
	
}
