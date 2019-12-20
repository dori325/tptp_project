package com.tptp.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
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
		
		mv.addObject("b_cate1", notice.get(0).get("b_cate1"));
		
		return mv;
	}
	
	@RequestMapping (value = "brand1.do")
	public ModelAndView brand1(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> brand1 = oService.brand1(commandMap.getMap()); 
		
		mv.addObject("brand1", brand1);
		
		mv.addObject("b_cate1", brand1.get(0).get("b_cate1"));
		System.out.println(brand1.get(0));
		System.out.println(brand1.get(0).get("b_cate1"));
		
		
		return mv;
	}
	
	@RequestMapping (value = "brand2.do")
	public ModelAndView brand2(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> brand2 = oService.brand2(commandMap.getMap());

		mv.addObject("brand2", brand2);
		
		return mv;
	}
	
	@RequestMapping (value = "brand3.do")
	public ModelAndView brand3(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> brand3 = oService.brand3(commandMap.getMap());
		
		mv.addObject("brand3", brand3);
		
		return mv;
	}
	
	@RequestMapping (value = "detail.do")
	public ModelAndView detail(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> detail = oService.detail(commandMap.getMap());
		
		
		mv.addObject("detail", detail);
		
		return mv;
	}
	@RequestMapping (value = "write.do")
	public ModelAndView write(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("cate1 :" + commandMap.get("b_cate1"));
		mv.addObject("cate1", commandMap.get("b_cate1"));
		
		
		return mv;
	}
	
//	@RequestMapping (value = "writeInsert.do")
	@PostMapping (value = "writeInsert.do")
	public ModelAndView writeInsert(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();

		
		if (request.getParameter("b_title") != null && request.getParameter("b_content") != null) {
			
			commandMap.put("l_nick", "bill");
			int result = oService.writeInsert(commandMap.getMap());
			
//			String old_url = request.getHeader("Referer");
//			System.out.println(old_url);
			mv.setViewName("redirect:brand1.do");
		}else{
			mv.setViewName("redirect:write.do");
		}
		
		return mv;
	}
}
