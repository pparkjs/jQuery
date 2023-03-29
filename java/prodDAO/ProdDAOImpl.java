package prodDAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import config.MybatisSqlSessionFactory;
import prodVO.ProdVO;

public class ProdDAOImpl implements IProdDAO {
	
	private static IProdDAO dao;
	
	//생성자
	
	public static IProdDAO getInstance() {
		if(dao == null) dao = new ProdDAOImpl();
		return dao;
	}
	
	@Override
	public List<ProdVO> selectIdName(String lgu) {
		SqlSession session = null;
		List<ProdVO> list = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("prod.selectIdName", lgu);
			
		} finally {
			session.close();
		}
		
		
		return list;
	}

	@Override
	public ProdVO detailProd(String id) {
		SqlSession session = null;
		ProdVO vo = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			
			vo = session.selectOne("prod.detailProd", id);
			
		} finally {
			session.close();
		}
		
		
		return vo;
	}



}
