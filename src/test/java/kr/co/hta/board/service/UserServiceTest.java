package kr.co.hta.board.service;

import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import kr.co.hta.board.exception.SimpleBoardException;
import kr.co.hta.board.vo.User;

@RunWith(SpringJUnit4ClassRunner.class)	//헬퍼클래스, 테스트 단위 작업에 도움을 주는 클래스, 밑에있는 것을 읽어가서 컨테이너를 만든다.
@ContextConfiguration(locations="classpath:/META-INF/spring/test-root-context.xml")
@Transactional
public class UserServiceTest {

	@Autowired
	UserService userService;
	
	@Test
	public void testConfig() {
		assertThat(userService, notNullValue());
	}
	
	@Test
	public void testDetailUser() {
		
	}
	
	//예외가 발생하는 여부를 테스트 하는것
	@Test(expected=SimpleBoardException.class)
	public void testDuplicateUserAdd() {
		User user = new User();
		user.setId("mw");
		user.setPwd("zxcv1234");
		user.setName("박준성");
	}
	
	@Test
	public void testAddNewUser() {
		User user = new User();
		user.setId("moon");
		user.setPwd("zxcv1234");
		user.setName("문재인");
		
		userService.addNewUser(user);
		
		User saveUser = userService.getUserDetail(user.getId());
		assertThat(saveUser, notNullValue());
	}
}
