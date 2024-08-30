package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.UserMapper;
import com.example.test1.model.Board;
import com.example.test1.model.User;


@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	HttpSession session;
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
		System.out.println(map);
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
		System.out.println("mpl -->>" + map);
		try {
			User user = userMapper.userLogin(map);	//위에 넘어온 map 정보로 user 객체 만들고 맵퍼에 sql userLogin(아이디 비밀번호 체크) 호출
			if(user == null) {	// 호출 후 DB에 정보 없음 
				resultMap.put("result","fail");
				User idcheck = userMapper.userInfo(map);	// 처음 넘어온 map 정보로 user객체 다시 만들고 맵퍼접근 sql userInfo(아이디만 체크) 호출  
				if(idcheck == null) {
					resultMap.put("message","아이디 확인");
				}else {
					resultMap.put("message","비밀번호 확인");
				}
			}else {
				resultMap.put("info", user);
				resultMap.put("result","success");
				resultMap.put("message","DB넘기기 성공함.");
				session.setAttribute("sessionId", user.getuserId());
				session.setAttribute("sessionName", user.getuserName());
				session.setAttribute("sessionStatus", user.getStatus());
			}
		}catch(Exception e) {
			resultMap.put("result","fail");
			resultMap.put("message","문제발생");
		}
		return resultMap;
	}
	

}
