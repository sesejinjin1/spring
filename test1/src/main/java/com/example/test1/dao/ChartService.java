package com.example.test1.dao;

import java.util.HashMap;


public interface ChartService {
	// 
	HashMap<String, Object> viewChart(HashMap<String,Object> map);
	
	HashMap<String, Object> viewArea(HashMap<String, Object> map);
	
	//emplist
	HashMap<String, Object> empList(HashMap<String, Object> map);
	
	//empchecklist
	HashMap<String, Object> empCheckList(HashMap<String, Object> map);
	
	//itemList
	HashMap<String, Object> itemList(HashMap<String, Object> map);
	
	//selectWeather si,gu,dong
	HashMap<String, Object> Weather(HashMap<String, Object> map);
	HashMap<String, Object> WeatherGu(HashMap<String, Object> map);
	HashMap<String, Object> WeatherDong(HashMap<String, Object> map);
}
