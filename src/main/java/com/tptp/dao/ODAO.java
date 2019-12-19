package com.tptp.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.dao.AbstractDAO;
import com.tptp.dto.BoardDTO;
@Repository("oDAO")
public class ODAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> notice(Map<String, Object> map) {
		return selectList("o.notice");
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> brand1(Map<String, Object> map) {
		return selectList("o.brand1");
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> brand2(Map<String, Object> map) {
		return selectList("o.brand2");
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> brand3(Map<String, Object> map) {
		return selectList("o.brand3");
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> brand4(Map<String, Object> map) {
		return selectList("o.brand4");
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> detail(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("o.detail", map);
	}

}
