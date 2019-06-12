package test;

import org.junit.Test;

public class RTest {
	
	@Test
	public void test() {

	int page = 1;
		if(!(page >= 1)){
			page = 1;
		}
		System.out.println("page:" + page);
	}

}
