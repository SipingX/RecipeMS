package test;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import mapper.IncludeMapper;
import mapper.RecipeMapper;
import pojo.Include;
import pojo.IncludeExample;
import pojo.Recipe;
import util.MybatisSpringUtil;

public class RTest {
	
	@Test
	public void test() {
		
		RecipeMapper Mapper = MybatisSpringUtil.getApplicationContext().getBean(RecipeMapper.class);
		
		Recipe recipe = new Recipe();
		recipe.setAuthor("init");
		recipe.setName("init");
		recipe.setCategory("init");
		recipe.setComplexity("init");
		recipe.setMinute(0);
		recipe.setTasty("init");
		recipe.setMethod("init");
		
		System.out.println(recipe.toString());
			
	}

}
