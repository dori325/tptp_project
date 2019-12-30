package com.tptp.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.dao.AbstractDAO;

@Repository("k_DAO")
public class K_DAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> admOper(Map<String, Object> map) {
		 return selectList("k.adlist", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> QnAlist(Map<String, Object> map) {
		return selectList("k.Qlist", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adSearch(Map<String, Object> map) {
		System.out.println(map.get("b_cate1"));
		return selectList("k.adSearch", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaSearch(Map<String, Object> map) {
		System.out.println(map.get("b_cate1"));
		return selectList("k.adSearch", map);
	}

	public int joinReg(Map<String, Object> map) {
		return (int) insert("k.joinReg", map);
	}

	public int checkID(String id) {
		return (int) selectOne("k.checkID", id);
	}
	
	public int checkNick(String nick) {
		return (int) selectOne("k.checkNick", nick);
	}
	
	public int checkPW(Map<String, Object> map) {
		return (int) selectOne("k.checkPW", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> login(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("k.login", map);
	}
//
//	@SuppressWarnings("unchecked")
//	public List<Map<String, Object>> commShow(int b_no) {
//		return selectList("k.commShow", b_no);
//	}

	public int commUpdate(Map<String, Object> map) {
		return (int) insert("k.commInsert", map);
	}
 
	@SuppressWarnings("unchecked")
	public Map<String, Object> mylist(String id) {
		return (Map<String, Object>) selectOne("k.mylist", id);
	}

	public int nickUpdate(Map<String, Object> map) {
		return (int) update("k.nickUpdate", map);
	}

	public int pwModi(Map<String, Object> map) {
		return (int) update("k.pwModi", map);
	}

	public int commDelete(int c_no) {
		return (int) delete("k.commDelete", c_no);
	}

	public int likeUp(String c_no) {
		return (int) update("k.likeUp", c_no);
	}

	public int commModi(Map<String, Object> map) {
		return (int) selectOne("k.commModi", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> Modicomm(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("k.Modicomm", map);
	}

	public int recomm(Map<String, Object> map) {
		return (int) update("k.recomm", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> findID(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("k.findID", map);
	}

	public int checkEmail(Map<String, Object> map) {
		return (int) selectOne("k.checkEmail", map);
	}

	public int commSave(Map<String, Object> map) {
		return (int) update("k.commSave", map);
	}



}
