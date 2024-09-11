package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.test1.constants.ResMessage;
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

	@Override
	public HashMap<String, Object> empList(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new  HashMap<String, Object>();
		List<Chart> list = chartMapper.selectEmp(map);
		resultMap.put("list",list);
		resultMap.put("result","success");
		return resultMap;
	}

	@Override
	public HashMap<String, Object> empCheckList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new  HashMap<String, Object>();
		List<Chart> list = chartMapper.selectEmpCheck(map);
		resultMap.put("list",list);
		resultMap.put("result","success");
		return resultMap;
	}

	@Override
	public HashMap<String, Object> itemList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			List<Chart> list = chartMapper.itemList(map);
			List<Chart> codeList = chartMapper.codeList(map);
			resultMap.put("result","success");
			resultMap.put("list", list);
			resultMap.put("codeList", codeList);
			resultMap.put("message", ResMessage.SUCCESS);
		}catch(DataAccessException e) {
		resultMap.put("result", "fail");
		resultMap.put("message", ResMessage.DB_ACCESS_ERROR);
		}catch(PersistenceException e) {
		resultMap.put("result", "fail");
		resultMap.put("message", ResMessage.MYBATIS_ERROR);
		}catch(Exception e) {
		resultMap.put("result", "fail");
		resultMap.put("message", ResMessage.UNKNOWN_ERROR);
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> Weather(HashMap<String, Object> map) {

		HashMap<String, Object> resultMap = new HashMap<>();
		List<Chart> siList = chartMapper.selectWeather(map);
		resultMap.put("siList", siList);
		return resultMap;
	}

	@Override
	public HashMap<String, Object> WeatherGu(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		List<Chart> guList = chartMapper.selectWeatherGu(map);
		resultMap.put("guList", guList);
		return resultMap;
	}

	@Override
	public HashMap<String, Object> WeatherDong(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		List<Chart> dongList = chartMapper.selectWeatherDong(map);
		resultMap.put("dongList", dongList);
		return resultMap;
	}

	
}
