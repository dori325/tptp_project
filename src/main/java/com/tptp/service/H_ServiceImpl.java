package com.tptp.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.tptp.dao.NewsDAO;

@Service("h_Service")
public class H_ServiceImpl implements H_Service {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "newsDAO")
	private NewsDAO newsDAO;

	@Override
	public List<Map<String, Object>> list(Map<String, Object> map) throws Exception {
		return newsDAO.list(map);
	}

	@Override
	public List<Map<String, Object>> k_list(Map<String, Object> map) throws Exception {
		return newsDAO.k_list(map);
	}

	@Override
	public List<Map<String, Object>> n_list(Map<String, Object> map) throws Exception {
		return newsDAO.n_list(map);
	}	
	
	
	
}
//컨트롤러 - 서비스 - 서비스impl - dao ->sql.xml
