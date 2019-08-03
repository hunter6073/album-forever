package com.tedu.web;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.tedu.dao.ListAlbumDao;
import com.tedu.entity.Album_info;
import com.tedu.entity.PageInfo;

@Controller
public class ListAlbumController {
	
	ListAlbumDao listalbumdao;
	@RequestMapping("/listalbum.form")
	public String ListAlbum(HttpServletRequest request,String language,String style,String region,String price,String page) throws UnsupportedEncodingException
	{
		String language1 = language;//new String(language.getBytes("ISO-8859-1"),"utf-8"); 
		String style1 = style;//new String(style.getBytes("ISO-8859-1"),"utf-8"); 
		String region1 = region;//new String(region.getBytes("ISO-8859-1"),"utf-8"); 
		String price1 = price;//new String(price.getBytes("ISO-8859-1"),"utf-8"); 
		
		ApplicationContext ctx = new ClassPathXmlApplicationContext("springMVC.xml");
		listalbumdao = ctx.getBean(ListAlbumDao.class);
		System.out.println(language1+style1+region1+price1+page);
		List<Album_info> albumlist;
		Album_info ainfo = new Album_info();
		
		
		
		if("全部".equals(language1))
		{
			ainfo.setAlbum_language(null);
		}
		else
		{
			ainfo.setAlbum_language(language1);
		}
		if("全部".equals(style1))
		{
			ainfo.setAlbum_style(null);
		}
		else
		{
			ainfo.setAlbum_style(style1);
		}
		if("全部".equals(region1))
		{
			ainfo.setAlbum_region(null);
		}
		else
		{
			ainfo.setAlbum_region(region1);
		}
		if("全部".equals(price1))
		{
			ainfo.setAlbum_price(111);
		}
		else
		{
			ainfo.setAlbum_price(Integer.parseInt(price1));
		}
		System.out.println(ainfo.getAlbum_price());
		PageHelper.startPage(Integer.parseInt(page), 15);
		albumlist = listalbumdao.ListAlbum(ainfo);
		
		for(Album_info sin : albumlist)
		{
			System.out.println("222");
			System.out.println(sin.toString());
		}
		
		PageInfo<Album_info> pageInfo = new PageInfo<Album_info>(albumlist);		
        request.setAttribute("TotalPage", pageInfo.getPages());
        request.setAttribute("pageNow", pageInfo.getPageNum());
		request.setAttribute("albumlist", albumlist);
		
		request.setAttribute("language", language1);
		request.setAttribute("style", style1);
		request.setAttribute("region",region1);
		request.setAttribute("price",price1);
		
		request.setAttribute("page", page);
		return "Album";	

	}
}
