package prodController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import prodService.IProdService;
import prodService.ProdServiceImpl;
import prodVO.ProdVO;

/**
 * Servlet implementation class ProdNames
 */
@WebServlet("/ProdNames.do")
public class ProdNames extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProdNames() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//요청시 전송데이터 받기 - lprod_gu받기
		String lgu = request.getParameter("guValue");
		
		//service객체 얻어오기
		IProdService service = ProdServiceImpl.getInstance();
		
		//service메소드 호출 - 결과값 받기
		List<ProdVO> list = service.selectIdName(lgu);
		
		//결과값을 저장
		request.setAttribute("listValue", list);
		
		//view페이지로 이동
		request.getRequestDispatcher("/view/ProdName.jsp").forward(request, response);
		
	}

}
