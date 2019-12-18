package first.tptpoh.service;

import java.util.List;
import java.util.Map;

import first.tptpoh.dto.BoardDTO;

public interface TptpService {

	List<BoardDTO> list() throws Exception;

	List<BoardDTO> notice() throws Exception;

}
