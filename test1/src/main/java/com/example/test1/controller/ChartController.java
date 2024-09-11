package com.example.test1.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.ChartService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

@Controller
public class ChartController {
	@Autowired
	ChartService chartservice;
	//차트
	@RequestMapping("/chart.do")
	  public String chartView(Model model) throws Exception{

        return "/chart";
    }
	@RequestMapping(value = "/chart.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String chart_list(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = chartservice.viewChart(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/area.do")
	  public String areaView(Model model) throws Exception{

      return "/area";
  }
	@RequestMapping(value = "/area.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String areaView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println("cont>>>>" + map);
		resultMap = chartservice.viewArea(map);
		return new Gson().toJson(resultMap);
	}
	@RequestMapping("/juso.do")
	  public String juso(Model model) throws Exception{

		return "/juso";
	}
	@RequestMapping("/jusoPopup.do")
	  public String jusoPopup(Model model) throws Exception{

		return "/jusoPopup";
	}
	@RequestMapping("/jusoSample.do")
	  public String jusoSample(Model model) throws Exception{

		return "/Sample";
	}
	@RequestMapping("/emp.do")
	  public String emp(Model model) throws Exception{

		return "/emp";
	}
	@RequestMapping(value = "/emp.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String empList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = chartservice.empList(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/empcheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String empCheckList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = chartservice.empCheckList(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/item.do")
	  public String item(Model model) throws Exception{

		return "/item";
	}
	@RequestMapping(value = "/item.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String itemList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		String json = map.get("selectItem").toString(); 
		ObjectMapper mapper = new ObjectMapper();
		List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
		map.put("list", list);
		
		resultMap = chartservice.itemList(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	@RequestMapping("/api.do")
	  public String api(Model model) throws Exception{

		return "/api";
	}
	@RequestMapping(value = "/areaWeather.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String areaWeather(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = chartservice.Weather(map);
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/areaWeatherGu.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String areaWeatherGu(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = chartservice.WeatherGu(map);
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/areaWeatherDong.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String areaWeatherDong(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = chartservice.WeatherDong(map);
		return new Gson().toJson(resultMap);
	}
}
