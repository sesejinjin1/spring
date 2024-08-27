package com.example.test1.dao;

import java.util.HashMap;

public interface UserService {
	//중복 체크 및 사용자 상세 정보
	HashMap<String, Object> userInfo(HashMap<String,Object> map);
	
	
	//회원가입
	HashMap<String, Object> join(HashMap<String, Object> map);
}
