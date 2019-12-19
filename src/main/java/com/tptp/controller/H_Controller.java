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
	@Resource(name = "h_Service")
	private H_Service h_Service;

	//1.메인
	@RequestMapping (value = "main.do")
	public ModelAndView main(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<Map<String, Object>> list = h_Service.list(commandMap.getMap());
		mv.addObject("list", list);
		
		List<Map<String, Object>> k_list = h_Service.k_list(commandMap.getMap());
		mv.addObject("k_list", k_list);
		
		List<Map<String, Object>> n_list = h_Service.n_list(commandMap.getMap());
		mv.addObject("n_list", n_list);
		
		return mv;
	}
	
	
	//2.새소식
	@RequestMapping (value = "news.do")
	public ModelAndView news(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		//List<BoardDTO> list = tptpService.list();
		List<Map<String, Object>> list = h_Service.list(commandMap.getMap());	
		System.out.println( list.toString());
		mv.addObject("list", list);
		
		return mv;
	}
	
	//3.전체검색
	@RequestMapping (value = "totalSearch.do")
	public ModelAndView totalSearch(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> n_list = h_Service.n_list(commandMap.getMap());
		mv.addObject("n_list", n_list);
		return mv;
	}	
	
	
	//4.사용자리스트
	@RequestMapping (value = "userList.do")
	public ModelAndView userList(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	//5.log기록
	@RequestMapping (value = "log.do")
	public ModelAndView log(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	


}
