package prodController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import prodService.IProdService;
import prodService.ProdServiceImpl;
import prodVO.ProdVO;

/**
 * Servlet implementation class ProdDetail
 */
@WebServlet("/ProdDetail.do")
public class ProdDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProdDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		IProdService service = ProdServiceImpl.getInstance();
		
		ProdVO vo = service.detailProd(id);
		
		request.setAttribute("voValue", vo);
		
		request.getRequestDispatcher("/view/ProdDetail.jsp").forward(request, response);
		
	}

}
