package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.School;

@Mapper
public interface SchoolMapper {
	
	//리스트
	List<School> stuList(HashMap<String, Object> map);
	
	//상세정보
	School viewStu(HashMap<String, Object> map);
	
	//업데이트 (고쳐야함)
	void updateStu(HashMap<String, Object> map);
	
	//리스트 카운트
	int stuListCnt(HashMap<String, Object> map);
	
}
