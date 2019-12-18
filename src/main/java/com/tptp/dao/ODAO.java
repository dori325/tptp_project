package com.tptp.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.dao.AbstractDAO;
import com.tptp.dto.BoardDTO;
@Repository("oDAO")
public class ODAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<BoardDTO> list() {
		return selectList("o.list");
	}

	@SuppressWarnings("unchecked")
	public List<BoardDTO> notice() {
		return selectList("o.notice");
	}

}
