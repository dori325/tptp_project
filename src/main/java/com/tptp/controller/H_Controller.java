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
import com.tptp.service.H_Service;

@Controller
public class  H_Controller {
	Logger log = Logger.getLogger(this.getClass());
	
	//@Autowired -> 알아서 데이터 타입으로 찾음 java
	//@Inject-> 데이터타입으로 찾기 Spring
	//@Resource(name="") -> name찾기
	@Resource(name = "tptpService")
	private H_Service tptpService;

	@RequestMapping (value = "main.do")
	public ModelAndView main(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<Map<String, Object>> list = tptpService.list(commandMap.getMap());
		mv.addObject("list", list);		
		return mv;
	}
	
	
	@RequestMapping (value = "news.do")
	public ModelAndView news(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		log.debug("news=인터셉터 테스트=start");
		//List<BoardDTO> list = tptpService.list();
		List<Map<String, Object>> list = tptpService.list(commandMap.getMap());	
		
		System.out.println( list.size());
		System.out.println( list.toString());
		mv.addObject("list", list);
		
		return mv;
	}	
	
	
	@RequestMapping (value = "search.do")
	public ModelAndView search(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<Map<String, Object>> list = tptpService.list(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	
	
	@RequestMapping (value = "join.do")
	public ModelAndView join(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	@RequestMapping (value = "admin.do")
	public ModelAndView admin(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	@RequestMapping (value = "totalSeach.do")
	public ModelAndView totalSeach(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	
	@RequestMapping (value = "index.do")
	public ModelAndView index(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	@RequestMapping (value = "board.do")
	public ModelAndView board(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
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
