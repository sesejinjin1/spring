package com.example.test1.dao;

import java.util.HashMap;

public interface SchoolService {
	
	//학생목록
	HashMap<String,Object> stuList(HashMap<String,Object> map);
	
	//학생 상세정보
	HashMap<String,Object> viewStu(HashMap<String,Object> map);
	//정보 수정
	HashMap<String, Object> updateStu(HashMap<String, Object> map);

}
