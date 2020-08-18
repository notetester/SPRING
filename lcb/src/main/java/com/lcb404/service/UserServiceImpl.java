package com.lcb404.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcb404.command.UserVO;
import com.lcb404.mapper.UserMapper;
@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public int IdCheck(String MEMBERS_ID) {
		// TODO Auto-generated method stub
		return userMapper.IdCheck(MEMBERS_ID);
	}

	@Override
	public int join(UserVO vo) {
		// TODO Auto-generated method stub
		return userMapper.join(vo);
	}

	@Override
	public int login(UserVO vo) {
		// TODO Auto-generated method stub
		return userMapper.login(vo);
	}

	@Override
	public UserVO userInfo(String MEMBERS_ID) {
		// TODO Auto-generated method stub
		return userMapper.userInfo(MEMBERS_ID);
	}

	

	@Override
	public int delete(String MEMBERS_ID) {
		// TODO Auto-generated method stub
		return userMapper.delete(MEMBERS_ID);
	}

	@Override
	public int Update(UserVO vo) {
		// TODO Auto-generated method stub
		return userMapper.Update(vo);
	}

	@Override
	public int Kakaojoin(UserVO vo) {
		// TODO Auto-generated method stub
		return userMapper.Kakaojoin(vo);
	}

	@Override
	public int statusCheck(String MEMBERS_ID) {
		// TODO Auto-generated method stub
		return userMapper.statusCheck(MEMBERS_ID);
	}

	@Override
	public int getGrade(String MEMBERS_ID) {
		// TODO Auto-generated method stub
		return userMapper.getGrade(MEMBERS_ID);
	}

}
