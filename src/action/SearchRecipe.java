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

import business.PictureBusi;
import business.RecipeBusi;
import net.sf.json.JSONArray;
import pojo.RPicture;
import pojo.Recipe;

/**
 * Servlet implementation class SearchRecipe
 */
@WebServlet("/SearchRecipe")
public class SearchRecipe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchRecipe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String keyword = request.getParameter("keyword").trim();
		RecipeBusi recbus= new RecipeBusi();
		List<Recipe> recipeList  = recbus.SearchRecipe(keyword);
		
		if(request.getParameter("search") != null) {	
			//只查询名称
	        List<String> NameList = new ArrayList<>();
			for(int i = 0 ; i < recipeList.size() ; i++) {
				NameList.add(recipeList.get(i).getName());
			}
	        //返回json格式
//		        System.out.println(JSONArray.fromObject(listData));
	        response.getWriter().write(JSONArray.fromObject(NameList).toString());
		}else {
			// 查询相关食谱
	        if(keyword == "" || keyword == null) {
	        	request.getRequestDispatcher("InitRecipe").forward(request, response);
	        }else {
	        	int state = 1;	// 状态为1，表示请求搜索页面信息
	            // 分页显示搜索结果
	    		int page = 1;
	    		int pagesize = 2;
	    		int recordcount = 0;
	    		int pagecount = 0;
	    		
	    		if(request.getParameter("page")!=null){
	    			page=Integer.parseInt(request.getParameter("page"));
	    		}
	    		recordcount = recipeList.size();
	    		pagecount = recordcount/pagesize+(recordcount%pagesize==0?0:1);
	    		
	    		List<Recipe> RecipePageList = new ArrayList<Recipe>();
	    		Iterator<Recipe> recipeIterator = recipeList.iterator();
	    		PictureBusi picb = new PictureBusi();
	    		List<List<RPicture>> picturesPage = new ArrayList<List<RPicture>>();
	    		int i = (page-1)*pagesize+1;
	    		int j = 0;
	    		while(i <= page*pagesize && recipeIterator.hasNext()) {
//	   			System.out.println("----------------SearchRecipe.java:" + recipeIterator.next().getName());
	    			recipeIterator.next();	// 只有调用了next（）方法，迭代器才会往下挪一步
					j++;	
//					System.out.println("----------------SearchRecipe.java:i,j=" + i + ",  " + j);
	    			if(i == j) {
	        			RecipePageList.add(recipeList.get(i-1));
	        			picturesPage.add(picb.getPictures(recipeList.get(i-1)));
	        			i++;
	    			}
	    		}
	    		
	    		request.setAttribute("state", state);
	    		request.setAttribute("keyword", keyword);
	    		request.setAttribute("page", page);
	    		request.setAttribute("pagecount",pagecount);
	    		request.setAttribute("recipes_page", RecipePageList);
	    		request.setAttribute("pictures_page", picturesPage);
	    		
	    		request.getRequestDispatcher("recipe.jsp").forward(request, response);
	        }
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
