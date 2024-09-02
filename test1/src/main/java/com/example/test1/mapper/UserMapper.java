package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Board;
import com.example.test1.model.User;

@Mapper
public interface UserMapper {
	
	
	//게시글 작성자 정보
	User userInfo(HashMap<String, Object> map);
	
	//회원가입
	void insertUser(HashMap<String, Object> map);
	
	//유저 리스트
	List<User> selectUserList(HashMap<String, Object> map);
	
	List<Board> seelctUserBoard(HashMap<String, Object> map);
	
	void userRemove(HashMap<String, Object> map);
	
	User userLogin(HashMap<String, Object> map);
	
	
}
