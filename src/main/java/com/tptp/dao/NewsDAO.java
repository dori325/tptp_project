package com.tptp.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.dao.AbstractDAO;

@Repository("newsDAO")
public class NewsDAO  extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> list(Map<String, Object> map) {
		return selectList("news.list", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> k_list(Map<String, Object> map) {
		return selectList("news.k_list", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> n_list(Map<String, Object> map) {
		return selectList("news.n_list", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> s_list(Map<String, Object> map) {
		return selectList("news.s_list", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> u_list(Map<String, Object> map) {
		return selectList("news.u_list", map);
	}
	
	

}
