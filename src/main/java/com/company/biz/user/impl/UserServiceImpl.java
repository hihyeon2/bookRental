package com.company.biz.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.biz.user.UserService;
import com.company.biz.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserMyBatisDAO userMyBatisDAO;
	
	public void insertUser(UserVO vo) {
		userMyBatisDAO.insertUser(vo);
	}

	public UserVO getUser(UserVO vo) {
		return userMyBatisDAO.getUser(vo);
	}

	@Override
	public void updateUser(UserVO vo) {
		userMyBatisDAO.updateUser(vo);
	}

	@Override
	public UserVO getMember(UserVO vo) {
		return userMyBatisDAO.getMember(vo);
	}
	
	public List<UserVO> getUserList(UserVO vo) {
		return userMyBatisDAO.getUserList(vo);
	}

	public UserVO getUserInfo(UserVO vo) {
		return userMyBatisDAO.getUserInfo(vo);
	}

	@Override
	public void deleteUser(UserVO vo) {
		userMyBatisDAO.deleteUser(vo);
	}


}
