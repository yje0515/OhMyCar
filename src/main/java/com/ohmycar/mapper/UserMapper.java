package com.ohmycar.mapper;

import java.util.List;

import com.ohmycar.domain.UserVO;

public interface UserMapper {
	public UserVO read(String userid);
	
	public String getTime();
	
	public List<UserVO> getUserList();
	
	public UserVO getUser(String email);  //로그인 select
	
	public int joinUser(UserVO vo);		  //회원가입 insert
	
	public int updateUser(UserVO vo); 	  //회원정보수정 update
	
	public int deleteUser(String email);  //회원탈퇴 delete
}
