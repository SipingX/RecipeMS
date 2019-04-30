package action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import business.IncludeBusi;
import business.PictureBusi;
import business.RecipeBusi;
import business.StepBusi;
import pojo.Include;
import pojo.RPicture;
import pojo.Recipe;
import pojo.Step;
import pojo.User;

/**
 * Servlet implementation class uploadRecipe
 */
@WebServlet("/uploadRecipe")
public class uploadRecipe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uploadRecipe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());

		int result = 0;
		
		Recipe recipe = new Recipe();
		RecipeBusi recbus = new RecipeBusi();
		recipe.setId(recbus.InitiateOneRecipe());
		if(recipe.getId() == 0) {
			System.out.println("上传食谱初始化失败!");
			String html = "上传食谱初始化失败！<br><a href='recipe_submit.jsp'>重新上传</a><br>";
			response.getWriter().write(html);
			return;
		}
		
		List<Step> steps = new ArrayList<Step>();
		
		List<String> materials = new ArrayList<String>();
		List<String> Mquantities = new ArrayList<String>();
		
		List<String> picUrls = new ArrayList<String>();
		
		//上传图片
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if(isMultipart) {//判断前台的form是否有multipart属性
//			FileItemFactory factory = new DiskFileItemFactory();
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			//通过parseRequest解析form中的所有请求字段，并保存到items集合中
			try {
				//设置上传文件时用到的临时文件的大小DiskFileItemFactory
				factory.setSizeThreshold(10485760);//设置临时文件缓冲区大小为10MB(单位为字节B)
				factory.setRepository(new File("D:\\Course\\Java\\workplace\\Recipe\\uploadtemp"));//设置临时文件的目录
				
				//控制上传单个文件的大小  此处为100MB
				upload.setSizeMax(104857600);
				
				List<FileItem> items = upload.parseRequest(request);
				//遍历items中的数据(item=XXX)
				Iterator<FileItem> iter = items.iterator();
				int picNo = 0;
				while(iter.hasNext()) {
					FileItem item = iter.next();
					String itemName = item.getFieldName();
					//判断前台字段，是普通form表单字段，还是文件字段
					
					//request.getParameter()   --iter.getString
					if(item.isFormField()) {//普通form表单字段上传
						if(itemName.equals("recipe_name")) {
							recipe.setName(item.getString("utf-8"));
						}else if(itemName.equals("category")) {
							recipe.setCategory(item.getString("utf-8"));
						}else if(itemName.equals("complexity")) {
							recipe.setComplexity(item.getString("utf-8"));
						}else if(itemName.equals("minute")) {
							recipe.setMinute(Integer.parseInt(item.getString("utf-8")));
						}else if(itemName.equals("tasty")) {
							recipe.setTasty(item.getString("utf-8"));
						}else if(itemName.equals("method")) {
							recipe.setMethod(item.getString("utf-8"));
						}else if(itemName.equals("summary")) {
							recipe.setDescription(item.getString("utf-8"));
						}else if(itemName.equals("directions")) {
							recipe.setAddress(item.getString("utf-8"));
						}else if(itemName.equals("step")) {
							Step step = new Step();
							step.setDescription(item.getString("utf-8"));
							steps.add(step);
						}else if(itemName.equals("ingredient_name")) {
							String ingredient_name = item.getString("utf-8");
							materials.add(ingredient_name);
						}else if(itemName.equals("ingredient_note")) {
							String ingredient_note = item.getString("utf-8");
							Mquantities.add(ingredient_note);
						}else {
							System.out.println("其它字段");
						}
					}else {
						if(itemName.equals("picture")) {
							//file 文件上传
							//getFieldName是获取普通表单字段name值
							//getName是获取文件名
							String fileName = item.getName();
							
							//控制文件类型
							String ext = fileName.substring(fileName.lastIndexOf(".")+1);
							if(!ext.equals("jpg")) {
								System.out.println("图片类型有误！图片只能是jpg");
								if(recbus.delete(recipe)) {
									System.out.println("初始食谱已被删除！");
								}else {
									System.out.println("初始食谱删除失败！");
								}
								String html = "文件（此处为图片）上传失败！<br>图片类型有误！图片只能是jpg！<br><a href='recipe_submit.jsp'>重新上传</a><br>";
								response.getWriter().write(html);
								return ;
							}
							
							if(fileName.contains("\\")) {
		                        //如果包含则截取字符串
								fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
		                    }
							System.out.println("原始文件名："+fileName);
							//获取文件内容并上传
							//定义文件路径：指定上传的位置（服务器路径），这里放到workplace下本工程的一个文件夹
							String path = "D:\\Course\\Java\\workplace\\RecipeMS\\WebContent\\upload\\recipe\\picture";
							System.out.println("文件保存路径："+path);
							//获取不包含路径的文件名
							ext = fileName.substring(fileName.lastIndexOf("."));
							fileName = "recipePhoto-" + recipe.getId() + "-" + picNo+ext;
							picNo++;
							
							picUrls.add(fileName);
							
							File file = new File(path,fileName);
							item.write(file);//上传
							System.out.println(fileName+"上传成功！");
						}
					}
				}
			} catch(FileUploadBase.SizeLimitExceededException e) {
				System.out.println("上传文件大小超过限制！最大100MB");
				if(recbus.delete(recipe)) {
					System.out.println("初始食谱已被删除！");
				}else {
					System.out.println("初始食谱删除失败！");
				}
				String html = "文件（此处为图片）上传失败！<br>上传文件大小超过限制！最大100MB!<br><a href='recipe_submit.jsp'>重新上传</a><br>";
				response.getWriter().write(html);
				return;
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			System.out.println("前台的form无multipart属性！");
			System.out.println("食谱上传失败！");
			if(recbus.delete(recipe)) {
				System.out.println("初始食谱已被删除！");
			}else {
				System.out.println("初始食谱删除失败！");
			}
			String html = "食谱上传失败！<br>前台的form无multipart属性！<br><a href='recipe_submit.jsp'>重新上传</a><br>";
			response.getWriter().write(html);
			return ;
		}
		
		StepBusi stebus = new StepBusi();
		IncludeBusi incbus = new IncludeBusi();
		PictureBusi picbus = new PictureBusi();
		int i = 0;
		
		//上传食谱基本信息
		
		recipe.setAuthor(((User)request.getSession().getAttribute("user")).getId());
		System.out.println("作者id：" + ((User)request.getSession().getAttribute("user")).getId());
		
		result = recbus.upload(recipe);
		if(result == 1) {
			System.out.println("食谱基本信息上传成功！");
		}else {
			if(recbus.delete(recipe)) {
				System.out.println("初始食谱已被删除！");
			}else {
				System.out.println("初始食谱删除失败！");
			}
			String html = "食谱基本信息上传失败！<br><a href='recipe_submit.jsp'>重新上传</a><br>";
			response.getWriter().write(html);
			return ;
		}
		
		//上传步骤
		Iterator<Step> listStep = steps.iterator();
		Step step = new Step();
		i = 0;
		while(listStep.hasNext()) {
			result = 0;
			step = listStep.next();
			step.setRecipe(recipe.getId());
			step.setSequence(i+1);
			i++;
			result = stebus.upload(step);
			if(result == 1) {
				System.out.println("步骤  "+i+"  上传成功！");
			}else {
				if(recbus.delete(recipe)) {
					System.out.println("初始食谱已被删除！");
				}else {
					System.out.println("初始食谱删除失败！");
				}
				String html = "步骤上传失败！<br><a href='recipe_submit.jsp'>重新上传</a><br>";
				response.getWriter().write(html);
				return ;
			}
		}
		
		//上传食材
		Iterator<String> listMate = materials.iterator();
		Iterator<String> Mquantity = Mquantities.iterator();
		Include include = new Include();
		while(listMate.hasNext()) {
			result = 0;
			include.setRecipe(recipe.getId());
			include.setMaterial(Integer.parseInt(listMate.next()));
			include.setQuantity(Mquantity.next());
			result = incbus.upload(include);
			if(result == 1) {
				System.out.println("食材  "+include.getMaterial()+"  上传成功！");
			}else {
				if(recbus.delete(recipe)) {
					System.out.println("初始食谱已被删除！");
				}else {
					System.out.println("初始食谱删除失败！");
				}
				String html = "食材上传失败！<br><a href='recipe_submit.jsp'>重新上传</a><br>";
				response.getWriter().write(html);
				return ;
			}
		}
		
		//上传图片
		Iterator<String> listPic = picUrls.iterator();
		RPicture picture = new RPicture();
		i = 0;
		while(listPic.hasNext()) {
			result = 0;
			picture.setRecipe(recipe.getId());
			picture.setNumber(i);
			i++;
			picture.setUrl("upload/recipe/picture/"+listPic.next());
			result = picbus.upload(picture);
			if(result == 1) {
				System.out.println("图片  "+picture.getNumber()+"  录入数据库成功！");
			}else {
				if(recbus.delete(recipe)) {
					System.out.println("初始食谱已被删除！");
				}else {
					System.out.println("初始食谱删除失败！");
				}
				String html = "图片录入数据库失败！<br><a href='recipe_submit.jsp'>重新上传</a><br>";
				response.getWriter().write(html);
				return;
			}
		}
		
		String html = "您的食谱上传成功！请耐心等待审核...<br><a href='recipe_submit.jsp'>返回上传页面</a><br>";
		response.getWriter().write(html);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
