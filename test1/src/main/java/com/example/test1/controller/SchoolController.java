package com.example.test1.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.SchoolService;
import com.google.gson.Gson;

@Controller
public class SchoolController {
	
	@Autowired
	SchoolService schoolService;
	
	@RequestMapping("/school-stu.do")
	public String userList(Model model) throws Exception{
		
		return "/school.stu";
	}
	@RequestMapping("/school-stuView.do")
	  public String stuView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
	  System.out.println(map);
	  request.setAttribute("stuNo", map.get("stuNo"));
    return "/school-stuView";
	}
	@RequestMapping("/school-stuUpdate.do")
	  public String stuUpdate(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
	  System.out.println(map);
	  request.setAttribute("stuNo", map.get("stuNo"));
	  return "/school-stuUpdate";
	}
	@RequestMapping(value = "/school-stu.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String stulist(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = schoolService.stuList(map);
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/school-stuView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String stuView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = schoolService.viewStu(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/stuUpdate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String board_insert(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println("Cotroll>>> "+ map);
		resultMap = schoolService.updateStu(map);
		return new Gson().toJson(resultMap);
	}
}
