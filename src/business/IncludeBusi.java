package business;

import java.util.ArrayList;
import java.util.List;

import pojo.Include;
import pojo.IncludeExample;
import pojo.Recipe;
import mapper.IncludeMapper;
import util.MybatisSpringUtil;

public class IncludeBusi {
	
	IncludeMapper includeMapper = MybatisSpringUtil.getApplicationContext().getBean(IncludeMapper.class);
	
	public List<Include> getInclude(Recipe recipe){
		
		List<Include> list = new ArrayList<Include>();
		IncludeExample example = new IncludeExample();
		IncludeExample.Criteria criteria = example.createCriteria();
		
		criteria.andRecipeEqualTo(recipe.getId());
		list = includeMapper.selectByExample(example);
		
		return list;
	} 
	
	public int upload(Include include) {
		int r = 0;
		
		r = includeMapper.insertSelective(include);
		if(r == 1){
	        System.out.println("您成功插入了 "+r+" 份食谱Include！");
	    }else{
	        System.out.println("执行插入食谱Include操作失败！！！");
	    }
		
		return r;
	}

}
