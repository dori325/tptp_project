package com.tptp.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tptp.dao.ODAO;
import com.tptp.dto.BoardDTO;

@Service("oService")
public class OServiceImpl implements OService  {
	@Resource(name = "oDAO")
	private ODAO oDAO;
	
	@Override
	public List<BoardDTO> list() throws Exception {
		return oDAO.list();
	}
	
	@Override
	public List<BoardDTO> notice() throws Exception {
		// TODO Auto-generated method stub
		return oDAO.notice();
	}
}
