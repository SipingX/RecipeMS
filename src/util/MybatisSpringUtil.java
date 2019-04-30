package util;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MybatisSpringUtil {
	private static ApplicationContext applicationContext = null;
	static {
		try {
			applicationContext = 
					new ClassPathXmlApplicationContext("applicationContext.xml");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public static ApplicationContext getApplicationContext() {
		return applicationContext;
	}
}