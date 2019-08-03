package com.tedu.web;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.tedu.dao.SingerDao;
import com.tedu.entity.Album_info;
import com.tedu.entity.PageInfo;
import com.tedu.entity.Singer_info;

@Controller
public class ListSingerInfoController {
	int page = 1;

	//歌手详情查看
	@RequestMapping("/listSingerInfo.form")
	public String ListSingerInfo(HttpServletRequest request) throws UnsupportedEncodingException
	{
		
		
		String singername1 = request.getParameter("singername");//new String(request.getParameter("singername").getBytes("ISO-8859-1"),"utf-8");
		String page1 = request.getParameter("page");
		if(page1==null)
		{
			page1 = "1";
		}
		page = Integer.parseInt(page1);
		String singername = singername1; 
		System.out.println("singername"+singername+"__"+page);
		ApplicationContext ctx = new ClassPathXmlApplicationContext("springMVC.xml");
		SingerDao singerdao = ctx.getBean(SingerDao.class);
		PageHelper.startPage(page, 8);
		List<Album_info> albumlist = singerdao.findAlbumBySinger(singername);	
		PageInfo<Album_info> pageInfo = new PageInfo<Album_info>(albumlist);
		request.setAttribute("AlbumList", albumlist);
		request.setAttribute("pageNow", pageInfo.getPageNum());
		request.setAttribute("TotalPage", pageInfo.getPages());
		Singer_info singerinfo  = singerdao.ListSingerInfo(singername);
		System.out.println(singerinfo);
		request.getSession().setAttribute("SingerInfo", singerinfo);
		return "SingerInfo";
	}

	
	
}
