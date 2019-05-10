package action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import business.UserBusi;
import pojo.User;

/**
 * Servlet implementation class LoginAct
 */
@WebServlet("/LoginAct")
public class LoginAct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		User user = new User();
		UserBusi userbusi = new UserBusi();
		int rs = 0;
		
		user.setId(request.getParameter("userId").trim());
		user.setPassword(request.getParameter("userPsd"));
		try {
			rs = userbusi.login(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rs == 1) {
			user = userbusi.getAllInfo(user);
			HttpSession session=request.getSession();
			session.setAttribute("user", user);
			
			response.sendRedirect("index.jsp");
		}else if(rs == 0){
			response.sendRedirect("login.jsp");
		}else {
			String html;
			html="该账号用户不存在！请前往<a href='login.jsp'>注册</a>";
			response.getWriter().write(html);
		}
	}

}
