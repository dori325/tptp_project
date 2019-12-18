package com.tptp.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tptp.dao.ODAO;
import com.tptp.dto.BoardDTO;

@Service("tptpService")
public class OServiceImpl implements OService  {
	@Resource(name = "tptpDAO")
	private ODAO tptpDAO;
	
	@Override
	public List<BoardDTO> list() throws Exception {
		return tptpDAO.list();
	}
	
	@Override
	public List<BoardDTO> notice() throws Exception {
		// TODO Auto-generated method stub
		return tptpDAO.notice();
	}
}
