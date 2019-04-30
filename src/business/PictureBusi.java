package business;

import java.util.ArrayList;
import java.util.List;

import mapper.RPictureMapper;
import pojo.RPicture;
import pojo.RPictureExample;
import pojo.Recipe;
import util.MybatisSpringUtil;

public class PictureBusi {
	
	RPictureMapper mapper = MybatisSpringUtil.getApplicationContext().getBean(RPictureMapper.class);
	
	public List<RPicture> getPictures(Recipe recipe){
		
		List<RPicture> list = new ArrayList<RPicture>();
		RPictureExample example = new RPictureExample();
		RPictureExample.Criteria criteria = example.createCriteria();
		
		criteria.andRecipeEqualTo(recipe.getId());
		
		list = mapper.selectByExample(example);
		
		return list;
	} 
	
	public int upload(RPicture picture) {
		int r = 0;
		
		r = mapper.insertSelective(picture);
		if(r == 1){
	        System.out.println("您成功插入了 "+r+" 张图片！");
	    }else{
	        System.out.println("执行插入图片操作失败！！！");
	    }
		
		return r;
	}

}
