package com.tptp.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.tptp.dao.ODAO;

@Service("oService")
public class OServiceImpl implements OService  {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "oDAO")
	private ODAO oDAO;
	
	@Override
	public List<Map<String, Object>> notice(Map<String, Object> map) throws Exception {
		return oDAO.notice(map);
	}
	@Override
	public List<Map<String, Object>> brand1(Map<String, Object> map) throws Exception {
		return oDAO.brand1(map);
	}
	@Override
	public List<Map<String, Object>> ohSearch(Map<String, Object> map) throws Exception {
		return oDAO.ohSearch(map);
	}
	@Override
	public List<Map<String, Object>> brand2(Map<String, Object> map) throws Exception {
		return oDAO.brand2(map);
	}
	@Override
	public List<Map<String, Object>> brand3(Map<String, Object> map) throws Exception {
		return oDAO.brand3(map);
	}
	@Override
	public List<Map<String, Object>> commdetail(Map<String, Object> map) throws Exception {
		return oDAO.commdetail(map);
	}
	@Override
	public Map<String, Object> detail(Map<String, Object> map) throws Exception {
		return oDAO.detail(map);
	}
	@Override
	public int writeInsert(Map<String, Object> map) throws Exception {
		return oDAO.writeInsert(map);
	}
	@Override
	public void countUp(int num) throws Exception {
		oDAO.countUp(num);
	}
	@Override
	public int delete(Map<String, Object> map) throws Exception {
		return oDAO.delete(map);
	}
	@Override
	public Map<String, Object> update(Map<String, Object> map) throws Exception {
		return oDAO.update(map);
	}
	@Override
	public int updateInsert(Map<String, Object> map) throws Exception {
		return oDAO.updateInsert(map);
	}
}
