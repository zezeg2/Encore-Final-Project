/*
 * !!! 占쏙옙占실삼옙占쏙옙 !!!
 * 占쏙옙占쏙옙 void, 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쌨소듸옙 占싱몌옙占쏙옙 占쏙옙占쏙옙占쌔듸옙 占쏙옙占쏙옙.
 * 占쌨소드마占쏙옙 占쏙옙占쏙옙 占쏙옙, 占쏙옙占쏙옙 占싯아쇽옙 채占쏙옙 占쏙옙占쏙옙 占쏙옙.
 */

package db;


import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;
 
public class UserDBBean {
	private SqlSession session=SqlMapClient.getSession();
	
	
	public int check(String user_id) {
		return session.selectOne("db.checkId", user_id);
	}
	
	public UserDataBean getUser( String user_id ) {
		return session.selectOne( "db.getUser", user_id );
	}

	public int insertUser( UserDataBean UserDto ) {
		return session.insert("db.insertUser", UserDto);
	}
	
	
	public UserDataBean getUserEmailId(String user_email) { 
		return session.selectOne("db.getUserEmailId", user_email); 
	} 
	
	public UserDataBean getUserEmailPasswd(String user_email) { 
		return session.selectOne("db.getUserEmailPasswd", user_email); 
	} 
	
	public int EmailCheck( String user_email ) {
		return session.selectOne( "db.EmailCheck", user_email);
	}

	public int idCheck( String user_id ) {
		return session.selectOne( "db.idCheck", user_id);
	}
	public int check(String user_id, String user_pw) {
		int result = 0;		
		if( check( user_id ) > 0 ) {
			// 아이디가 있다
			//LogonDataBean memberDto = getMember( id );
			UserDataBean UserDto = selectCustomer( user_id );
			if( user_pw.equals( UserDto.getUser_pw() ) ) {
				result = 1;
			} else {
				result = -1;
			}				
		} else {
			// 아이디가 없다
			result = 0;				
		}
		return result;
	}
	
	
	public UserDataBean selectCustomer(String user_id) {
		return session.selectOne("db.selectCustomer", user_id);
	}
	
	
	
	public int user_update(UserDataBean UserDto) {
		return session.update("db.user_update", UserDto);
	}
	
	
	public int deleteCustomer(String user_id) {
		return session.delete("db.deleteCustomer", user_id);
	}
	
	
	public int trailer(String user_id) {
		return session.delete("db.trailer", user_id);
	}
	
	public int order(String user_id) {
		return session.delete("db.order", user_id);
	}
	
	
	public int product(String user_id) {
		return session.delete("db.product", user_id);
	}

	

	public int deletProduct(String user_id) {
		return session.delete("db.deletProduct", user_id);
	}
	
	
	
	public int updateUser_address(Map<String, Object> map) {
		return session.update("db.updateUser_address", map);
	}


}
