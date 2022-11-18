package com.company.biz.user;

import java.util.List;

public interface UserService {

	UserVO getUser(UserVO vo);
	
	UserVO getMember(UserVO vo);

	void insertUser(UserVO vo);
	
	void updateUser(UserVO vo);
	
	void deleteUser(UserVO vo);
	
	UserVO getUserInfo(UserVO vo);	
	
	List<UserVO> getUserList(UserVO vo);

}