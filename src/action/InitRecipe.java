package action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.github.pagehelper.PageInfo;

import business.PictureBusi;
import business.RecipeBusi;
import pojo.RPicture;
import pojo.Recipe;

/**
 * Servlet implementation class InitRecipe
 */
@WebServlet("/InitRecipe")
public class InitRecipe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InitRecipe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		int state = 0;	// 状态为0，表示请求食谱初始页面（相对于请求食谱搜索页面信息）
		
		RecipeBusi recb = new RecipeBusi();
		PictureBusi picb = new PictureBusi();
// 分页食谱
		int page = 1;
		int pagesize = 8;
		int pagecount = 0;
		List<Recipe> recipes_page = new ArrayList<Recipe>();
		List<List<RPicture>> pictures_page = new ArrayList<List<RPicture>>();
		
		//读取客户端传递过来的要显示的页码
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		PageInfo<Recipe> pageInfo = new PageInfo<Recipe>();
		
		try {
			pageInfo = recb.getRecipeList(page, pagesize);
		} catch (Exception e) {
			e.printStackTrace();
		}

		page = pageInfo.getPageNum();
		pagecount = pageInfo.getPages();
		recipes_page = pageInfo.getList();
		
		Iterator<Recipe> recipes_pageIterator = recipes_page.iterator();
		while(recipes_pageIterator.hasNext()) {
			pictures_page.add(picb.getPictures(recipes_pageIterator.next()));
		}
		
		request.setAttribute("state", state);
		request.setAttribute("page", page);
		request.setAttribute("pagecount",pagecount);
		request.setAttribute("recipes_page", recipes_page);
		request.setAttribute("pictures_page", pictures_page);
		
		request.getRequestDispatcher("recipe.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
