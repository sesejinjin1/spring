package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.UserMapper;
import com.example.test1.model.Board;
import com.example.test1.model.User;


@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserMapper userMapper;
	@Override
	public HashMap<String, Object> userInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println("mpl안넘어옴-->>" + map);
		try {
			User user = userMapper.userInfo(map);
			resultMap.put("info", user);
			resultMap.put("result","success");
			resultMap.put("message","검색되었습니다.");
		}catch(Exception e) {
			resultMap.put("result","fail");
			resultMap.put("message","예기치 못한 문제 발생");
		}
		return resultMap;
	}
	@Override
	public HashMap<String, Object> addUser(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println(map);
		try {
			userMapper.insertUser(map);
			resultMap.put("result","success");
			resultMap.put("message","등록되었습니다.");
		}catch(Exception e) {
			resultMap.put("result","fail");
			resultMap.put("message","예기치 못한 문제 발생");
		}
		return resultMap;
	}
	
	@Override
	public HashMap<String, Object> searchUserList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			List<User> list = userMapper.selectUserList(map);
			resultMap.put("list",list);
			resultMap.put("result","success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result","fail");
			resultMap.put("message","예기치 못한 문제 발생");
		}
		
		
		return resultMap;
	}
	@Override
	public HashMap<String, Object> seelctUserBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			List<Board> list = userMapper.seelctUserBoard(resultMap);
			resultMap.put("list", list);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
			resultMap.put("result", "문제발생");
		}
		return resultMap;
	}
	@Override
	public HashMap<String, Object> deleteUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			System.out.println(map);
			userMapper.userRemove(map);
			resultMap.put("result","success");
			resultMap.put("message","삭제완료.");
		} catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("result", "문제발생");
		}
		return resultMap;
	}
	@Override
	public HashMap<String, Object> loginUser(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println("mpl안넘어옴-->>" + map);
		try {
			User user = userMapper.userLogin(map);
			resultMap.put("info", user);
			resultMap.put("result","success");
			resultMap.put("message","DB넘기기 성공함.");
		}catch(Exception e) {
			resultMap.put("result","fail");
			resultMap.put("message","문제발생");
		}
		return resultMap;
	}
	

}
