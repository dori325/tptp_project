package com.tptp.service;

import java.util.List;
import java.util.Map;

import com.tptp.dto.BoardDTO;

public interface OService {

	List<Map<String, Object>> notice(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> brand1(Map<String, Object> map) throws Exception;


}
