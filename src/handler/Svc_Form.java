package handler;

import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpServletResponse;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.Order_history_select_DBBean;
import db.Order_history_select_DataBean;
import db.Product_DBBean;
import db.Product_DataBean;
import db.Trailer_DBBean;
import db.Trailer_DataBean;
import db.UserDBBean;
import db.UserDataBean;



@Controller
public class Svc_Form{
	
	@Resource
	private UserDBBean userDao;

	
	@Resource
	private Product_DBBean Product_Dao;
	
	
	@Resource
	private Order_history_select_DBBean Order_history_selectDao;
	
	@Resource
	private Trailer_DBBean Trailer_Dao;
	
	
	// 회원 가입
	@RequestMapping("/join")
	public ModelAndView JoinProcess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String result="회원 가입 페이지입니다.";
		request.setAttribute("result", result);
		return new ModelAndView("svc/svc_join");
	}
	
	
	@RequestMapping( "/login" )
	public ModelAndView LoginProcess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		return new ModelAndView( "svc/login" );
	}
	
	@RequestMapping( "/main" )
	public ModelAndView MainProcess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		return new ModelAndView( "svc/main" );
	}
	
	@RequestMapping("/EmailId")
	public ModelAndView svcEmailIdProcess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		return new ModelAndView("svc/EmailId");
	}
	
	@RequestMapping("/EmailPasswd")
	public ModelAndView svcEmailPasswd(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		return new ModelAndView("svc/EmailPasswd");
	}
	
	
	@RequestMapping("/update")
	public ModelAndView svcupdateprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		//�젙蹂� �뼸�뼱�삤湲�
		
		String user_id=(String)request.getSession().getAttribute("user_id");
		
		
		UserDataBean  userDto = userDao.selectCustomer(user_id);
		request.setAttribute("userDto", userDto);		
		
		
		return new ModelAndView("svc/user_update");
	}
	
	@RequestMapping("/delete")
	public ModelAndView svcdeleteprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		return new ModelAndView("svc/user_delete");
	}
	
	
	@RequestMapping("/myPage")
	public ModelAndView svcMyPageProcess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		//I don't know why but it fails to get userDto, so here I try to get it.
		String user_id=(String)request.getSession().getAttribute("user_id");
	
		if(user_id!=null) {
			UserDataBean userDto=userDao.getUser(user_id);
			request.setAttribute("userDto", userDto);					
		}
		return new ModelAndView("svc/myPage");
	}
	
	
	
	
	
	//////////////�긽�뭹 �쁺�뿭 //////////////////

	@RequestMapping("/product_insert")
	public ModelAndView product_insertprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String user_id=(String)request.getSession().getAttribute("user_id");
		
	
			UserDataBean userDto=userDao.getUser(user_id);
			request.setAttribute("userDto", userDto);
		
			
		return new ModelAndView("svc/product_insert_form");
	}
	
	
	@RequestMapping("/trailer_product_insert_form")
	public ModelAndView trailer_product_insertprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String user_id=(String)request.getSession().getAttribute("user_id");
		int trailer_id=Integer.parseInt(request.getParameter("trailer_id"));
	
			UserDataBean userDto=userDao.getUser(user_id);
			request.setAttribute("userDto", userDto);
	
			Trailer_DataBean product_dt = Product_Dao.product_trailer_select(trailer_id);
			request.setAttribute("product_dt", product_dt);
	
		
		
			
		return new ModelAndView("svc/trailer_product_insert_form");
	}
	
	
	
	
	
	@RequestMapping("/product_detail")
	public ModelAndView product_detailprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		int product_id=Integer.parseInt(request.getParameter("product_id"));
		
		Product_DataBean Produt_dto = Product_Dao.detialProduct(product_id);
		request.setAttribute("Produt_dto", Produt_dto);
		return new ModelAndView("svc/product_detail");
	}
	
	
	
	@RequestMapping("/product_off_detail")
	public ModelAndView product_off_detailprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		int product_id=Integer.parseInt(request.getParameter("product_id"));
		
		Product_DataBean Produt_dto = Product_Dao.detialProduct(product_id);
		request.setAttribute("Produt_dto", Produt_dto);
		return new ModelAndView("svc/product_off_detail");
	}
	
	
	
	@RequestMapping("/product_off_main")
	public ModelAndView product_off_mainprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		List <Product_DataBean> Produt_dto = Product_Dao.selectProduct_off();
		System.out.println(Produt_dto);
		request.setAttribute("Produt_dto", Produt_dto);
		return new ModelAndView("svc/product_off_main");
	}
	
	
	
	
	@RequestMapping("/product_select")
	public ModelAndView product_selectprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String user_id=(String)request.getSession().getAttribute("user_id");

		int result = Product_Dao.selectCountProduct(user_id);	
		
		
		
		
		
		List <Product_DataBean> Produt_dto = Product_Dao.selectProduct(user_id);
		System.out.println(Produt_dto);
		request.setAttribute("result", result);
		request.setAttribute("Produt_dto", Produt_dto);
		
		return new ModelAndView("svc/product_select");
	}
	
	
	
	
	
	
	
	
	@RequestMapping("/product_main")
	public ModelAndView process1(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		int product_category=Integer.parseInt(request.getParameter("menu_category"));
		if(product_category > 0) {

			
			
			List<Product_DataBean> menus1=Product_Dao.selectMenusByCategory(product_category);
			
		
			
			List<Product_DataBean> menus=Stream.of(menus1).flatMap(x->x.stream()).collect(Collectors.toList());
			request.setAttribute("menus", menus);
			
		} else {

			
			
				// 硫붾돱移댄뀒怨좊━ 0: �쟾泥대찓�돱 (�쎒�쑝濡� 泥섎━�븯�뒗 �궗�빆)
				
				List<Product_DataBean> menus=Product_Dao.selectMenus();
				request.setAttribute("menus", menus);
				
			
		}
		return new ModelAndView("svc/product_main");
	}

	
	
	///////二쇰Ц 愿��젴//////
	@RequestMapping("/order_insert")
	public ModelAndView order_insertprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
	
	String  user_id = (String) request.getSession().getAttribute("user_id");
	System.out.println(user_id);
	
	UserDataBean userDto = userDao.selectCustomer(user_id);	//�떊�긽�젙蹂�
	request.setAttribute("userDto", userDto);
	
	return new ModelAndView("svc/order_insert");
	
	}
	
	
	
	
	///////二쇰Ц湲곕줉/////////////////
	
	///二쇰Ц�궡�뿭 �솗�씤/////
	@RequestMapping("/Order_history_select")
	public ModelAndView Order_history_selectProcess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		//I don't know why but it fails to get userDto, so here I try to get it.
		String user_id=(String)request.getSession().getAttribute("user_id");

		int result = Order_history_selectDao.selectCountOrders(user_id);	
			
		
		List <Order_history_select_DataBean> cusorderlist = Order_history_selectDao.Select_order_history(user_id);
		request.setAttribute("cusorderlist", cusorderlist);
		request.setAttribute("result", result);	
		return new ModelAndView("svc/Order_history_select");
	}
	

	
	@RequestMapping("/detailed_order_history")
	public ModelAndView detailed_order_historyProcess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		//I don't know why but it fails to get userDto, so here I try to get it.
		int order_num= Integer.parseInt(request.getParameter("order_num"));
		String order_date = request.getParameter("order_date");
		
		List <Order_history_select_DataBean> order_historyDto = Order_history_selectDao.detailed_order_history(order_num);

			
		request.setAttribute("order_historyDto", order_historyDto);	
		request.setAttribute("order_num", order_num);		
		request.setAttribute("order_date", order_date);		
		return new ModelAndView("svc/detailed_order_history");
	}
	
	
	
	
	///�뙋留ㅽ븳 臾쇳뭹 �솗�씤/////
		@RequestMapping("/Order_confirmation")
		public ModelAndView Order_confirmationProcess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
			//I don't know why but it fails to get userDto, so here I try to get it.
			String user_id=(String)request.getSession().getAttribute("user_id");
			
			int result = Order_history_selectDao.selectconfirmation(user_id);	

			List <Order_history_select_DataBean> cusorderlist = Order_history_selectDao.Order_confirmation(user_id);
			request.setAttribute("cusorderlist", cusorderlist);
			request.setAttribute("result", result);
			
			return new ModelAndView("svc/Order_confirmation");
		}



		
		//////////// �씪�씠釉� �삁�젙 �럹�씠吏� /////////////////////////////
		@RequestMapping("/trailer_insert")
		public ModelAndView trailer_insertprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
			
			String user_id=(String)request.getSession().getAttribute("user_id");

			UserDataBean userDto=userDao.getUser(user_id);
			request.setAttribute("userDto", userDto);
				
			return new ModelAndView("svc/trailer_insert_form");
		}
		
		
		@RequestMapping("/trailer_detail")
		public ModelAndView trailer_detailprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
			
			int trailer_id=Integer.parseInt(request.getParameter("trailer_id"));
			Trailer_DataBean Trailer_dto = Trailer_Dao.detailTrailer(trailer_id);
			request.setAttribute("Trailer_dto", Trailer_dto);	
			
			return new ModelAndView("svc/trailer_detail");
		}
		
		
		@RequestMapping("/trailer_main")
		public ModelAndView trailer_mainprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
			
			List <Trailer_DataBean> Trailer_dto = Trailer_Dao.allTrailer();
			
			request.setAttribute("Trailer_dto", Trailer_dto);
			return new ModelAndView("svc/trailer_main");
		}
		
		
		@RequestMapping("/trailer_select")
		public ModelAndView trailer_selectprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
			String user_id=(String)request.getSession().getAttribute("user_id");

			int result = Trailer_Dao.selectCounttrailer(user_id);	
			
			System.out.println(result);
			
			List <Trailer_DataBean> Trailer_dto = Trailer_Dao.trailer_select(user_id);

			request.setAttribute("result", result);
			request.setAttribute("Trailer_dto", Trailer_dto);
			
			return new ModelAndView("svc/trailer_select");
		}
		
		
		
		//寃��깋湲곕뒫
		@RequestMapping("/search")
		public ModelAndView svcSearchProcess(HttpServletRequest request, HttpServletResponse response) throws HandlerException, UnsupportedEncodingException {
			try {
				request.setCharacterEncoding("utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			//get the type and keyword of searching
			String selectedType=request.getParameter("search_type");
			String keyword=request.getParameter("keyword");
			
			//set List
			List<Product_DataBean> foundList;
			List<Trailer_DataBean> foundTrailerList;
			
			//find Products for each type
			if(selectedType.equals("name")) {
				foundList=Product_Dao.findProductByUser(keyword);
				foundTrailerList=Trailer_Dao.findTrailerByUser(keyword);
			}else if(selectedType.equals("title")) {
				foundList=Product_Dao.findProductTitle(keyword);
				foundTrailerList=Trailer_Dao.findTrailerTitle(keyword);
			}else {
				foundList=Product_Dao.findProductByKeyword(keyword);
				foundTrailerList=Trailer_Dao.findTrailerByKeyword(keyword);
			}
			
			int count=0;
			int trailerCount=0;
			if(foundList.size()>0) {
				count=foundList.size();
			}
			if(foundTrailerList.size()>0) {
				trailerCount=foundTrailerList.size();
			}
			request.setAttribute("count", count);
			request.setAttribute("trailerCount", trailerCount);
			request.setAttribute("foundList", foundList);
			request.setAttribute("foundTrailerList", foundTrailerList);
			request.setAttribute("keyword", keyword);
			return new ModelAndView("svc/foundList");
		}
		
		
		
		
		@RequestMapping( "/product_review" )
		public ModelAndView productreviewProcess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
			return new ModelAndView( "svc/product_review" );
		}
		

	
}
