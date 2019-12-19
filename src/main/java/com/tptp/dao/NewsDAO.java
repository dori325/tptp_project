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

	
	

}
