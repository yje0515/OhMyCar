package com.ohmycar.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ohmycar.domain.UserVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTests {
	
	@Autowired
	private UserMapper mapper;

	@Test
	public void testRead() {
		UserVO vo = mapper.read("admin90");
		log.info(vo);
		log.info(vo.getAuthList());
		/* vo.getAuthList().forEach(authVO -> log.info(authVO)); */
	}
	
	@Test
	public void testGetTime() {
		log.info(mapper.getTime());
	}
	
	@Test
	public void testGetUserList() {
		List<UserVO> list = mapper.getUserList();
		
		list.forEach(user->log.info(user));
	}
	
	@Test
	public void testGetUser() {
		String email="user1@naver.com";
		log.info(mapper.getUser(email));
	}
	
	@Test
	public void testJoinUser() {
		UserVO vo = new UserVO();
		vo.setUserid("user01");
		vo.setUsername("박유저");
		vo.setPassword("1234");
		vo.setEmail("useruser@gmail.com");
		vo.setNickname("저유박");
		
		int result = mapper.joinUser(vo);
		log.info(result);
	}
	
	@Test
	public void testUpdateUser() {
		UserVO vo = mapper.getUser("useruser@gmail.com");
		vo.setPassword("1234");
		vo.setNickname("수정수정");
		
		int result = mapper.updateUser(vo);
		log.info(result);
		
	}
	
	@Test
	public void testDeleteUser() {
		int result = mapper.deleteUser("user6@naver.com");
		log.info(result);
	}
	
	
	
	

}
