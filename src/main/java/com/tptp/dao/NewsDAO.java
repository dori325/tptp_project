package com.tptp.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.dao.AbstractDAO;

@Repository("newsDAO")
public class NewsDAO  extends AbstractDAO{

	//공지사항
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> list(Map<String, Object> map) {
		return selectList("news.list", map);
	}

	//추천리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> k_list(Map<String, Object> map) {
		return selectList("news.k_list", map);
	}

	//메인-새소식제목
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> n_list(Map<String, Object> map) {
		return selectList("news.n_list", map);
	}
	
	//새소식리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> news_list(Map<String, Object> map) {
		return selectList("news.news_list", map);
	}	
	//새소식,검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> news_search(Map<String, Object> map) {
		return selectList("news.news_search", map);
	}
	

	//브랜드1	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> b1_list(Map<String, Object> map) {
		return selectList("news.b1_list", map);
	}

	//브랜드2
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> b2_list(Map<String, Object> map) {
		return selectList("news.b2_list", map);
	}

	//브랜드3
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> b3_list(Map<String, Object> map) {
		return selectList("news.b3_list", map);
	}
	
	
	//통합검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> ts_list(Map<String, Object> map) {
		return selectList("news.ts_list", map);
	}

	//회원관리
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> u_list(Map<String, Object> map) {
		return selectList("news.u_list", map);
	}
	//회원관리,검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> ul_search(Map<String, Object> map) {
		return selectList("news.ul_search", map);
	}
	
	//로그관리
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> log(Map<String, Object> map) {
		return selectList("news.log", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> id(Map<String, Object> map) {
		return selectList("news.logID", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> ip(Map<String, Object> map) {
		return selectList("news.logIP", map);
	}

	//회원관리-권한변경
	public int levelUpdate(Map<String, Object> map) {
		return (int) update("news.levelUpdate", map);
	}

	//회원관리-권한변경-로그insert
	public void logInput(Map<String, Object> map) {
		insert("news.logInput", map);		
	}
	

}
