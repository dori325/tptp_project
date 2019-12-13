package first.tptpoh.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;
import first.tptpoh.dto.BoardDTO;
@Repository("tptpDAO")
public class TptpDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<BoardDTO> list() {
		return selectList("tptp.list");
	}

}
