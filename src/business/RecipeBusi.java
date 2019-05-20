package business;

import java.util.ArrayList;
import java.util.List;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import mapper.RecipeMapper;
import pojo.Recipe;
import pojo.RecipeExample;
import util.MybatisSpringUtil;

public class RecipeBusi {
	
	RecipeMapper mapper = MybatisSpringUtil.getApplicationContext().getBean(RecipeMapper.class);
	
	public Recipe getRecipePageInfoById(Integer id) {
		
		Recipe recipe = mapper.selectByPrimaryKey(id);
		
		return recipe;
	}
	
	public int getMaxId() {
		
		int id = 0;
		
		id = mapper.selectRecipeMaxId();
		
		return id;
	}
	
	public int InitiateOneRecipe() {
		
		int r = 0;
		
		Recipe recipe = new Recipe();
		recipe.setAuthor("init");
		recipe.setName("init");
		recipe.setCategory("init");
		recipe.setComplexity("init");
		recipe.setMinute(0);
		recipe.setTasty("init");
		recipe.setMethod("init");

		r = mapper.insertSelective(recipe);
		
		if(r > 0){
	        System.out.println("您成功初始化了 " + r + "份食谱！食谱id："+recipe.getId());
	        return recipe.getId();
	    }else{
	        System.out.println("执行初始化食谱操作失败！！！");
	        return 0;
	    }
		
	}
	
	public int upload(Recipe recipe) {
		
		int r = 0;
		r = mapper.updateByPrimaryKeySelective(recipe);
		if(r == 1){
	        System.out.println("您成功更新了 "+r+" 份食谱！");
	        System.out.println(recipe.toString());
	    }else{
	        System.out.println("执行更新食谱操作失败！！！");
	    }
		
		return r;
	}
	
	public boolean delete(Recipe recipe) {
		
		boolean bool = false;
		int r = 0;
		r = mapper.deleteByPrimaryKey(recipe.getId());
		if(r == 1){
	        System.out.println("您成功删除了 "+r+" 份食谱！");
	    }else{
	        System.out.println("执行删除食谱操作失败！！！");
	    }
		
		if(r == 1) {
			bool = true ;
		}
		
		return bool;
	}
	
	public PageInfo<Recipe> getRecipeList(int page,int pagesize) throws Exception{
		
		PageHelper.startPage(page, pagesize);
		
		RecipeExample recipeExample = new RecipeExample();
		List<Recipe> recipes = mapper.selectByExample(recipeExample);
		
		PageInfo<Recipe> pageInfo = new PageInfo<Recipe>(recipes);
		
		return pageInfo;
	}
	
	public List<Recipe> SearchRecipe(String keyword) {
		
		List<Recipe> RecipeList = new ArrayList<>();
		RecipeExample example = new RecipeExample();
		
		RecipeExample.Criteria criteria = example.createCriteria();
		keyword = "%" + keyword + "%";
		criteria.andNameLike(keyword);
		RecipeList = mapper.selectByExample(example);
		
		return RecipeList;
	}

}
