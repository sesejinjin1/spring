package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.StudentMapper;
import com.example.test1.model.Student;


@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	StudentMapper studentMapper;
	
	@Override
	public List<Student> searchStudentList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return studentMapper.selectStudentList();
	}

	@Override
	public Student searchQwer() {
		// TODO Auto-generated method stub
		return studentMapper.qwer();
	}
	
	@Override
	public Student searchStu(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		try {
			Student s = studentMapper.selectStu(map);
		}catch (Exception e) {
			
		}
		return studentMapper.selectStu(map);
	}

	@Override
	public HashMap<String, Object> searchSubject() {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Student> subject = studentMapper.selectSubject();
		List<Student> student = studentMapper.selectStudentList();
		
		resultMap.put("subList", subject);
		resultMap.put("stuList", student);
		
		return resultMap;
	}

	
}
