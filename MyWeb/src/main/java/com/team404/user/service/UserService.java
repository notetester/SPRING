package com.team404.user.service;

import java.util.List;

import com.team404.command.UserVO;

public interface UserService {

	public int idCheck(UserVO vo); //아이디중복확인
	public int join(UserVO vo); //회원가입
	public int login(UserVO vo); //로그인
	public UserVO userInfo(String userId); //회원정보
}
