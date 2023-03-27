package buyerService;

import java.util.List;

import buyerDAO.BuyerDAOImpl;
import buyerDAO.IBuyerDAO;
import buyerVO.BuyerVO;

public class BuyerServiceImpl implements IBuyerService {
	
	private IBuyerDAO dao;
	private static IBuyerService service;
	
	private BuyerServiceImpl() {
		dao = BuyerDAOImpl.getDao();
	}
	
	public static IBuyerService getService() {
		if(service == null) service = new BuyerServiceImpl();
		return service;
	}
	

	@Override
	public List<BuyerVO> selectIdName() {
		return dao.selectIdName();
	}

	@Override
	public BuyerVO selectById(String id) {
		return dao.selectById(id);
	}

}
