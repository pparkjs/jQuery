package memberController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberService.IMemberService;
import memberService.MemberServiceImpl;
import memberVO.ZipVO;

@WebServlet("/ZipSearch.do")
public class ZipSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ZipSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//dong값 가져오기
		
		String dong = request.getParameter("dong");
		
		//service객체 얻기
		 IMemberService service = MemberServiceImpl.getInstance();
		
		//service메소드 호출 - 결과값 받기
		 List<ZipVO> dongList = service.selectByDong(dong);
		
		//결과값을 request에 저장하기
		 request.setAttribute("dongListValue", dongList);
		
		//view 페이지로 이동
		 request.getRequestDispatcher("/view/zipList.jsp").forward(request, response);
	}

}
