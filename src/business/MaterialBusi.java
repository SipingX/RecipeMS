package business;

import mapper.MaterialMapper;
import pojo.Material;
import util.MybatisSpringUtil;

public class MaterialBusi {
	
	MaterialMapper mapper = MybatisSpringUtil.getApplicationContext().getBean(MaterialMapper.class);
	
	public Material getAllInfo(int id) {
		
		Material material = new Material();
		
		material = mapper.selectByPrimaryKey(id);
		
		return material;
	}
}
