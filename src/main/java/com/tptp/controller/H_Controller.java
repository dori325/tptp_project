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
public class H_Controller {
	Logger log = Logger.getLogger(this.getClass());

	// @Autowired -> 알아서 데이터 타입으로 찾음 java
	// @Inject-> 데이터타입으로 찾기 Spring
	// @Resource(name="") -> name찾기
	@Resource(name = "h_Service")
	private H_Service h_Service;

	// 1.메인
	@RequestMapping(value = "main.do")
	public ModelAndView main(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();

		// 공지사항
		List<Map<String, Object>> list = h_Service.list(commandMap.getMap());
		mv.addObject("list", list);

		// 추천리스트
		List<Map<String, Object>> k_list = h_Service.k_list(commandMap.getMap());
		mv.addObject("k_list", k_list);

		// 새소식
		List<Map<String, Object>> n_list = h_Service.n_list(commandMap.getMap());
		mv.addObject("n_list", n_list);

		// 브랜드1
		List<Map<String, Object>> b1_list = h_Service.b1_list(commandMap.getMap());
		mv.addObject("b1_list", b1_list);

		// 브랜드2
		List<Map<String, Object>> b2_list = h_Service.b2_list(commandMap.getMap());
		mv.addObject("b2_list", b2_list);

		// 브랜드3
		List<Map<String, Object>> b3_list = h_Service.b3_list(commandMap.getMap());
		mv.addObject("b3_list", b3_list);

		return mv;
	}

	// 2.새소식
	@RequestMapping(value = "news.do")
	public ModelAndView news(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();

		// List<BoardDTO> list = tptpService.list();
		System.out.println("searchID=" + commandMap.get("searchID"));
		System.out.println("searchCont=" + commandMap.get("searchCont"));
		System.out.println("b_title=" + commandMap.get("b_title"));
		System.out.println("b_content=" + commandMap.get("b_content"));
		
		if (commandMap.get("searchCont") == null) { // 검색어 없을때
			List<Map<String, Object>> n_list = h_Service.n_list(commandMap.getMap());
			mv.addObject("n_list", n_list);
		} else { // 검색어 있을떄
			List<Map<String, Object>> n_search = h_Service.n_search(commandMap.getMap());
			mv.addObject("n_list", n_search);
			if (commandMap.containsKey("b_title")) {
				mv.addObject("b_title", commandMap.get("b_title"));
			}
			if (commandMap.containsKey("b_content")) {
				mv.addObject("b_content", commandMap.get("b_content"));
			}
		}

		return mv;
	}

	// 3.전체검색
	@RequestMapping(value = "totalSearch.do")
	public ModelAndView totalSearch(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> ts_list = h_Service.ts_list(commandMap.getMap());
		mv.addObject("ts_list", ts_list);
		
		List<Map<String, Object>> ts_list_count = h_Service.ts_l_count(commandMap.getMap());
		mv.addObject("ts_list_count", ts_list_count);
		
		return mv;
	}

	// 4.사용자리스트
	@RequestMapping(value = "userList.do")
	public ModelAndView userList(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();

		System.out.println("searchID=" + commandMap.get("searchID"));
		System.out.println("searchCont=" + commandMap.get("searchCont"));
		System.out.println("l_id=" + commandMap.get("l_id"));
		System.out.println("l_nick=" + commandMap.get("l_nick"));
		System.out.println("l_auth=" + commandMap.get("l_auth"));

		// if (!request.getParameter("searchCont").equals("") ) {
		if (commandMap.get("searchCont") == null) { // 검색어 없을때
			List<Map<String, Object>> u_list = h_Service.u_list(commandMap.getMap());
			mv.addObject("u_list", u_list);
		} else { // 검색어 있을때
			List<Map<String, Object>> ul_search = h_Service.ul_search(commandMap.getMap());
			mv.addObject("u_list", ul_search);
			if (commandMap.containsKey("l_id")) {
				mv.addObject("l_id", commandMap.get("l_id"));
			}
			if (commandMap.containsKey("l_nick")) {
				mv.addObject("l_nick", commandMap.get("l_nick"));
			}
			if (commandMap.containsKey("l_auth")) {
				mv.addObject("l_auth", commandMap.get("l_auth"));
			}
		}
		//mv.setViewName("redirect:userListSearch.do?searchCont=" + request.getParameter("searchCont"));
		
		return mv;
	}


	// 5.log기록
	@RequestMapping(value = "log.do")
	public ModelAndView log(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();

		int page = 1;
		if (commandMap.containsKey("page") && Integer.parseInt((String) commandMap.get("page")) > 0) {
			page = Integer.parseInt((String) commandMap.get("page"));
		}

		List<Map<String, Object>> list = h_Service.log(commandMap.getMap());
		// 사용자 id만 가져오기
		List<Map<String, Object>> id = h_Service.id(commandMap.getMap());
		// ip만 가져오기
		List<Map<String, Object>> ip = h_Service.ip(commandMap.getMap());

		mv.addObject("list", list);
		mv.addObject("idList", id);
		mv.addObject("ipList", ip);
		mv.addObject("page", page);

		if (list.size() > 0) {
			mv.addObject("count", list.get(0).get("count"));
		}
		if (commandMap.containsKey("ip")) {
			mv.addObject("ip", commandMap.get("ip"));
		}
		if (commandMap.containsKey("name")) {
			mv.addObject("name", commandMap.get("name"));
		}
		if (commandMap.containsKey("log_do")) {
			mv.addObject("log_do", commandMap.get("log_do"));
		}

		return mv;
	}

}
