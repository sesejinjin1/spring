package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.School;

@Mapper
public interface SchoolMapper {
	
	List<School> stuList(HashMap<String, Object> map);
	
	
	School viewStu(HashMap<String, Object> map);
	
	void updateStu(HashMap<String, Object> map);
}
