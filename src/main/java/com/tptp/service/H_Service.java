package com.tptp.service;

import java.util.List;
import java.util.Map;

public interface H_Service {

	//공지사항
	List<Map<String, Object>> list(Map<String, Object> map) throws Exception;	
	//추천리스트
	List<Map<String, Object>> k_list(Map<String, Object> map) throws Exception;
	//새소식
	List<Map<String, Object>> n_list(Map<String, Object> map) throws Exception;
	//새소식,검색
	List<Map<String, Object>> n_search(Map<String, Object> map) throws Exception;
	
	//브랜드1
	List<Map<String, Object>> b1_list(Map<String, Object> map)  throws Exception;	
	//브랜드2
	List<Map<String, Object>> b2_list(Map<String, Object> map) throws Exception;	
	//브랜드3
	List<Map<String, Object>> b3_list(Map<String, Object> map) throws Exception;
	
	
	//통합검색
	List<Map<String, Object>> ts_list(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> ts_l_count(Map<String, Object> map) throws Exception;

	//회원리스트
	List<Map<String, Object>> u_list(Map<String, Object> map) throws Exception;	
	//회원관리 검색
	List<Map<String, Object>> ul_search(Map<String, Object> map) throws Exception;
	
	//로그관리
	List<Map<String, Object>> log(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> id(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> ip(Map<String, Object> map) throws Exception;
	
		

}
