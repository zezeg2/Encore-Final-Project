package bean;

import org.springframework.context.annotation.Bean;


import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import db.Comment_DBBean;
import db.Order_history_DBBean;
import db.Order_history_select_DBBean;
import db.Product_DBBean;
import db.Product_chat_DBBean;
import db.Product_review_DBBean;
import db.Trailer_DBBean;
import db.UserDBBean;


@Configuration
public class CreateBean {
	
	@Bean
	public UserDBBean userDao() {
		return new UserDBBean();
	}
	
	
	@Bean
	public Order_history_DBBean Order_history_Dao() {
		return new Order_history_DBBean();
	}
	
	@Bean
	public Product_DBBean Product_Dao() {
		return new Product_DBBean();
	}
	
	
	@Bean
	public Order_history_select_DBBean Order_history_select() {
		return new Order_history_select_DBBean();
	}
	
	@Bean
	public Trailer_DBBean Trailer_Dao() {
		return new Trailer_DBBean();
	}
	
	
	@Bean
	public Comment_DBBean Comment_Dao() {
		return new Comment_DBBean();
	}
	
	
	
	@Bean
	public Product_chat_DBBean Product_chat_Dao() {
		return new Product_chat_DBBean();
	}
	
	
	@Bean
	public Product_review_DBBean Product_review_Dao() {
		return new Product_review_DBBean();
	}
	
	
	
	@Bean
	public ViewResolver viewResolver() {
		UrlBasedViewResolver viewResolver=new UrlBasedViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
}