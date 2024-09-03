package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.ChartMapper;
import com.example.test1.model.Chart;


@Service
public class ChartServiceImpl implements ChartService{

	@Autowired
	ChartMapper chartMapper;

	@Override
	public HashMap<String, Object> viewChart(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new  HashMap<String, Object>();
		List<Chart> list = chartMapper.selectChart(map);
		System.out.println("IMPL>>>>>"+list);
		resultMap.put("list",list);
		resultMap.put("result","success");
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> viewArea(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new  HashMap<String, Object>();
		List<Chart> list = chartMapper.selectArea(map);
		List<Chart> listGu = chartMapper.selectAreaGu(map);
		List<Chart> listDong = chartMapper.selectAreaDong(map);
		System.out.println("IMPL>>>>>"+list);
		resultMap.put("list",list);
		resultMap.put("listGu",listGu);
		resultMap.put("listDong",listDong);
		resultMap.put("result","success");
		
		return resultMap;
	}



	
}
