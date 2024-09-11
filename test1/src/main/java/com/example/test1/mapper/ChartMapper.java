package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.example.test1.model.Chart;

@Mapper
public interface ChartMapper {
	
	//
	List<Chart> selectChart(HashMap<String, Object> map);
	
	//do si
	List<Chart> selectArea(HashMap<String, Object> map);
	
	//gu
	List<Chart> selectAreaGu(HashMap<String, Object> map);
	
	//dong
	List<Chart> selectAreaDong(HashMap<String, Object> map);
	
	//emplist
	List<Chart> selectEmp(HashMap<String, Object> map);
	
	//empchecklist
	List<Chart> selectEmpCheck(HashMap<String, Object> map);
	
	//itemList
	List<Chart> itemList(HashMap<String, Object> map);
	
	//codeList
	List<Chart> codeList(HashMap<String, Object> map);
	
	//weather
	List<Chart> selectWeather(HashMap<String, Object> map);
	List<Chart> selectWeatherGu(HashMap<String, Object> map);
	List<Chart> selectWeatherDong(HashMap<String, Object> map);
}
