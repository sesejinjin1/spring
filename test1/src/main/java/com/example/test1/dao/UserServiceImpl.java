package com.example.test1.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.UserMapper;
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
	public HashMap<String, Object> join(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println(map);
		try {
			userMapper.join(map);
			resultMap.put("result","success");
			resultMap.put("message","등록되었습니다.");
		}catch(Exception e) {
			resultMap.put("result","fail");
			resultMap.put("message","예기치 못한 문제 발생");
		}
		return resultMap;
	}
	

}
