package memberService;

import java.util.List;

import memberDAO.IMemberDAO;
import memberDAO.MemberDAOImpl;
import memberVO.MemberVO;


/*
 	DAO객체의 메소드를 호출 실행 - DAO객첵라 필요
 	자기 자신의 객체를 생성하여 리턴
 */
public class MemberServiceImpl implements IMemberService {
	
	private IMemberDAO dao;
	private static IMemberService service;
	
	//생성자
	private MemberServiceImpl() {
		dao = MemberDAOImpl.getInstance();
	}
	
	public static IMemberService getInstance() {
		if(service == null) service = new MemberServiceImpl();
		
		return service;
	}
	
	@Override
	public List<MemberVO> getAllMember() {
		return dao.getAllMember();
	}

}
