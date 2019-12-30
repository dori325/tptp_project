package com.tptp.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.dao.AbstractDAO;

@Repository("oDAO")
public class ODAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> notice(Map<String, Object> map) {
		System.out.println(map.get("notice"));
		return selectList("o.notice", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> brand1(Map<String, Object> map) {
		return selectList("o.brand1", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> ohSearch(Map<String, Object> map) {
		return selectList("o.ohSearch", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> brand2(Map<String, Object> map) {
		return selectList("o.brand2", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> brand3(Map<String, Object> map) {
		return selectList("o.brand3", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> commdetail(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("o.commdetail", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> detail(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("o.detail", map);
	}

	public int writeInsert(Map<String, Object> map) {
		return (int) insert("o.writeInsert", map);
	}

	public void countUp(int num) {
		update("o.countUp", num);
	}

	public int delete(Map<String, Object> map) {
		return (int) delete("o.delete", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> update(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("o.update", map);
	}

	public int updateInsert(Map<String, Object> map) {
		return (int) update("o.updateInsert", map);
	}

	public void boardLikeUp(int num) {
		update("o.boardLikeUp", num);
	}

}
