package com.tedu.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.entity.User;
import com.edu.service.UserService;
import com.edu.util.CookieUtil;
import com.tedu.classes.index_menu_album;
import com.tedu.classes.item;
import com.tedu.classes.product;
import com.tedu.classes.rankinglist;
import com.tedu.classes.receipt;
import com.tedu.classes.smartsearchclass;
import com.tedu.classes.trade;
import com.tedu.classes.user;
import com.tedu.classes.worker;
import com.tedu.dao.indexMenuDao;
import com.tedu.dao.item_manageDao;
import com.tedu.dao.personalDao;
import com.tedu.dao.receipt_manageDao;
import com.tedu.dao.trade_manageDao;
import com.tedu.dao.user_manageDao;
import com.tedu.dao.worker_manageDao;
//spring中跳转页面和传参的操作，每个人自己定义controller的名字，将自己的跳转和传参写进去
@Controller
public class indexmenucontroller {
	@Resource
	public UserService service;

	@RequestMapping("smartsearch.form")
	public String smartsearch(HttpServletRequest request,HttpServletResponse response,String search,String page,String module,String encode) throws UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		if(search.equals(""))
		{
			request.setAttribute("ssong", null);
			request.setAttribute("ssinger",null);
			request.setAttribute("salbum", null);
			return "searchinfo";
		}
		ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
		item_manageDao dao = ac.getBean(item_manageDao.class); 
		int page1=1,start=0,end=0;
		int albumstartpage=1;
		int singerstartpage=1;
		int songstartpage=1;
		if(module==null||module.equals(""))
		{
			request.setAttribute("module","song");
		}
		else
		{
			request.setAttribute("module", module);
		}
		if(page!=null)
		{
			page1 = Integer.parseInt(page);
			start = (page1-1)*8;
			end = start+8;
		}
		else
		{
			start = 0;
			end = start+8;
		}
		if(module!=null)
		{
			if(module.equals("song")) songstartpage=start;
			if(module.equals("album")) albumstartpage=start;
			if(module.equals("singer")) singerstartpage=start;
		}
		
		request.setAttribute("songstartpage", songstartpage);
		request.setAttribute("albumstartpage", albumstartpage);
		request.setAttribute("singerstartpage", singerstartpage);
		String search1="";
		if(encode==null)
		{
			search1 = search;
		}
		else
		{
			search1=new String(search.getBytes("ISO-8859-1"),"utf-8");

		}
		
		List<smartsearchclass> l1,l2,l3 = new ArrayList<smartsearchclass>();
		
	
		
		l1 = dao.smartsearchalbum("%"+search1+"%");
		l2 = dao.smartsearchsinger("%"+search1+"%");
		l3 = dao.smartsearchsong("%"+search1+"%");
		int ape=0;
		if(l1.size()%8==0)
		{
			ape=l1.size()/8;
		}
		else
		{
			ape = l1.size()/8+1;
		}
		int sipe=0;
		if(l2.size()%8==0)
		{
			sipe=l2.size()/8;
		}
		else
		{
			sipe = l2.size()/8+1;
		}
		int sope=0;
		if(l3.size()%8==0)
		{
			sope=l3.size()/8;
		}
		else
		{
			sope = l3.size()/8+1;
		}
		
		
		request.setAttribute("albumpageend", ape);
		request.setAttribute("singerpageend", sipe);
		request.setAttribute("songpageend", sope);

		if(l1.size()>0)
		{
			if(l1.size()<end)
			{
				end = l1.size();
			}
			l1 = l1.subList(start, end);
			request.setAttribute("salbum", l1);
		}
		if(l2.size()>0)
		{
			if(l2.size()<start+12)
			{
				end = l2.size();
				l2 = l2.subList(start, end);
			}
			else
			{
				
				l2 = l2.subList(start, start+12);
			}
			
			request.setAttribute("ssinger", l2);
		}
		if(l3.size()>0)
		{
			if(l3.size()<end)
			{
				end = l3.size();
			}
			l3 = l3.subList(start, end);
			request.setAttribute("ssong", l3);
		}
		
