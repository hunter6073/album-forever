package com.tedu.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ssm.comm.Albums;
import com.ssm.comm.CarLists;
import com.ssm.comm.Comment;
import com.ssm.comm.OrderLists;
import com.ssm.comm.SongList;
import com.ssm.comm.WishLists;

@Repository
public interface CommDao {
	public Albums infors(String album);
	public List<Albums> others(String singer);
	
	public List<Comment> searchComments(String id);
	public List<Comment> searchByRating(Comment co);
	
	public OrderLists insertorder(OrderLists or);
	
	public CarLists insertcarlist(CarLists ca);
	public List<CarLists> searchcarlist(String name);
	public void updatecarlist(CarLists update);
	
	public WishLists insertwishlist(WishLists wi);
	public List<WishLists> searchwishlist(String name);
	
	public List<SongList> searchsonglist(String album);
	public void setcartreceipt(String receiptid,String username,String albumid);
    public void deletefromcart(String receiptid);
	


}
