package com.team.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.team.dao.K_DAO;

@Service("tptpService")
public class K_ServiceImp implements K_Service{

	@Resource(name = "tptpDAO")
	private K_DAO tptpDAO;
	
	@Override
	public List<Map<String, Object>> admOper() throws Exception {
		return tptpDAO.admOper();
	}

}
