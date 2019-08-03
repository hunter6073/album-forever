package com.tedu.web;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tedu.dao.personalDao;
import com.tedu.classes.myAlbum;
import com.tedu.classes.myCollect;
import com.tedu.classes.myComment;
import com.tedu.classes.myInfo;
import com.tedu.classes.myReceipt;
import com.tedu.classes.myReceiptid;
import com.tedu.classes.mySinger;


@Controller
public class myInfoController {
	personalDao dao=null;
@RequestMapping("loading_myInfo.form")
		public String loading_myInfo(String nickName,HttpServletRequest request) throws UnsupportedEncodingException{
			  ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
			  dao = ac.getBean(personalDao.class);
			  String nickName_up=new String(nickName.getBytes("ISO-8859-1"),"utf-8"); 
			  List<myInfo> list_info=dao.findMyInfo(nickName_up);			  
			  String phone = null;
			  String normalAddress = null;
			  String name = null;
			  String postalCode = null;
	          for(int i=0;i<list_info.size();i++)
	          {
	        	  phone=list_info.get(i).getPhone();
                 normalAddress=list_info.get(i).getAddress();
                 name=list_info.get(i).getReceivename();
                 postalCode=list_info.get(i).getPostalCode();
	          }
			  request.setAttribute("phone",phone);
			  request.setAttribute("normalAddress",normalAddress);
			  request.setAttribute("name",name);
			  request.setAttribute("postalCode",postalCode);
				return "myInfo";
			}

@RequestMapping("save_myInfo.form")
public String updateMyInfo(String user_name,
	    String phone,String name,String postalCode,
	    String address,HttpServletRequest request){
	  ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
	  dao = ac.getBean(personalDao.class);
	  dao.saveMyInfo(phone,name,postalCode,address,user_name);
	  List<myInfo> list_info=dao.findMyInfo(user_name);			  
	  String save_phone = null;
	  String save_normalAddress = null;
	  String save_name = null;
	  String save_postalCode = null;
      for(int i=0;i<list_info.size();i++)
      {
    	 save_phone=list_info.get(i).getPhone();
         save_normalAddress=list_info.get(i).getAddress();
         save_name=list_info.get(i).getReceivename();
         save_postalCode=list_info.get(i).getPostalCode();
      }
	  request.setAttribute("phone",save_phone);
	  request.setAttribute("normalAddress",save_normalAddress);
	  request.setAttribute("name",save_name);
	  request.setAttribute("postalCode",save_postalCode);
		return "myInfo";
	}
@RequestMapping("loading_myMusic.form")
public String loading_myMusic(String nickName,String albumId,HttpServletRequest request) throws UnsupportedEncodingException{
	  ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
	  dao = ac.getBean(personalDao.class);
	  String nickName_up=new String(nickName.getBytes("ISO-8859-1"),"utf-8"); 
	  List<myAlbum> fin=new LinkedList();
	  List<myAlbum> list_receiptid=dao.findMyAlbum_receiptid(nickName_up);
	  List<myComment> list_comment=dao.findMyComment(nickName_up);
	  String receiptid= null;
      for(int i=0;i<list_receiptid.size();i++)
      {
    	  receiptid=list_receiptid.get(i).getReceiptid();
    	  List<myAlbum> list_album=dao.findMyAlbum(receiptid);
    	  for(int j=0;j<list_album.size();j++){
    		  fin.add(list_album.get(j));
    	  }    	  
      }
      for(int i=0;i<fin.size();i++){
    	  for(int j=i+1;j<fin.size();j++){
    		  if(fin.get(i).getAlbumId().equals(fin.get(j).getAlbumId())){
    			  fin.remove(j);
    			  j--;
    		  }    		  
    	  }
      }
      if(fin.size()!=0&&list_comment.size()!=0)
      {
    	  request.setAttribute("albumList", fin);
          request.setAttribute("commentList", list_comment);
          if(albumId==null)
          request.setAttribute("albumList0", fin.get(0));
          else{
        	  for(int i=0;i<fin.size();i++){
        		  if(fin.get(i).getAlbumId().equals(albumId))
        			  request.setAttribute("albumList0", fin.get(i));   			  
        	  }
        	  }     
      }
     
		return "myMusic";
	}

@RequestMapping("loading_myCollect.form")
public String loading_myCollect(String nickName,HttpServletRequest request) throws UnsupportedEncodingException{
	  ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
	  dao = ac.getBean(personalDao.class);
	  String nickName_up=new String(nickName.getBytes("ISO-8859-1"),"utf-8"); 
	  System.out.println("昵称是"+nickName_up);
	  List<myCollect> list_collect_albumId=dao.findMyCollect_albumId(nickName_up);			  
	  String albumid= null;
	  List<myCollect> fin=new LinkedList();
      for(int i=0;i<list_collect_albumId.size();i++)
      {
    	  albumid=list_collect_albumId.get(i).getAlbumId();
    	  List<myCollect> list_album=dao.findCollectAlbum(albumid);    	  
    	  for(int j=0;j<list_album.size();j++){
    		  fin.add(list_album.get(j));
    	  }    	  
      }  
      request.setAttribute("albumList", fin);
    
		return "myCollect";
	}

@RequestMapping("loading_mySinger.form")
public String loading_mySinger(String nickName,String singerId,HttpServletRequest request) throws UnsupportedEncodingException{
	  ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
	  dao = ac.getBean(personalDao.class);
	  String nickName_up=new String(nickName.getBytes("ISO-8859-1"),"utf-8");
	  List<mySinger> fin_singer=new LinkedList();
	  List<myAlbum> fin_album=new LinkedList();
	  List<mySinger> fin_song=new LinkedList();
	  List<myAlbum> list_receiptid=dao.findMyAlbum_receiptid(nickName_up);
	  String receiptid= null;
	  String singerid= null;
	  String albumid=null;
      for(int i=0;i<list_receiptid.size();i++)
      {
    	  receiptid=list_receiptid.get(i).getReceiptid();
    	  List<myAlbum> list_album=dao.findMyAlbum(receiptid);
    	  for(int j=0;j<list_album.size();j++){
    		  singerid=list_album.get(j).getSinger();
    		  fin_album.add(list_album.get(j));
    		  List<mySinger> list_singer=dao.findMySinger(singerid);
    		  for(int k=0;k<list_singer.size();k++){
    		      fin_singer.add(list_singer.get(k));
    		  }
    	  }    	  
      }
      for(int i=0;i<fin_singer.size();i++){
    	  for(int j=i+1;j<fin_singer.size();j++){
    		  if(fin_singer.get(i).getName().equals(fin_singer.get(j).getName()))
    		  { fin_singer.remove(j);  
    		     j--;
    		  }		  
    	  }
      }
      for(int i=0;i<fin_album.size();i++){
    	  for(int j=i+1;j<fin_album.size();j++){
    		  if(fin_album.get(i).getAlbumId().equals(fin_album.get(j).getAlbumId()))
    		  { fin_album.remove(j);  
 		     j--;
 		  }		 	  
    	  }
      }
      for(int i=0;i<fin_album.size();i++){
    	  albumid=fin_album.get(i).getAlbumId();
    	  List<mySinger> list_song=dao.findMySong(albumid);
    	  for(int j=0;j<list_song.size();j++){
    		  fin_song.add(list_song.get(j));
    	  }   	  
      }
      for(int i=0;i<fin_song.size();i++){
    	  System.out.println(fin_song.get(i).getSongname());
      }
      request.setAttribute("albumList", fin_album);
      request.setAttribute("songList", fin_song);
      request.setAttribute("singerList", fin_singer);
		return "mySinger";
	}

@RequestMapping("save_comment.form")
public String save_comment(String nickName,String albumid,String rating,String comment,String receiptid,HttpServletRequest request) throws UnsupportedEncodingException {
	  ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
	  dao = ac.getBean(personalDao.class);
	  SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String ctime = df.format(new Date());
	  dao.saveMyComment(nickName, albumid, rating, comment,receiptid,ctime);
	  dao.updateMyComment(receiptid, albumid);
	  String nickName_up=new String(nickName.getBytes("ISO-8859-1"),"utf-8"); 
	  List<myAlbum> fin=new LinkedList();
	  List<myAlbum> list_receiptid=dao.findMyAlbum_receiptid(nickName_up);
	  List<myComment> list_comment=dao.findMyComment(nickName_up);
      for(int i=0;i<list_receiptid.size();i++)
      {
    	  receiptid=list_receiptid.get(i).getReceiptid();
    	  List<myAlbum> list_album=dao.findMyAlbum(receiptid);
    	  for(int j=0;j<list_album.size();j++){
    		  fin.add(list_album.get(j));
    	  }    	  
      }
      for(int i=0;i<fin.size();i++){
    	  for(int j=i+1;j<fin.size();j++){
    		  if(fin.get(i).getAlbumId().equals(fin.get(j).getAlbumId())){
    			  fin.remove(j);
    			  j--;
    		  }    		  
    	  }
      }
      request.setAttribute("albumList", fin);
      request.setAttribute("commentList", list_comment);      
      request.setAttribute("albumList0", fin.get(0));
	  return "myMusic";
}
@RequestMapping("loading_myReceipt.form")
public String loading_myReceipt(String nickName,HttpServletRequest request) throws UnsupportedEncodingException{
	  ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
	  dao = ac.getBean(personalDao.class);
	  String nickName_up=new String(nickName.getBytes("ISO-8859-1"),"utf-8"); 
	  String receiptid=null;
	  List<myReceiptid> list_receipt=dao.findMyReceipt(nickName_up);
	  for(int i=0;i<list_receipt.size();i++){
		  receiptid=list_receipt.get(i).getReceiptid();
		  List<myReceipt> list_album=dao.findMyReceipt_album(receiptid);
		  list_receipt.get(i).setReceipt_album(list_album);
	  }
	  for(int i=0;i<list_receipt.size();i++){
		  System.out.println(list_receipt.get(i));
	  }
	  request.setAttribute("receiptList",list_receipt);
		return "myReceipt";
	}
@RequestMapping("delete.form")
public String pay(String nickName,String receiptid,HttpServletRequest request) throws UnsupportedEncodingException{
	  ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
	  dao = ac.getBean(personalDao.class); 
	  dao.deleteMyReceipt(receiptid);
	  String nickName_up=new String(nickName.getBytes("ISO-8859-1"),"utf-8"); 
	  String receipt=null;
	  List<myReceiptid> list_receipt=dao.findMyReceipt(nickName_up);
	  for(int i=0;i<list_receipt.size();i++){
		  receipt=list_receipt.get(i).getReceiptid();
		  List<myReceipt> list_album=dao.findMyReceipt_album(receipt);
		  list_receipt.get(i).setReceipt_album(list_album);
	  }
	  request.setAttribute("receiptList",list_receipt);
		return "myReceipt";
	}

}

















