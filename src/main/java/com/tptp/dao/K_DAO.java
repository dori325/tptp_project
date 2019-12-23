package com.tptp.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.dao.AbstractDAO;

@Repository("k_DAO")
public class K_DAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> admOper() {
		 return selectList("k.adlist");
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> QnAlist() {
		return selectList("k.Qlist");
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adSearch(Map<String, Object> map) {
		return selectList("k.adSearch", map);
	}

	public int joinReg(Map<String, Object> map) {
		return (int) insert("k.joinReg", map);
	}

	public int checkID(String input) {
		return (int) selectOne("k.checkID", input);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> login(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("k.login", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> commShow(int b_no) {
		return selectList("k.commShow", b_no);
	}

	public int commInsert(Map<String, Object> map) {
		return (int) insert("k.commInsert", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> mylist(String nick) {
		return (List<Map<String, Object>>) selectOne("k.mylist", nick);
	}



}