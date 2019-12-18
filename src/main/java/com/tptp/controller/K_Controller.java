package com.tptp.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import com.tptp.service.K_Service;

@Controller
public class K_Controller {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "k_Service")
	private K_Service k_Service;
	
	@RequestMapping(value = "QnAlist.do")
	public ModelAndView QnA(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
//		List<Map<String, Object>> list = k_Service.admOper();
//		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping(value = "brandBoard.do")
	public ModelAndView brandBoard(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}

	@RequestMapping(value = "LsideB.do")
	public ModelAndView Lside(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		return mv;
	}

	@RequestMapping(value = "RsideB.do")
	public ModelAndView Rside(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		return mv;
	}
	
	@RequestMapping(value = "RsideB2.do")
	public ModelAndView Rside2(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}

	@RequestMapping(value = "index.do")
	public ModelAndView index(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		return mv;
	}

	@RequestMapping(value = "mypage.do")
	public ModelAndView mypage(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		return mv;
	}

	@RequestMapping(value = "repw.do")
	public ModelAndView repw(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		return mv;
	}

	@RequestMapping(value = "lostLogin.do")
	public ModelAndView lostLogin(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		return mv;
	}

	@RequestMapping(value = "admCommList.do")
	public ModelAndView admCommList(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		return mv;
	}

	@RequestMapping(value = "join.do")
	public ModelAndView welcome(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	@RequestMapping(value = "commInsert.do")
	public ModelAndView commInsert(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
}
