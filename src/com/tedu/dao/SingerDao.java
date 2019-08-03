package com.tedu.dao;

import java.util.List;

import com.tedu.entity.Album_info;
import com.tedu.entity.Singer_info;

public interface SingerDao
{
	public List<Singer_info> findAllSinger();
	public List<Singer_info> findSingerByType(String Type);
	public List<Singer_info> findSingerByWord(String Word);
	
	public List<Album_info> findAllAlbum();
	public List<Album_info> findAlbumByLanguage(String Language);
	public List<Album_info> findAlbumByStyle(String Style);
	public List<Album_info> findAlbumByRegion(String Region);
	public List<Album_info> findAlbumByPrice(float priceStart,float priceEnd);
	
	public List<Album_info> findAlbumBySinger(String singerName);
	public Singer_info ListSingerInfo(String singerName);
	
	public List<Album_info> RankingBySold();
	public List<Album_info> RankingByWish();
	public List<Album_info> RankingByDiscount();
	public List<Album_info> RankingByPublishtime();
	
	//public List<Album_info> ListByPage(int page);
	
}
