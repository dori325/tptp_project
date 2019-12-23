  
package com.tptp.service;

import java.util.List;
import java.util.Map;

public interface K_Service {

	List<Map<String, Object>> admOper() throws Exception;

	List<Map<String, Object>> QnAlist() throws Exception;

	List<Map<String, Object>> adSearch(Map<String, Object> map) throws Exception;

	int joinReg(Map<String, Object> map) throws Exception;

	int checkID(String id) throws Exception;
	
	int checkNick(String nick) throws Exception;
	
	int checkPW(Map<String, Object> map) throws Exception;

 	Map<String, Object>login(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> commShow(int b_no) throws Exception;

	int commInsert(Map<String, Object> map) throws Exception;

	Map<String, Object> mylist(String id) throws Exception;

	int nickUpdate(Map<String, Object> map) throws Exception;

	int pwModi(String pw2) throws Exception;
	

	
}