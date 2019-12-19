package com.tptp.service;

import java.util.List;
import java.util.Map;

public interface H_Service {

	List<Map<String, Object>> list(Map<String, Object> map) throws Exception;
	
	//추천리스트
	List<Map<String, Object>> k_list(Map<String, Object> map) throws Exception;

	//새소식
	List<Map<String, Object>> n_list(Map<String, Object> map) throws Exception;

	//통합검색
	List<Map<String, Object>> s_list(Map<String, Object> map) throws Exception;

	//사용자리스트
	List<Map<String, Object>> u_list(Map<String, Object> map) throws Exception;
		

}
