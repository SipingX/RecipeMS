package action;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.github.pagehelper.PageInfo;

import business.UserBusi;
import pojo.User;

/**
 * Servlet implementation class manageUserAct
 */
@WebServlet("/ManageUserAct")
public class ManageUserAct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageUserAct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		int page=1;
		int pagesize = 2;
//		int recordcount = 0;
		int pagecount = 0;
		UserBusi userB = new UserBusi();
		User users[] = new User[2];
		
		
		//读取客户端传递过来的要显示的页码
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
/*		try {
			recordcount = mub.getUserCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
//		pagecount = recordcount/pagesize+(recordcount%pagesize==0?0:1);
		
		
		PageInfo<User> pageInfo = new PageInfo<User>();
		
		try {
			pageInfo = userB.getUserList(page, pagesize);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		page = pageInfo.getPageNum();
		pagecount = pageInfo.getPages();
		List<User> userlist = pageInfo.getList();
		Iterator<User> user = userlist.iterator();
		// 将列表转换为数组
		int i = 0;
		while(user.hasNext()) {
			users[i] = user.next();
		}
		// 传递总页数及当前页至user.jsp页面
		request.setAttribute("page", page);
		request.setAttribute("userlist", userlist);
		request.setAttribute("pagecount",pagecount);

		request.getRequestDispatcher("user_manage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
