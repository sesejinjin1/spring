package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.BoardMapper;
import com.example.test1.model.Board;
import com.example.test1.model.User;


@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardMapper BoardMapper;

	@Override
	public HashMap<String, Object> searchBoardList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new  HashMap<String, Object>();
		List<Board> list = BoardMapper.selectBoardList(map);
		int cnt = BoardMapper.countBoard(map);
		resultMap.put("list",list);
		resultMap.put("cnt",cnt);
		resultMap.put("result","success");
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> removeBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new  HashMap<String, Object>();
		System.out.print(map);
		try {
			BoardMapper.deleteBoard(map);
			resultMap.put("message","삭제되었습니다.");
		}catch(Exception e) {
			resultMap.put("message","예기치 못한 문제 발생");
		}
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> addBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new  HashMap<String, Object>();
		System.out.println(map);
		try {
			BoardMapper.insertBoard(map);
			System.out.println("service >>>>"+map);
			resultMap.put("idx", map.get("boardNo"));
			resultMap.put("result","success");
			resultMap.put("message","등록되었습니다.");
		}catch(Exception e) {
			resultMap.put("result","fail");
			resultMap.put("message","예기치 못한 문제 발생");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> viewBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new  HashMap<String, Object>();
		
		try {
			Board board = BoardMapper.viewBoard(map);
			List<Board> commentList = BoardMapper.boardComment(map);
			resultMap.put("commentList", commentList);
			resultMap.put("info", board);
			resultMap.put("result","success");
			resultMap.put("message","검색되었습니다.");
		}catch(Exception e) {
			resultMap.put("result","fail");
			resultMap.put("message","예기치 못한 문제 발생");
		}
		return resultMap;
	}

	
}
