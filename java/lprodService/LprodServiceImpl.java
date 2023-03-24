package lprodService;

import java.util.List;

import lprodDAO.ILprodDAO;
import lprodDAO.LprodDAOImpl;
import lprodVO.LprodVO;

/*
 	DAO의 메소드를 호출하여 실행 - DAO객체가 필요
 */
public class LprodServiceImpl implements ILprodService {
	
	private ILprodDAO dao;
	private static ILprodService service;
	
	//생성자
	private LprodServiceImpl() {
		dao = LprodDAOImpl.getDao();
	}
	
	public static ILprodService getService() {
		if(service == null) service = new LprodServiceImpl();
		return service;
	}
	
	@Override
	public List<LprodVO> selectAll() {
		return dao.selectAll();
	}

}
