package com.tptp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.common.common.CommandMap;
import com.common.util.IpCheck;
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
		HttpSession session = request.getSession();

		// 임시로 page 만들어주기
		int page = 1;
		if (commandMap.containsKey("page") && Integer.parseInt((String) commandMap.get("page")) > 0) {
			page = Integer.parseInt((String) commandMap.get("page"));
		}
		commandMap.put("page", (page - 1) * 10);// '0'
		
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

		//paging
		mv.addObject("page", page);
		List<Map<String, Object>> news_list = h_Service.news_list(commandMap.getMap());
		if (news_list.size() > 0) {
			//System.out.println("총 글의 수 : " + u_list.get(0).get("COUNT"));
			mv.addObject("count", news_list.get(0).get("count"));
		}
		return mv;
	}

	// 2.새소식
	@RequestMapping(value = "news.do")
	public ModelAndView news(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();

		// List<BoardDTO> list = tptpService.list();
		System.out.println("searchID=" + commandMap.get("searchID"));
		System.out.println("searchCont=" + commandMap.get("searchCont"));
		System.out.println("b_title=" + commandMap.get("b_title"));
		System.out.println("b_content=" + commandMap.get("b_content"));
		
		// 임시로 page 만들어주기
		int page = 1;
		if (commandMap.containsKey("page") && Integer.parseInt((String) commandMap.get("page")) > 0) {
			page = Integer.parseInt((String) commandMap.get("page"));
		}
		commandMap.put("page", (page - 1) * 10);// '0'
		
		if (commandMap.get("searchCont") == null) { // 검색어 없을때
			List<Map<String, Object>> news_list = h_Service.news_list(commandMap.getMap());
			mv.addObject("news_list", news_list);
			mv.addObject("b_cate1", news_list.get(0).get("b_cate1"));
			mv.addObject("b_cate2", commandMap.get("b_cate2"));		
			System.out.println(commandMap.get("b_cate2"));
			mv.addObject("page", page);			
			if (news_list.size() > 0) {
				if (commandMap.get("b_cate2") != null) {
					if (commandMap.get("b_cate2").equals("연필")) {
						mv.addObject("count", news_list.get(0).get("pen_count"));
						
					}else if (commandMap.get("b_cate2").equals("볼펜")) {
						mv.addObject("count", news_list.get(0).get("ball_count"));
				
					}else if (commandMap.get("b_cate2").equals("샤프")) {
						mv.addObject("count", news_list.get(0).get("sha_count"));
						
					}else if (commandMap.get("b_cate2").equals("형광펜")) {
						mv.addObject("count", news_list.get(0).get("hi_count"));
						
					}else if (commandMap.get("b_cate2").equals("만년필")) {
						mv.addObject("count", news_list.get(0).get("foun_count"));
						
					}else if (commandMap.get("b_cate2").equals("기타")) {
						mv.addObject("count", news_list.get(0).get("etc_count"));
					}
				}else if(commandMap.get("b_cate2") == null) {
					//System.out.println("총 글의 수 : " + u_list.get(0).get("COUNT"));
					mv.addObject("count", news_list.get(0).get("count"));
					System.out.println(news_list.get(0).get("count"));
				}
			}
			
		} else { // 검색어 있을떄
			List<Map<String, Object>> news_search = h_Service.news_search(commandMap.getMap());
			//mv.addObject("news_list", news_search);
			mv.addObject("news_search", news_search);
			mv.addObject("b_cate1", news_search.get(0).get("b_cate1"));
			mv.addObject("b_cate2", commandMap.get("b_cate2"));				
			mv.addObject("page", page);
			if (news_search.size() > 0) {
				if (commandMap.get("b_cate2") != null) {
					if (commandMap.get("b_cate2").equals("연필")) {
						mv.addObject("count", news_search.get(0).get("pen_count"));
						
					}else if (commandMap.get("b_cate2").equals("볼펜")) {
						mv.addObject("count", news_search.get(0).get("ball_count"));
				
					}else if (commandMap.get("b_cate2").equals("샤프")) {
						mv.addObject("count", news_search.get(0).get("sha_count"));
						
					}else if (commandMap.get("b_cate2").equals("형광펜")) {
						mv.addObject("count", news_search.get(0).get("hi_count"));
						
					}else if (commandMap.get("b_cate2").equals("만년필")) {
						mv.addObject("count", news_search.get(0).get("foun_count"));
						
					}else if (commandMap.get("b_cate2").equals("기타")) {
						mv.addObject("count", news_search.get(0).get("etc_count"));
					}
				}else if(commandMap.get("b_cate2") == null) {
					mv.addObject("count", news_search.get(0).get("count"));
					System.out.println(news_search.get(0).get("count"));
				//System.out.println("총 글의 수 : " + u_list.get(0).get("COUNT"));
				}
			}			
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
		HttpSession session = request.getSession();
		
		System.out.println("b_content=" + commandMap.get("b_content"));
		
		// 임시로 page 만들어주기
		int page = 1;
		if (commandMap.containsKey("page") && Integer.parseInt((String) commandMap.get("page")) > 0) {
			page = Integer.parseInt((String) commandMap.get("page"));
		}
		commandMap.put("page", (page - 1) * 10);// '0'		
		
		List<Map<String, Object>> ts_list = h_Service.ts_list(commandMap.getMap());
		mv.addObject("ts_list", ts_list);
		mv.addObject("page", page);
		if (ts_list.size() > 0) {
			//System.out.println("총 글의 수 : " + u_list.get(0).get("COUNT"));
			mv.addObject("count", ts_list.get(0).get("count"));
		}
		
		return mv;
	}

	// 4.사용자리스트
	@RequestMapping(value = "userList.do")
	public ModelAndView userList(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();

		System.out.println("searchID=" + commandMap.get("searchID"));
		System.out.println("searchCont=" + commandMap.get("searchCont"));
		System.out.println("l_id=" + commandMap.get("l_id"));
		System.out.println("l_nick=" + commandMap.get("l_nick"));
		System.out.println("l_auth=" + commandMap.get("l_auth"));
		
		// 임시로 page 만들어주기
		int page = 1;
		if (commandMap.containsKey("page") && Integer.parseInt((String) commandMap.get("page")) > 0) {
			page = Integer.parseInt((String) commandMap.get("page"));
		}
		commandMap.put("page", (page - 1) * 10);// '0'

		// if (!request.getParameter("searchCont").equals("") ) {
		if (commandMap.get("searchCont") == null) { // 검색어 없을때
			List<Map<String, Object>> u_list = h_Service.u_list(commandMap.getMap());
			mv.addObject("u_list", u_list);
			mv.addObject("page", page);
			if (u_list.size() > 0) {
				//System.out.println("총 글의 수 : " + u_list.get(0).get("COUNT"));
				mv.addObject("count", u_list.get(0).get("count"));
			}
			//mv.setViewName("userList");
		} else { // 검색어 있을때
			List<Map<String, Object>> ul_search = h_Service.ul_search(commandMap.getMap());
			mv.addObject("ul_search", ul_search);
			mv.addObject("page", page);
			if (ul_search.size() > 0) {
				//System.out.println("총 글의 수 : " + ul_search.get(0).get("COUNT"));
				mv.addObject("count", ul_search.get(0).get("count"));
			}
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

	//4.사용자리스트-권한변경
	@RequestMapping(value = "levelUpdate.do")
	public ModelAndView levelUpdate(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		commandMap.put("l_no", session.getAttribute("l_no"));
		commandMap.put("l_auth", session.getAttribute("l_auth"));

		System.out.println("[controller.. l_no]===>: " +request.getParameter("l_no"));
		System.out.println("[controller.. l_auth]=>: " +request.getParameter("l_auth"));
		
		if (session.getAttribute("id") != null && session.getAttribute("auth") != null) {
			int result = h_Service.levelUpdate(commandMap.getMap());
			System.out.println("[controller.. l_auth]=>: " + result);

			if (result == 0) {
				mv.setViewName("userList");
			} else if (result == 1) {				
				session.setAttribute("l_no", request.getParameter("l_no"));
				session.setAttribute("l_auth", request.getParameter("l_auth"));				
				mv.addObject("l_auth", commandMap.get("l_auth"));
				mv.addObject("l_no", commandMap.get("l_no"));				
				mv.addObject("levelUpdate");				
				mv.setViewName("redirect:userList.do");
			}			
			
			//권한변경-log insert
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("l_id", session.getAttribute("id"));
			map.put("l_nick", session.getAttribute("l_nick"));
			map.put("log_etc", session.getAttribute("id")+"님이 권한 변경함" );
			map.put("log_ip", IpCheck.getUserIP(request));
			map.put("log_do", 10); //10권한변경
			h_Service.logInput(map);
		}
		return mv;
	}
	

	// 5.log관리
	@RequestMapping(value = "log.do")
	public ModelAndView log(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		commandMap.put("id", session.getAttribute("id"));
		commandMap.put("pw", session.getAttribute("pw"));

		int page = 1;
		if (commandMap.containsKey("page") && Integer.parseInt((String) commandMap.get("page")) > 0) {
			page = Integer.parseInt((String) commandMap.get("page"));
		}
		commandMap.put("page", (page - 1) * 10);// '0'

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
