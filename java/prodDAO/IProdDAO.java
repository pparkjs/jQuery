package prodDAO;

import java.util.List;

import prodVO.ProdVO;

public interface IProdDAO {
	
	public List<ProdVO> selectIdName(String lgu);
	
	public ProdVO detailProd(String id);
}
