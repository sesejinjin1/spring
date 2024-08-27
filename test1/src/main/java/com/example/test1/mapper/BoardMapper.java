package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Board;

@Mapper
public interface BoardMapper {
	List<Board> selectBoardList(HashMap<String, Object> map);
	
	//게시글삭제
	void deleteBoard(HashMap<String, Object> map);
	
	//게시글 등록
	void insertBoard(HashMap<String, Object> map);
	
	//게시글 상세정보 pk로 검색시엔 하나만 나오기 때문에 list로 감쌀 이유가 없음
	Board viewBoard(HashMap<String, Object> map);

}
