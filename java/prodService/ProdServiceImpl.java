package prodService;

import java.util.List;

import prodDAO.IProdDAO;
import prodDAO.ProdDAOImpl;
import prodVO.ProdVO;

public class ProdServiceImpl implements IProdService {
	
	private IProdDAO dao;
	private static IProdService service;
	
	private ProdServiceImpl() {
		dao = ProdDAOImpl.getInstance();
	}
	
	public static IProdService getInstance() {
		if(service == null) service = new ProdServiceImpl();
		return service;
	}
	
	@Override
	public List<ProdVO> selectIdName(String lgu) {
		return dao.selectIdName(lgu);
	}

	@Override
	public ProdVO detailProd(String id) {
		return dao.detailProd(id);
	}
	
//	public static void main(String[] args) {
//		List<ProdVO> selectIdName = new ProdServiceImpl().selectIdName("P101");
//		System.out.println(selectIdName);
//	}

}
