package com.tptp.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tptp.dao.K_DAO;

@Service("k_Service")
public class K_ServiceImp implements K_Service {

	@Resource(name = "k_DAO")
	private K_DAO k_DAO;
	
	@Override
	public List<Map<String, Object>> admOper() throws Exception {
		return k_DAO.admOper();
	}

	@Override
	public List<Map<String, Object>> QnAlist(Map<String, Object> map) throws Exception {
		return k_DAO.QnAlist(map);
	}

	@Override
	public List<Map<String, Object>> adSearch(Map<String, Object> map) throws Exception {
		return k_DAO.adSearch(map);
	}
	
	@Override
	public List<Map<String, Object>> qnaSearch(Map<String, Object> map) throws Exception {
		return k_DAO.qnaSearch(map);
	}

	@Override
	public int joinReg(Map<String, Object> map) throws Exception {
		return k_DAO.joinReg(map);
	}

	@Override
	public int checkID(String id) throws Exception {
		return k_DAO.checkID(id);
	}
	
	@Override
	public int checkNick(String nick) throws Exception {
		return k_DAO.checkNick(nick);
	}
	
	@Override
	public int checkPW(Map<String, Object> map) throws Exception {
		return k_DAO.checkPW(map);
	}

	@Override
	public Map<String, Object> login(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) k_DAO.login(map);
	}
//
//	@Override
//	public List<Map<String, Object>> commShow(int b_no) throws Exception {
//		return k_DAO.commShow(b_no);
//	}

	@Override
	public int commUpdate(Map<String, Object> map) throws Exception {
		return k_DAO.commUpdate(map);
	}

	@Override
	public Map<String, Object> mylist(String id) throws Exception {
		return k_DAO.mylist(id);
	}

	@Override
	public int nickUpdate(Map<String, Object> map) throws Exception {
		return k_DAO.nickUpdate(map);
	}

	@Override
	public int pwModi(Map<String, Object> map) throws Exception {
		return (int) k_DAO.pwModi(map);
	}

	@Override
	public int commDelete(int c_no) throws Exception {
		return (int) k_DAO.commDelete(c_no);
	}

	@Override
	public int likeUp(String c_no) throws Exception {
		return k_DAO.likeUp(c_no);
	} 
	


	
}
