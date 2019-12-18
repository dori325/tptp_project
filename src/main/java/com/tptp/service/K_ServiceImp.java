package com.tptp.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tptp.dao.K_DAO;

@Service("k_Service")
public class K_ServiceImp implements K_Service{

	@Resource(name = "k_DAO")
	private K_DAO k_DAO;
	
	@Override
	public List<Map<String, Object>> admOper() throws Exception {
		return k_DAO.admOper();
	}

}
