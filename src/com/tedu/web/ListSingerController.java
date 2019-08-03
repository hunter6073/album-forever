package com.tedu.web;

import java.io.UnsupportedEncodingException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.tedu.dao.ListSingerDao;
import com.tedu.entity.PageInfo;
import com.tedu.entity.Singer_info;

@Controller
public class ListSingerController {
	ListSingerDao listsingerdao ;
	@RequestMapping("/listsinger.form")
	public String ListSinger(HttpServletRequest request,HttpServletResponse response,String region,String word,String page) throws UnsupportedEncodingException
	{
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String region1 = region;//new String(region.getBytes("ISO-8859-1"),"utf-8"); 
		String word1 = word;//new String(word.getBytes("ISO-8859-1"),"utf-8"); 
		
		
		
		ApplicationContext ctx = new ClassPathXmlApplicationContext("springMVC.xml");
		listsingerdao = ctx.getBean(ListSingerDao.class);
		System.out.println(region1+word1+page);
		List<Singer_info> singerlist;
		Singer_info sinfo = new Singer_info();
		PageHelper.startPage(Integer.parseInt(page), 15);
		int i = 1;
		if("全部".equals(region1)&&"全部".equals(word1))
		{
			sinfo.setSinger_type(null);
			sinfo.setSinger_keyword(null);
			singerlist = listsingerdao.ListSinger(sinfo);
			i=2;
		}
		else if("全部".equals(region1)&&!("全部".equals(word1)))
		{
			sinfo.setSinger_type(null);
			sinfo.setSinger_keyword(word1);
			singerlist = listsingerdao.ListSinger(sinfo);
			i=3;
		}
		else if("全部".equals(word1)&&!("全部".equals(region1)))
		{
			sinfo.setSinger_type(region1);
			sinfo.setSinger_keyword(null);
			singerlist = listsingerdao.ListSinger(sinfo);
			i=4;
		}
		else
		{
			sinfo.setSinger_type(region1);
			sinfo.setSinger_keyword(word1);
			singerlist = listsingerdao.ListSinger(sinfo);
			i=5;
		}
		System.out.println(i);
		
	
		
		PageInfo<Singer_info> pageInfo = new PageInfo<Singer_info>(singerlist);		
        request.setAttribute("TotalPage", pageInfo.getPages());
        request.setAttribute("pageNow", pageInfo.getPageNum());
		request.setAttribute("singerlist", singerlist);
		request.setAttribute("region",region1);
		request.setAttribute("word",word1);
		request.setAttribute("page", page);
		return "Singer";	
	}

}
