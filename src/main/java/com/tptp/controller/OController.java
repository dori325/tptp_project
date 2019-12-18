package com.tptp.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tptp.dto.BoardDTO;
import com.tptp.service.OService;


@Controller
public class OController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "oService")
	private OService oService;
	
	@RequestMapping (value = "notice.do")
	public ModelAndView notice(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> notice = oService.notice();
		mv.addObject("notice",notice);
		
		return mv;
	}
	
	@RequestMapping (value = "board.do")
	public ModelAndView board(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> list = oService.list();
		mv.addObject("list", list);
		
		return mv;
	}
	@RequestMapping (value = "detail.do")
	public ModelAndView detail(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		return mv;
	}
	@RequestMapping (value = "write.do")
	public ModelAndView write(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		return mv;
	}
}