package com.tedu.web;

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
public class ListRankController {
	
	SingerDao singerdao = null;
	int PageContro = 12;
	@RequestMapping("/rankByPage.form")
	public String RankByPage(HttpServletRequest request,int page,String sign)
	{
		ApplicationContext ctx = new ClassPathXmlApplicationContext("springMVC.xml");
		singerdao = ctx.getBean(SingerDao.class);
		if("sold".equals(sign))
		{
			PageHelper.startPage(page, PageContro);
			List<Album_info> albumlist = singerdao.RankingBySold();
			PageInfo<Album_info> pageInfo = new PageInfo<Album_info>(albumlist);
			request.setAttribute("Albumlist", albumlist);
			request.setAttribute("ColorS", "RGB(253,99,2)");
			request.setAttribute("pageNow", pageInfo.getPageNum());
			request.setAttribute("TotalPage", pageInfo.getPages());
			request.setAttribute("album_sign", "sold");
			return "Ranking";
		}
		else if("wish".equals(sign))
		{
			PageHelper.startPage(page, PageContro);
			List<Album_info> albumlist = singerdao.RankingByWish();
			PageInfo<Album_info> pageInfo = new PageInfo<Album_info>(albumlist);
			request.setAttribute("Albumlist", albumlist);
			request.setAttribute("ColorW", "RGB(128,190,19)");
			request.setAttribute("pageNow", pageInfo.getPageNum());
			request.setAttribute("TotalPage", pageInfo.getPages());
			request.setAttribute("album_sign", "wish");
			return "Ranking";
		}	
		else if("publishtime".equals(sign))
		{
			PageHelper.startPage(page, PageContro);
			List<Album_info> albumlist = singerdao.RankingByPublishtime();
			PageInfo<Album_info> pageInfo = new PageInfo<Album_info>(albumlist);
			request.setAttribute("Albumlist", albumlist);
			request.setAttribute("ColorP", "RGB(249,182,39)");
			request.setAttribute("pageNow", pageInfo.getPageNum());
			request.setAttribute("TotalPage", pageInfo.getPages());
			request.setAttribute("album_sign", "publishtime");
			return "Ranking";
		}
		else if("discount".equals(sign))
		{
			PageHelper.startPage(page, PageContro);
			List<Album_info> albumlist = singerdao.RankingByDiscount();
			PageInfo<Album_info> pageInfo = new PageInfo<Album_info>(albumlist);
			request.setAttribute("Albumlist", albumlist);
			request.setAttribute("ColorD", "RGB(0,127,190)");
			request.setAttribute("pageNow", pageInfo.getPageNum());
			request.setAttribute("TotalPage", pageInfo.getPages());
			request.setAttribute("album_sign", "discount");
			request.setAttribute("index", albumlist.size());
			return "Ranking";
		}
		return "Ranking";
	}
	

	
	

}
