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

import com.example.test1.dao.BoardService;
import com.example.test1.model.Board;
import com.google.gson.Gson;

@Controller
public class BoardController {
	
	@Autowired
	BoardService BoardService;
	
	// 게시글 목록 페이지
	@RequestMapping("/board-list.do")
	  public String board(Model model) throws Exception{

        return "/board-list";
    }
	@RequestMapping(value = "/board-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String board_list(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = BoardService.searchBoardList(map);
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/board-remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String board_remove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = BoardService.removeBoard(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/board-insert.do")
	  public String boardInsert(Model model) throws Exception{

      return "/board-insert";
	}
	
	@RequestMapping(value = "/board-add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String board_insert(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = BoardService.addBoard(map);
		return new Gson().toJson(resultMap);
	}
	
}
