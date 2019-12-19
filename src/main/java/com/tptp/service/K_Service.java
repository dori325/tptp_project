package com.tptp.service;

import java.util.List;
import java.util.Map;

public interface K_Service {

	List<Map<String, Object>> admOper() throws Exception;

	List<Map<String, Object>> QnAlist() throws Exception;

	List<Map<String, Object>> adSearch(Map<String, Object> map) throws Exception;


}
