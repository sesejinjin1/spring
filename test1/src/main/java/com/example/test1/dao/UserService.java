package com.example.test1.dao;

import java.util.HashMap;

public interface UserService {
	//중복 체크 및 사용자 상세 정보
	HashMap<String, Object> userInfo(HashMap<String,Object> map);
	
	
	//회원가입
	HashMap<String, Object> addUser(HashMap<String, Object> map);
	
	//회원 목록
	HashMap<String, Object> searchUserList(HashMap<String, Object> map);
	
	//게시판 목록
	HashMap<String, Object> seelctUserBoard(HashMap<String, Object> map);
	
	//회원 삭제
	HashMap<String, Object> userRemove(HashMap<String, Object> map);
}
