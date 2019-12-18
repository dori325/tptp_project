package com.tptp.service;

import java.util.List;
import java.util.Map;

import com.tptp.dto.BoardDTO;

public interface OService {

	List<BoardDTO> list() throws Exception;

	List<BoardDTO> notice() throws Exception;

}
