package lprodDAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import config.MybatisSqlSessionFactory;
import lprodVO.LprodVO;


/*
  SqlSession필요 
  자기 자신의 객체를 생성하여 리턴하는 메소드
 */
public class LprodDAOImpl implements ILprodDAO {

	private static ILprodDAO dao;
	
	//생성자
	
	public static ILprodDAO getDao() {
		if(dao == null) dao = new LprodDAOImpl();
		return dao;
	}
	
	@Override
	public List<LprodVO> selectAll() {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		List<LprodVO> list = null;
		
		try {
			list = session.selectList("lprod.selectAll");
		} finally {
			session.commit();
			session.close();
		}
		return list;
		
	}

}
