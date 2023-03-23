package memberDAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import config.MybatisSqlSessionFactory;
import memberVO.MemberVO;

public class MemberDAOImpl implements IMemberDAO {
	
	/*
	 	자신의 객체를 생성해서 리턴하는 메소드
	 	mapper에 접근하여 sql문을 실행  -SqlSession 객체가 필요 -SqlSessionFactory생성
	 */
	private static IMemberDAO dao;
	
	//생성자
	private MemberDAOImpl() {}
	
	//자기자신 객체를 리턴
	public static IMemberDAO getInstance() {
		if(dao == null) dao = new MemberDAOImpl();
		
		return dao;
	}
	
	
	@Override
	public List<MemberVO> getAllMember() {
		// SqlSession 객체가 필요
		
		SqlSession session = null;
		
		List<MemberVO> list;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("member.getAllMember");
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			session.close();
		}
		
		
		return null;
	}
	

}
