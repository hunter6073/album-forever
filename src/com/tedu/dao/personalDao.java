package com.tedu.dao;

import java.util.List;

import com.tedu.classes.myAlbum;
import com.tedu.classes.myCollect;
import com.tedu.classes.myComment;
import com.tedu.classes.myInfo;
import com.tedu.classes.myReceipt;
import com.tedu.classes.myReceiptid;
import com.tedu.classes.mySinger;

public interface personalDao{
	public List<myInfo> findMyInfo(String username);
	public void saveMyInfo(String phone,String name,String postalCode,String address,String user);
	public List<myAlbum> findMyAlbum_receiptid(String username);
	public List<myAlbum> findMyAlbum(String username);	
	public List<myComment> findMyComment(String username);
	public void saveMyComment(String nickName,String albumid,String rating,String comment,String receiptid, String ctime);
	public void updateMyComment(String receiptid,String albumid);
	public List<mySinger> findMySinger(String name);
	public List<mySinger> findMySong(String albumid);
	public List<myCollect> findMyCollect_albumId(String username);
	public List<myCollect> findCollectAlbum(String albumid);
	public List<myReceiptid> findMyReceipt(String username);
	public void deleteMyReceipt(String receiptid);
	public List<myReceipt> findMyReceipt_album(String receiptid);
}
