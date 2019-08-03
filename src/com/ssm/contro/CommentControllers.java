package com.ssm.contro;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.entity.User;
import com.ssm.comm.Albums;
import com.ssm.comm.CarLists;
import com.ssm.comm.Comment;
import com.ssm.comm.OrderLists;
import com.ssm.comm.SongList;
import com.ssm.comm.WishLists;
import com.tedu.dao.CommDao;

@Controller("CommentControllers")
public class CommentControllers {
@Resource
	public CommDao dao;
	
	Albums infor;
	
	List<Comment> all;
	List<Comment> good;
	List<Comment> mid;
	List<Comment> bad;
	
	Comment no = new Comment();
	
	List<SongList> songs;
	
	List<Albums> infors;
	
	//查询当前专辑信息
	public Albums informations(String album){
		
		
		Albums co = dao.infors(album);
		
		return co;
	}
	
	//查询个人收藏列表
	public List<WishLists> wishs(String name){
		
		
		List<WishLists> wishes = dao.searchwishlist(name);
		
		for(WishLists lists:wishes){
		System.out.println("This is list albumid :"+lists.getAlbumid()+"/n");
		}
		return wishes;
	}
	
	//查询当前歌手的其他专辑
	public List<Albums> others(String singer){
		
		
		List<Albums> other = dao.others(singer);
		
		return other;
	}
	
	//查询歌单
	public List<SongList> songslist(String album){
		
		
		List<SongList> songlist = dao.searchsonglist(album);
		return songlist;
	}
	
	//查询所有评论
	public List<Comment> test_searche(String s){
		
		
		List<Comment> all = dao.searchComments(s);
		
		return all;
	}
	//查询等级评论
	public List<Comment> test_searchByRating(String s,int r,int rs){
		
		
		
		Comment rat = new Comment();
		rat.setAlbumid(s);
		rat.setRating(r);
		rat.setRatings(rs);
		System.out.println(rat.getAlbumid());
		List<Comment> rate = dao.searchByRating(rat);
		return rate;
	}


	@RequestMapping("distinctitem.form")
	public String jump(HttpServletRequest request,String album,String username) {
		
		

		String wisher = "收藏";
		User u = (User) request.getSession().getAttribute("user");
		if(u!=null)
		{
			List<WishLists> oldd = dao.searchwishlist(u.getUsername());
			System.out.println(oldd);
			for(WishLists olds:oldd){

				if(olds.getAlbumid().equals(album)){
					wisher = "已收藏";
					break;
				}else{
					wisher = "收藏";
				}
			}
			
			request.setAttribute("wisher", wisher);
		}
	

		
		infor = informations(album);
		infors = others(infor.getSinger());
		
		Comment no = new Comment();
		no.setAlbumid("亲");
		no.setComment("亲，还没有评论哦 ，来抢沙发吧！");
		
		all = test_searche(album);
		int commentnumber = all.size();
		good = test_searchByRating(album, 4,5);
		int goodnum = good.size();
		mid = test_searchByRating(album, 3,3);
		int midnum = mid.size();
		bad = test_searchByRating(album, 1,2);
		int badnum = bad.size();
		if(bad.size()==0){
			System.out.println("差评列表为空了");
			bad.add(0, no);
		}
		if(mid.size()==0){
			System.out.println("差评列表为空了");
			mid.add(0, no);
		}
		if(good.size()==0){
			System.out.println("差评列表为空了");
			good.add(0, no);
		}
		if(all.size()==0){
			System.out.println("差评列表为空了");
			all.add(0, no);
		}
		
		songs = songslist(album);
		
		request.getSession().setAttribute("username", username);
		
		request.setAttribute("lis", all);
		request.setAttribute("good", good);
		request.setAttribute("mid", mid);
		request.setAttribute("bad", bad);
		request.setAttribute("infor", infor);
		request.setAttribute("others", infors);
		
		request.setAttribute("songs", songs);
		
		request.setAttribute("commentnumber", commentnumber);
		request.setAttribute("goodnum", goodnum);
		request.setAttribute("midnum", midnum);
		request.setAttribute("badnum", badnum);
	
		return "buypage";
	}
	
	@RequestMapping("buynow.form")
	public String buynow(HttpServletRequest request,String albumid,String inputcount){
		
		if(( request.getSession().getAttribute("user"))==null){
			return "login";
		}
		
		
		
		infor = informations(albumid);
		
		float price = Integer.parseInt(inputcount)*infor.getPrice();
		System.out.println(price);
		
		Albums al = informations(albumid);
		OrderLists order = new OrderLists();
		order.setId(1);
		order.setAlbumid(al.getAlbumid());
		order.setNumber(Integer.parseInt(inputcount));
		order.setReceiptid("002");
		order.setSubtotal(price);
		
		dao.insertorder(order);
		
		
		infors = others(infor.getSinger());		
		all = test_searche(albumid);
		good = test_searchByRating(albumid, 1,2);
		mid = test_searchByRating(albumid, 3,3);
		bad = test_searchByRating(albumid, 4,5);
		
		request.setAttribute("lis", all);
		request.setAttribute("good", good);
		request.setAttribute("mid", mid);
		request.setAttribute("bad", bad);
		request.setAttribute("infor", infor);
		request.setAttribute("others", infors);
		
		return "buypage";
	}
	



	
	
