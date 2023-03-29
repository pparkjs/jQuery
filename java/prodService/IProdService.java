package prodService;

import java.util.List;

import prodVO.ProdVO;

public interface IProdService {
	
	public List<ProdVO> selectIdName(String lgu);
	
	public ProdVO detailProd(String id);
}
