package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.BoardMapper;
import com.example.test1.mapper.SchoolMapper;
import com.example.test1.model.Board;
import com.example.test1.model.School;

@Service
public class SchoolServiceImpl implements SchoolService{

	@Autowired
	SchoolMapper schoolMapper;
	
	@Override
	public HashMap<String, Object> stuList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub]
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<School> list = schoolMapper.stuList(map);
//		System.out.println("::::::이거 맵 :::::"+list);
		resultMap.put("list",list);
		resultMap.put("result","success");
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> viewStu(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			School school = schoolMapper.viewStu(map);
			resultMap.put("reslut", "sec");
			resultMap.put("info", school);
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "faill");
			
		}
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> updateStu(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		System.out.println(map);
		try {
			schoolMapper.updateStu(map);
			resultMap.put("result","success");
			resultMap.put("message","등록되었습니다.");
		} catch (Exception e) {
			resultMap.put("result","fail");
			resultMap.put("message","예기치 못한 문제 발생");
		}
		return resultMap;
	}

}