	@RequestMapping("car.form")
	public String car(HttpServletRequest request,String albumid,String inputcount){
		if(( request.getSession().getAttribute("user"))==null){
			return "login";
		}else{
		
		User u = (User) request.getSession().getAttribute("user");
		CarLists car = new CarLists();
		car.setAlbumid(albumid);
		car.setNumber(Integer.parseInt(inputcount));
		car.setUsername(u.getUsername());

		CarLists sames = new CarLists();
		int i=0;
		List<CarLists> oldd = dao.searchcarlist(u.getUsername());
		System.out.println(oldd);
		for(CarLists olds:oldd){
			System.out.println("this is for");
			if(olds.getAlbumid().equals(albumid)){
				i=1;
				sames=olds;
				System.out.println(sames.getNumber()+Integer.parseInt(inputcount));
				System.out.println("there is a same");
				break;
			}else{
				i=0;
				System.out.println("there is no the same");
			}
		}
		
		if(i==0){
			System.out.println("there was a new wish");
			dao.insertcarlist(car);
			//return "car";
		}else{
			int allcars = sames.getNumber()+Integer.parseInt(inputcount);
			if(allcars<=infor.getStorage()){
				System.out.println("Its normal!");
				System.out.println(allcars);
			}else {
				allcars=infor.getStorage();
				System.out.println("Its abnomal!");
				System.out.println(allcars);
			}
			car.setNumber(allcars);
			System.out.println("there was a wish in past");
			dao.updatecarlist(car);
			//return "car";
		}

		
		//购物车Javabean
		infor = informations(albumid);
		infors = others(infor.getSinger());
		
		Comment no = new Comment();
		no.setAlbumid("亲");
		no.setComment("亲，还没有评论哦 ，来抢沙发吧！");
		
		all = test_searche(albumid);
		int commentnumber = all.size();
		good = test_searchByRating(albumid, 4,5);
		int goodnum = good.size();
		mid = test_searchByRating(albumid, 3,3);
		int midnum = mid.size();
		bad = test_searchByRating(albumid, 1,2);
		int badnum = bad.size();
		System.out.println(no.getComment());
		if(bad.size()==0){
			System.out.println("差评列表为空了");
			bad.add(0, no);
		}
		if(mid.size()==0){
			System.out.println("差评列表为空了");
			mid.add(0, no);
		}
		if(good.size()==0){
			System.out.println("差评列表为空了");
			good.add(0, no);
		}
		if(all.size()==0){
			System.out.println("差评列表为空了");
			all.add(0, no);
		}
		
		songs = songslist(albumid);
		
		//request.getSession().setAttribute("username", username);
		
		request.setAttribute("lis", all);
		request.setAttribute("good", good);
		request.setAttribute("mid", mid);
		request.setAttribute("bad", bad);
		request.setAttribute("infor", infor);
		request.setAttribute("others", infors);
		
		request.setAttribute("songs", songs);
		
		request.setAttribute("commentnumber", commentnumber);
		request.setAttribute("goodnum", goodnum);
		request.setAttribute("midnum", midnum);
		request.setAttribute("badnum", badnum);
	    
		return "redirect:getCart.form?username="+u.getUsername();
		
		}
	}
	
	
	
	
	
	@RequestMapping("wish.form")
	public String wish(HttpServletRequest request,String album,HttpServletResponse response) throws IOException{
		User u = (User) request.getSession().getAttribute("user");
		PrintWriter ajax_out = response.getWriter();
		if((request.getSession().getAttribute("user"))==null){
			return "login";
		}else{
		
		int i=3;
		List<WishLists> lists = wishs(u.getUsername());
		System.out.println(lists);
		for(WishLists lis:lists){
			
			if(lis.getAlbumid().equals(album)){
				i=1;System.out.println(i);
				break;
			}else{
				i=0;System.out.println(i);
			}
		}
		for(int c =1;c<10;c++){
			System.out.println("this is a test");
		}
		
		if(i==1){
			System.out.println("there was a wish in past");
			ajax_out.print("failed");
			return "error";
		}else{
			
			System.out.println("it is done");
			WishLists wish = new WishLists();
			wish.setAlbumid(album);
			
			wish.setUsername(u.getUsername());
			
			dao.insertwishlist(wish);
			ajax_out.print("success");
			return "error";
		}
		}
	}
}
