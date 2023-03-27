package buyerDAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import buyerVO.BuyerVO;
import config.MybatisSqlSessionFactory;

public class BuyerDAOImpl implements IBuyerDAO {
	
	private static IBuyerDAO dao;
	
	//생성자
	
	public static IBuyerDAO getDao() {
		if(dao == null)	dao = new BuyerDAOImpl();
		return dao;
	}

	@Override
	public List<BuyerVO> selectIdName() {
		SqlSession session = null;
		List<BuyerVO> list = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			
			list = session.selectList("buyer.selectIdName");
			
		} finally {
			session.commit();
			session.close();
		}
		return list;
	}

	@Override
	public BuyerVO selectById(String id) {
		SqlSession session = null;
		BuyerVO vo = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			
			vo = session.selectOne("buyer.selectById", id);
		} finally {
			session.commit();
			session.close();
		}
		return vo;
	}

}
