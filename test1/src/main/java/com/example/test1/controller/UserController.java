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
	@RequestMapping("/user-list.do")
	public String userList(Model model) throws Exception{
		
		return "/user-list";
	}
	
	//로그인
	@RequestMapping(value = "/userLogin.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userLogin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = UserService.loginUser(map);
		return new Gson().toJson(resultMap);
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
	
	//회원가입
	@RequestMapping(value = "/join.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String join(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = UserService.addUser(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/user-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = UserService.searchUserList(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/user-board.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userBoardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = UserService.seelctUserBoard(map);
		return new Gson().toJson(resultMap);
	}
	//회원 삭제
	@RequestMapping(value = "/user-delete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = UserService.deleteUser(map);
		return new Gson().toJson(resultMap);
	}
}
