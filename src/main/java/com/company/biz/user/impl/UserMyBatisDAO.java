package com.company.biz.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.biz.user.UserVO;

@Repository
public class UserMyBatisDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public void insertUser(UserVO vo) {
		mybatis.insert("UserDAO.insertUser", vo);
	}
	
	public void updateUser(UserVO vo) {
		mybatis.update("UserDAO.updateUser", vo);
	}
	
	public UserVO getUser(UserVO vo) {
		System.out.println("mybatis getUser실행");
		return mybatis.selectOne("UserDAO.getUser", vo);
	}
	
	public UserVO getMember(UserVO vo) {
		System.out.println("mybatis getMember실행");
		return mybatis.selectOne("UserDAO.getMember", vo);
	}
	
	public List<UserVO> getUserList(UserVO vo) {
		System.out.println("mybatis getUserList실행");
		return mybatis.selectList("UserDAO.getUserList", vo);
	}
	
	public UserVO getUserInfo(UserVO vo) {
		System.out.println("mybatis getUserInfo실행");
		return mybatis.selectOne("UserDAO.getUserInfo", vo);
	}
	
	// 회원 탈퇴
	public void deleteUser(UserVO vo) {
		System.out.println("mybatis deleteUser실행");
		mybatis.update("UserDAO.deleteUser", vo);
	}
}
