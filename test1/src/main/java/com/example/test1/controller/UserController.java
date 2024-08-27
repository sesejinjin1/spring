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

import com.example.test1.dao.UserService;
import com.google.gson.Gson;

@Controller
public class UserController {
	
	@Autowired
	UserService UserService;
	
	@RequestMapping("/login.do")
	public String login(Model model) throws Exception{
		
		return "/login";
	}
	
	@RequestMapping("/join.do")
	public String join(Model model) throws Exception{
		
		return "/join";
	}
	//유저 정보
	@RequestMapping("/user-info.do")
	  public String user_info(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
	  System.out.println("user.do >>>" + map);
	  request.setAttribute("userId", map.get("userId"));
    return "/user-info";
	}
	@RequestMapping(value = "/user-info.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String user_info(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = UserService.userInfo(map);
		return new Gson().toJson(resultMap);
	}
	
	
	@RequestMapping(value = "/join.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String join(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = UserService.join(map);
		return new Gson().toJson(resultMap);
	}
	
}
