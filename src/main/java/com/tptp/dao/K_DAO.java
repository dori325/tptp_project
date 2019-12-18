package com.tptp.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.dao.AbstractDAO;

@Repository("k_DAO")
public class K_DAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> admOper() throws Exception {
		 return selectList("k.list");
	}

}
