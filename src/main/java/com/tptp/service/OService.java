package com.tptp.service;

import java.util.List;
import java.util.Map;

public interface OService {
	
	List<Map<String, Object>> notice(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> brand1(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> ohSearch(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> brand2(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> brand3(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> commdetail(Map<String, Object> map) throws Exception;

	Map<String, Object> detail(Map<String, Object> map) throws Exception;

	int writeInsert(Map<String, Object> map) throws Exception;

	void countUp(int num) throws Exception;

	int delete(Map<String, Object> map) throws Exception;

	Map<String, Object> update(Map<String, Object> map) throws Exception;

	int updateInsert(Map<String, Object> map) throws Exception;

}
