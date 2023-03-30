package memberController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberService.IMemberService;
import memberService.MemberServiceImpl;

@WebServlet("/IdCheck.do")
public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IdCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//요청시 전송데이터 받기 - id
		String userId = request.getParameter("id");
		//service객체 얻기
		IMemberService service = MemberServiceImpl.getInstance();
		
		//service메소드 호출 - 결과값 받기
		String res = service.idCheck(userId);
		//a001입력시 a001을 리턴
		//korea 입력시 null을 리턴
		
		//결과값을 request에 저장
		request.setAttribute("resValue", res);
		
		//view페이지로 이동
		request.getRequestDispatcher("/view/idCheck.jsp").forward(request, response);
	}

}
