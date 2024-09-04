package com.example.test1.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.ChartService;
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
}
