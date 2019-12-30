package com.tptp.service;

import java.util.List;
import java.util.Map;

public interface K_Service {

	List<Map<String, Object>> admOper(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> QnAlist(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> adSearch(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> qnaSearch(Map<String, Object> map) throws Exception;

	int joinReg(Map<String, Object> map) throws Exception;

	int checkID(String id) throws Exception;
	
	int checkNick(String nick) throws Exception;
	
	int checkPW(Map<String, Object> map) throws Exception;

 	Map<String, Object>login(Map<String, Object> map) throws Exception;

 	int commModi(Map<String, Object> map);

	int commUpdate(Map<String, Object> map) throws Exception;

	Map<String, Object> mylist(String id) throws Exception;

	int nickUpdate(Map<String, Object> map) throws Exception;

	int pwModi(Map<String, Object> map) throws Exception;

	int commDelete(int c_no) throws Exception;

	int likeUp(String cno) throws Exception;

	Map<String, Object> Modicomm(Map<String, Object> map) throws Exception;

	int recomm(Map<String, Object> map) throws Exception;

	Map<String, Object> findID(Map<String, Object> map) throws Exception;

	int checkEmail(Map<String, Object> map) throws Exception;

	int commSave(Map<String, Object> map) throws Exception;

	

	
}
