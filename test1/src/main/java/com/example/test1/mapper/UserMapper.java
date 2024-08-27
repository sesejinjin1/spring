package com.example.test1.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.User;

@Mapper
public interface UserMapper {
	
	
	//게시글 작성자 정보
	User userInfo(HashMap<String, Object> map);
	
	void join(HashMap<String, Object> map);
}
