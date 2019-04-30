package business;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import pojo.User;
import pojo.UserExample;
import mapper.UserMapper;
import util.MybatisSpringUtil;

public class manageUserBusi {
	
	UserMapper userMapper = MybatisSpringUtil.getApplicationContext().getBean(UserMapper.class);
	


}
