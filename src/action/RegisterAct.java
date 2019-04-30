package action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import business.UserBusi;
import pojo.User;

/**
 * Servlet implementation class RegisterAct
 */
@WebServlet("/RegisterAct")
public class RegisterAct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterAct() {
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
		String html; 
//		String vali = request.getParameter("vali");
		
/*		if(vali.equals(request.getSession().getAttribute("valiNum"))){
			System.out.println("号码验证通过！");*/
			
			user.setId(request.getParameter("userId_2").trim());
			user.setPassword(request.getParameter("userPsd").trim());
			System.out.println("注册用户ID："+user.getId()+"  密码："+user.getPassword());
			
			try {
				rs = userbusi.register(user);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(rs == 1) {
				response.sendRedirect("login.jsp");
			}else {
				html="注册失败！<br><a href='login.jsp'>重新注册</a>";
				response.getWriter().write(html);
			}
/*		}else{
			html="号码验证失败！<br><a href='login.jsp'>返回注册</a>";
			response.getWriter().write(html);
		}*/
	}

}
