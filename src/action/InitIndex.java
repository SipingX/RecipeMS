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
 * Servlet implementation class InitIndex
 */
@WebServlet("/InitIndex")
public class InitIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InitIndex() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		RecipeBusi recb = new RecipeBusi();
		PictureBusi picb = new PictureBusi();
		
// ��ȡ�Ƽ�ʳ��
		List<Recipe> recipes_rec = new ArrayList<Recipe>();
		List<List<RPicture>> pictures_rec = new ArrayList<List<RPicture>>();
		
		for(int i=1;i<=5;i++) {
			Recipe recipe = new Recipe();
			recipe = recb.getRecipePageInfoById(i);
			
			recipes_rec.add(recipe);
			pictures_rec.add(picb.getPictures(recipe));
		}
		
// ��ҳʳ��
		int page=1;
		int pagesize = 6;
		int pagecount = 0;
		List<Recipe> recipes_page = new ArrayList<Recipe>();
		List<List<RPicture>> pictures_page = new ArrayList<List<RPicture>>();
		
		//��ȡ�ͻ��˴��ݹ�����Ҫ��ʾ��ҳ��
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		PageInfo<Recipe> pageInfo = new PageInfo<Recipe>();
		
		try {
			pageInfo = recb.getRecipeList(page, pagesize);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		page = pageInfo.getPageNum();
		pagecount = pageInfo.getPages();
		recipes_page = pageInfo.getList();
		
		// ���ֱ����recipes_page.size()��ȡ���С���б���
		Iterator<Recipe> recipes_pageIterator = recipes_page.iterator();
		while(recipes_pageIterator.hasNext()) {
			// while һ��ѭ���У�������ֻ����һ�� next ����������ڶ��� next ��ȡ��һ������
//			System.out.println("------��ҳʳ��:"+recipes_pageIterator.next().toString()); 
			
			pictures_page.add(picb.getPictures(recipes_pageIterator.next()));
		}
		
// ��ȡ����ʳ��
		if(page == 1) {
			List<Recipe> recipes_lat = new ArrayList<Recipe>();
			List<List<RPicture>> pictures_lat = new ArrayList<List<RPicture>>();
			int maxId = recb.getMaxId();
			
			int ii = 0;
			for(int i=0;i<3;) {
				Recipe recipe = new Recipe();
				recipe = recb.getRecipePageInfoById(maxId-ii);	
				if(recipe != null) {
					recipes_lat.add(recipe);
					pictures_lat.add(picb.getPictures(recipe));
					i++;
				}
				ii++;
			}
			
			request.setAttribute("recipes_latest", recipes_lat);
			request.setAttribute("pictures_latest", pictures_lat);
		}
		
		request.setAttribute("recipes_recommended", recipes_rec);
		request.setAttribute("pictures_recommended", pictures_rec);
		
		// ������ҳ������ǰҳ��index.jspҳ��
		request.setAttribute("page", page);
		request.setAttribute("pagecount",pagecount);
		request.setAttribute("recipes_page", recipes_page);
		request.setAttribute("pictures_page", pictures_page);
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
