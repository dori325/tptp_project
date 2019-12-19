package com.tptp.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.common.common.CommandMap;
import com.tptp.service.OService;


@Controller
public class OController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "oService")
	private OService oService;
	
	@RequestMapping (value = "notice.do")
	public ModelAndView notice(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> notice = oService.notice(commandMap.getMap());
		mv.addObject("notice",notice);
		
		return mv;
	}
	
	@RequestMapping (value = "brand1.do")
	public ModelAndView brand1(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> brand1 = oService.brand1(commandMap.getMap());
		
		mv.addObject("brand1", brand1);
		
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
