package com.tptp.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tptp.dao.TptpDAO;
import com.tptp.dto.BoardDTO;

@Service("tptpService")
public class TptpServiceImpl implements TptpService  {
	@Resource(name = "tptpDAO")
	private TptpDAO tptpDAO;
	
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