		request.setAttribute("page", page1);
		request.setAttribute("search", search1);
		
		
		return "searchinfo";
	}
	
	@RequestMapping("ddbx.form")
	public String index(HttpServletRequest request){         //首页的配置
		ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
		indexMenuDao dao = ac.getBean(indexMenuDao.class); 
		List<index_menu_album> albums = new ArrayList<index_menu_album>();//新歌首发
		//存储四个排行榜的列表
		List<index_menu_album> r1 = new ArrayList<index_menu_album>();
		List<index_menu_album> r2 = new ArrayList<index_menu_album>();
		List<index_menu_album> r3 = new ArrayList<index_menu_album>();
		List<index_menu_album> r4 = new ArrayList<index_menu_album>();
		List<rankinglist> l = new ArrayList<rankinglist>();//总列表
		//获取页面中的信息
		int size = dao.getnewalbums().size();
		
		if(size>16)
		{
			albums = dao.getnewalbums().subList(0,16);
		}
		else
		{
			albums = dao.getnewalbums().subList(0,size);
		}	
		
		albums = dao.getnewalbums();
		albums.get(1).background="background-color: RGB(65, 65, 65);";
		albums.get(3).background="background-color: RGB(65, 65, 65);";
		r1 = dao.getbestsellrankings().subList(0,4);
		r2 = dao.getdiscountrankings().subList(0,4);
		r3 = dao.getmostwishedrankings().subList(0,4);
		r4 = dao.getnewalbums().subList(0,4);
		l.add(new rankinglist("热卖榜",r1));
		l.add(new rankinglist("折扣榜",r2));
		l.add(new rankinglist("热专榜",r3));
		l.add(new rankinglist("新歌榜",r4));
		//为页面设置传入的参数
		request.setAttribute("rankings",l);
		request.setAttribute("newalbums",albums); 
		request.setAttribute("classics",albums);
		return "index";
	}
	
	


	@RequestMapping("itemmanage.form")
	public String item_manage(HttpServletRequest request){
		ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
		item_manageDao dao = ac.getBean(item_manageDao.class); 
        List<item> items = dao.getallitem();
        request.setAttribute("albums", items);
        request.setAttribute("album", items.get(0));
		return "AlbumManager";

	}
	
	@RequestMapping("userinfomanage.form")
	public String user_manage(HttpServletRequest request){
		ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
		user_manageDao dao = ac.getBean(user_manageDao.class); 
        List<user> users = dao.getallusers();
        request.setAttribute("userlist", users);
        
		return "usermanagement";

	}
	
	@RequestMapping("receiptmanage.form")
	public String receipt_manage(HttpServletRequest request){
		ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
		receipt_manageDao dao = ac.getBean(receipt_manageDao.class); 
		trade_manageDao td = ac.getBean(trade_manageDao.class); 
       
		//add trade
		List<receipt> receipt = dao.getallreceipt();
        List<trade> trades = td.getalltrade();
        for(int i=0;i<receipt.size();i++)
        {
        	receipt.get(i).albumtrade = new LinkedList<trade>();
        	
        }
        for(int i=0;i<trades.size();i++)
        {
        	for(int j=0;j<receipt.size();j++)
        		{
        		  if(trades.get(i).getReceiptid().equals(receipt.get(j).getR_id()))
        		  {
        			  receipt.get(j).albumtrade.add(trades.get(i));
        			  
        		  }
        		} 	
        }
		request.setAttribute("receiptlist", receipt);
        request.setAttribute("receipt1", receipt.get(0));
		return "ordermanager";

	}
	
	@RequestMapping("workermanage.form")
	public String worker_manage(HttpServletRequest request){
		ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
	    worker_manageDao dao = ac.getBean(worker_manageDao.class); 
        List<worker> workers = dao.getallworkers();
        for(worker w:workers)
        {
        	w.setPassword(CookieUtil.decryptString(w.getPassword()));
        }
        request.setAttribute("workerlist", workers);
		return "workers";
	}
	
	//backstage分页查询
	
	@RequestMapping("itemsearch.form")
	public String item_search(String value,HttpServletRequest request){
		ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
		item_manageDao dao = ac.getBean(item_manageDao.class); 
		List<item> items = null;
		if(value.equals("")||value==null){

		 items = dao.getallitem();
		}
		else
		{
			items = dao.getitembyId(value);
		}	
		if(items.size()>=1)
		{
			request.setAttribute("albums", items);
	        request.setAttribute("album", items.get(0));
		}
        
		return "AlbumManager";

	}
	
	@RequestMapping("userinfosearch.form")
	public String userinfo_search(String value,HttpServletRequest request){
		ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
		user_manageDao dao = ac.getBean(user_manageDao.class); 
        List<user> users =null;
       
		

		if(value.equals("")||value==null){
			users = dao.getallusers();
		}
		else
		{
			users = dao.getusersbyUsername(value);
		}	
		if(users.size()>=1)
		{
			 request.setAttribute("userlist", users);
		}
        
		return "usermanagement";
	}
	
	
	@RequestMapping("receiptsearch.form")
	public String receipt_search(String value,HttpServletRequest request){
		
		
		ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
		receipt_manageDao dao = ac.getBean(receipt_manageDao.class); 
		trade_manageDao td = ac.getBean(trade_manageDao.class); 
		List<receipt> receipt = null;
		if(value.equals("")||value==null){
			receipt = dao.getallreceipt();
		}
		else
		{
			receipt = dao.getreceiptbyId(value);
		}	
        List<trade> trades = td.getalltrade();
        for(int i=0;i<receipt.size();i++)
        {
        	receipt.get(i).albumtrade = new LinkedList<trade>();
        	
        }
        for(int i=0;i<trades.size();i++)
        {
        	for(int j=0;j<receipt.size();j++)
        		{
        		  if(trades.get(i).getReceiptid().equals(receipt.get(j).getR_id()))
        		  {
        			  receipt.get(j).albumtrade.add(trades.get(i));
        			  
        		  }
        		}
        	
        }
        if(receipt.size()>=1)
		{
        	request.setAttribute("receiptlist", receipt);
            request.setAttribute("receipt1", receipt.get(0));
		}

		return "ordermanager";

	}
	
	@RequestMapping("workerinfosearch.form")
	public String workerinfo_search(String value,HttpServletRequest request){
		ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
		worker_manageDao dao = ac.getBean(worker_manageDao.class); 
		List<worker> workers =null;

		if(value.equals("")||value==null){
			 workers = dao.getallworkers();
		}
		else
		{
			workers = dao.getworkerbyId(value);
		}	
		if(workers.size()>=1)
		{
			 for(worker w:workers)
		        {
		        	w.setPassword(CookieUtil.decryptString(w.getPassword()));
		        }
			request.setAttribute("workerlist", workers);
		}
        
		return "workers";

	}
	
	@RequestMapping("workerupdate.form")
	public String worker_update(worker w,HttpServletRequest request) throws UnsupportedEncodingException{
		ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
		worker_manageDao dao = ac.getBean(worker_manageDao.class); 
		
		w.setPassword(CookieUtil.encryptString(w.getPassword()));
        dao.workerupdate(w);
       
		return "redirect:workermanage.form";

	}
	
	@RequestMapping("workerinsert.form")
	public String worker_insert(worker w,HttpServletRequest request){
		ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
		worker_manageDao dao = ac.getBean(worker_manageDao.class); 
		if(w.getWorkerid()=="")
		{
			request.setAttribute("error", "未输入工号，请重新录入");
			 List<worker> workers = dao.getallworkers();
			 request.setAttribute("workerlist", workers);
			return "workers";
			
		}
		List<worker> test = null;
		test = dao.getworkerbyId(w.getWorkerid());
		if(test.size()==0)
		{
			w.setPassword(CookieUtil.encryptString(w.getPassword()));
	     dao.workerinsert(w);
				
		}
		else
		{
			request.setAttribute("error", "工号重复，请重新录入");	
		}
	
		 List<worker> workers = dao.getallworkers();
		 for(worker w6:workers)
	        {
	        	w6.setPassword(CookieUtil.decryptString(w.getPassword()));
	        }
		 request.setAttribute("workerlist", workers);
		return "workers";
		
		
       

	}
	@RequestMapping("deleteworker.form")
	public String worker_delete(worker w,HttpServletRequest request){
		ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
		worker_manageDao dao = ac.getBean(worker_manageDao.class); 
		worker w1 = new worker();
		w1.setWorkerid((String) request.getAttribute("workerid"));
        dao.deleteworker(w);
       
		return "redirect:workermanage.form";

	}
	
	
	
	@RequestMapping("deletereceipt.form")
	public String receipt_del(String r_id,HttpServletRequest request){
		
		
		ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
		personalDao dao = ac.getBean(personalDao.class); 
		trade_manageDao td = ac.getBean(trade_manageDao.class); 
		dao.deleteMyReceipt(r_id);

		return "redirect:receiptmanage.form";

	}
	
	@RequestMapping("insertalbum.form")
	public String item_insert(HttpServletRequest request,String albumid,String price,String albumname,String storage,String region,String picture,String singer,String sold,String language,String wished,String style,String discount,String publishcompany,String intro){
		ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
		item_manageDao dao = ac.getBean(item_manageDao.class); 
		
		if(albumid=="")
		{
			request.setAttribute("error", "未输入专辑编号，请重新输入");
			List<item> items = dao.getallitem();
	        request.setAttribute("albums", items);
	        request.setAttribute("album", items.get(0));
			return "AlbumManager";
		}
		
        float p = Float.parseFloat(price);
        int sto = Integer.parseInt(storage);
        int sol = Integer.parseInt(sold);
        int wish = Integer.parseInt(wished);
        int disc = Integer.parseInt(discount);
		item i = new item();
		i.setAlbumid(albumid);
		i.setAlbumname(albumname);
		i.setDiscount(disc);
		i.setIntro(intro);
		i.setLanguage(language);
		i.setPrice(p);
		i.setPublishcompany(publishcompany);
		i.setRegion(region);
		i.setPicture(picture);
		i.setSinger(singer);
		i.setSold(sol);
		i.setStorage(sto);
		i.setStyle(style);
		i.setWished(wish);
		i.setPublishtime(new Date());
		
		List<item> test = dao.getitembyId(i.getAlbumid());
		if(test.size()==0)
		{
			dao.insertnewitem(i);
		}
		else
		{
			request.setAttribute("error", "专辑编号重复，请重新输入");
			
		}
		List<item> items = dao.getallitem();
        request.setAttribute("albums", items);
        request.setAttribute("album", items.get(0));
		return "AlbumManager";

	}
	
	
	@RequestMapping("itemdelete.form")
	public String item_delete(HttpServletRequest request,String value){
		ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
		item_manageDao dao = ac.getBean(item_manageDao.class); 
       
		dao.deleteitem(value);
		List<item> items = dao.getallitem();
        request.setAttribute("albums", items);
        request.setAttribute("album", items.get(0));
		return "AlbumManager";

	}
	
	
	
	@RequestMapping("updatealbum.form")
	public String item_update(HttpServletRequest request,String albumid,String price,String albumname,String storage,String region,String picture,String singer,String sold,String language,String wished,String style,String discount,String publishcompany,String intro){
		ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
		item_manageDao dao = ac.getBean(item_manageDao.class); 
        float p = Float.parseFloat(price);
        int sto = Integer.parseInt(storage);
        int sol = Integer.parseInt(sold);
        int wish = Integer.parseInt(wished);
        int disc = Integer.parseInt(discount);
		item i = new item();
		i.setAlbumid(albumid);
		i.setAlbumname(albumname);
		i.setDiscount(disc);
		i.setIntro(intro);
		i.setLanguage(language);
		i.setPrice(p);
		i.setPublishcompany(publishcompany);
		i.setRegion(region);
		i.setPicture(picture);
		i.setSinger(singer);
		i.setSold(sol);
		i.setStorage(sto);
		i.setStyle(style);
		i.setWished(wish);
		dao.updateitem(i);
		List<item> items = dao.getallitem();
        request.setAttribute("albums", items);
        request.setAttribute("album", items.get(0));
		return "AlbumManager";

	}
	
	@RequestMapping("chartmanage.form")
	public String showchart(HttpServletRequest request){
		ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
		indexMenuDao dao = ac.getBean(indexMenuDao.class); 
		List<index_menu_album> r1 = new ArrayList<index_menu_album>();
		r1 = dao.getbestsellrankings().subList(0,8);
		item_manageDao it = ac.getBean(item_manageDao.class);
		List<index_menu_album> r2 = new ArrayList<index_menu_album>();
		String[] name = {"流行","古典","摇滚","原声","民谣"};
		for(int i=0;i<name.length;i++)
		{
			index_menu_album ia = new index_menu_album();
			ia.setName(name[i]);
			ia.setSold(it.getcountbystyle(name[i]));
			r2.add(ia);
		}
		String[] name1 = {"国语","粤语","英语","日语","韩语"};
		for(int i=0;i<name1.length;i++)
		{
			index_menu_album ia = new index_menu_album();
			ia.setName(name1[i]);
			ia.setSold(it.getcountbylanguage(name1[i]));
			r2.add(ia);
		}
		
		request.setAttribute("catagory", r2);
		request.setAttribute("topsell", r1);
		return "charts";

	}
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("testajax.form")
	public void testajax(String ajax_username, HttpServletRequest request,HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter ajax_out = response.getWriter();
		List<String> l = new LinkedList<String>();
		l.add("abc2");
		l.add("bcd2");
		request.getSession().setAttribute("abc", l);
		ajax_out.print("test");	
		
	}
	
}



