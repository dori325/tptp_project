package com.tptp.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.dao.AbstractDAO;
import com.tptp.dto.BoardDTO;
@Repository("tptpDAO")
public class TptpDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<BoardDTO> list() {
		return selectList("tptp.list");
	}

	@SuppressWarnings("unchecked")
	public List<BoardDTO> notice() {
		return selectList("tptp.notice");
	}

}
