package com.tptp.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tptp.dao.ODAO;
import com.tptp.dto.BoardDTO;

@Service("oService")
public class OServiceImpl implements OService  {
	@Resource(name = "oDAO")
	private ODAO oDAO;
	
	@Override
	public List<Map<String, Object>> notice(Map<String, Object> map) throws Exception {
		return oDAO.notice(map);
	}
	@Override
	public List<Map<String, Object>> brand1(Map<String, Object> map) throws Exception {
		return oDAO.brand1(map);
	}
	
}
