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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.common.common.CommandMap;
import com.tptp.service.OService;

@Controller
public class OController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "oService")
	private OService oService;

	@RequestMapping(value = "ohSearch.do")
	public ModelAndView ohSearch(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		System.out.println(request.getParameter("b_cate1"));
		if (!request.getParameter("searchCont").equals("")) {
			List<Map<String, Object>> list = oService.ohSearch(commandMap.getMap());
			if(list.size() > 0) {			
				mv.addObject("resultSearch", list);
			}
			System.out.println(list);
			System.out.println(commandMap.get("b_cate1"));
			
			if(commandMap.get("b_cate1").equals("b1")) {
				System.out.println("b1으로 옴");
				mv.setViewName("brand1");				
			}else if(commandMap.get("b_cate1").equals("b2")) {
				System.out.println("b2으로 옴");
				mv.setViewName("brand2");
			}else if(commandMap.get("b_cate1").equals("b3")) {
				System.out.println("b3으로 옴");
				mv.setViewName("brand3");
			}else if(commandMap.get("b_cate1").equals("no")) {
				System.out.println("no로 옴");
				mv.setViewName("notice");
			}
		}
		return mv;
	}
	
	@RequestMapping(value = "notice.do")
	public ModelAndView notice(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		// 임시로 page 만들어주기
				int page = 1;
				if (commandMap.containsKey("page") && Integer.parseInt((String) commandMap.get("page")) > 0) {
					page = Integer.parseInt((String) commandMap.get("page"));
				}
				commandMap.put("page", (page - 1) * 10);// '0'

				List<Map<String, Object>> notice = oService.brand1(commandMap.getMap());
				
				if(notice.size() > 0) {
					
					mv.addObject("notice", notice);
			
					mv.addObject("b_cate1", notice.get(0).get("b_cate1"));
					mv.addObject("b_cate2", commandMap.get("b_cate2"));
					
					mv.addObject("page", page);
					mv.addObject("count", notice.get(0).get("count"));

				}
		return mv;
	}

	@RequestMapping(value = "brand1.do")
	public ModelAndView brand1(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		// 임시로 page 만들어주기
		int page = 1;
		if (commandMap.containsKey("page") && Integer.parseInt((String) commandMap.get("page")) > 0) {
			page = Integer.parseInt((String) commandMap.get("page"));
		}
		commandMap.put("page", (page - 1) * 10);// '0'

		List<Map<String, Object>> brand1 = oService.brand1(commandMap.getMap());
		
		if(brand1.size() > 0) {
			
			mv.addObject("brand1", brand1);
	
			mv.addObject("b_cate1", brand1.get(0).get("b_cate1"));
			mv.addObject("b_cate2", commandMap.get("b_cate2"));
			
			mv.addObject("page", page);
			if (commandMap.get("b_cate2") != null) {
				if (commandMap.get("b_cate2").equals("연필")) {
					mv.addObject("count", brand1.get(0).get("pen_count"));
					
				}else if (commandMap.get("b_cate2").equals("볼펜")) {
					mv.addObject("count", brand1.get(0).get("ball_count"));
			
				}else if (commandMap.get("b_cate2").equals("샤프")) {
					mv.addObject("count", brand1.get(0).get("sha_count"));
					
				}else if (commandMap.get("b_cate2").equals("형광펜")) {
					mv.addObject("count", brand1.get(0).get("hi_count"));
					
				}else if (commandMap.get("b_cate2").equals("만년필")) {
					mv.addObject("count", brand1.get(0).get("foun_count"));
					
				}else if (commandMap.get("b_cate2").equals("기타")) {
					mv.addObject("count", brand1.get(0).get("etc_count"));
				}
			}else if(commandMap.get("b_cate2") == null) {
				mv.addObject("count", brand1.get(0).get("count"));
				System.out.println(brand1.get(0).get("count"));
			}
			
		}

		return mv;
	}

	@RequestMapping(value = "brand2.do")
	public ModelAndView brand2(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		// 임시로 page 만들어주기
		int page = 1;
		if (commandMap.containsKey("page") && Integer.parseInt((String) commandMap.get("page")) > 0) {
			page = Integer.parseInt((String) commandMap.get("page"));
		}
		commandMap.put("page", (page - 1) * 10);// '0'

		List<Map<String, Object>> brand2 = oService.brand2(commandMap.getMap());
		
		if(brand2.size() > 0) {
			
			mv.addObject("brand2", brand2);
	
			mv.addObject("b_cate1", brand2.get(0).get("b_cate1"));
			mv.addObject("b_cate2", brand2.get(0).get("b_cate2"));
			
			mv.addObject("page", page);
			if (commandMap.get("b_cate2") != null) {
				if (commandMap.get("b_cate2").equals("연필")) {
					mv.addObject("count", brand2.get(0).get("pen_count"));
					
				}else if (commandMap.get("b_cate2").equals("볼펜")) {
					mv.addObject("count", brand2.get(0).get("ball_count"));
			
				}else if (commandMap.get("b_cate2").equals("샤프")) {
					mv.addObject("count", brand2.get(0).get("sha_count"));
					
				}else if (commandMap.get("b_cate2").equals("형광펜")) {
					mv.addObject("count", brand2.get(0).get("hi_count"));
					
				}else if (commandMap.get("b_cate2").equals("만년필")) {
					mv.addObject("count", brand2.get(0).get("foun_count"));
					
				}else if (commandMap.get("b_cate2").equals("기타")) {
					mv.addObject("count", brand2.get(0).get("etc_count"));
				}
			}else if(commandMap.get("b_cate2") == null) {
				mv.addObject("count", brand2.get(0).get("count"));	
			}
			
		}

		return mv;
	}

	@RequestMapping(value = "brand3.do")
	public ModelAndView brand3(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		// 임시로 page 만들어주기
		int page = 1;
		if (commandMap.containsKey("page") && Integer.parseInt((String) commandMap.get("page")) > 0) {
			page = Integer.parseInt((String) commandMap.get("page"));
		}
		commandMap.put("page", (page - 1) * 10);// '0'

		List<Map<String, Object>> brand3 = oService.brand3(commandMap.getMap());
		
		if(brand3.size() > 0) {
			
			mv.addObject("brand3", brand3);
	
			mv.addObject("b_cate1", brand3.get(0).get("b_cate1"));
			mv.addObject("b_cate2", brand3.get(0).get("b_cate2"));
			
			mv.addObject("page", page);
			if (commandMap.get("b_cate2") != null) {
				if (commandMap.get("b_cate2").equals("연필")) {
					mv.addObject("count", brand3.get(0).get("pen_count"));
					
				}else if (commandMap.get("b_cate2").equals("볼펜")) {
					mv.addObject("count", brand3.get(0).get("ball_count"));
			
				}else if (commandMap.get("b_cate2").equals("샤프")) {
					mv.addObject("count", brand3.get(0).get("sha_count"));
					
				}else if (commandMap.get("b_cate2").equals("형광펜")) {
					mv.addObject("count", brand3.get(0).get("hi_count"));
					
				}else if (commandMap.get("b_cate2").equals("만년필")) {
					mv.addObject("count", brand3.get(0).get("foun_count"));
					
				}else if (commandMap.get("b_cate2").equals("기타")) {
					mv.addObject("count", brand3.get(0).get("etc_count"));
				}
			}else if(commandMap.get("b_cate2") == null) {
				mv.addObject("count", brand3.get(0).get("count"));	
			}
		}
		return mv;
	}

	@RequestMapping(value = "detail.do")
	public ModelAndView detail(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		List<Map<String, Object>> commdetail = oService.commdetail(commandMap.getMap());
		Map<String, Object> detail = oService.detail(commandMap.getMap());
		
		String old_url = request.getHeader("Referer");
		String old_url2 = old_url.substring(26);
		mv.addObject("old_url2", old_url2);
		System.out.println(old_url2);
		
		// 조회수 + 1
		int num = Integer.parseInt(request.getParameter("b_no"));
		oService.countUp(num);
		
		if (commdetail.size() > 0) {
			mv.addObject("commdetail", commdetail);			
			System.out.println(commdetail.get(0).get("c_content"));
		}
		
		System.out.println(detail);
		mv.addObject("detail", detail);
		
		
		return mv;
	}

	@RequestMapping(value = "write.do")
	public ModelAndView write(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		String old_url = request.getHeader("Referer");
		String old_url2 = old_url.substring(26);
		mv.addObject("old_url2", old_url2);
		
		if (session.getAttribute("id") != null) {
			mv.addObject("b_cate1", commandMap.get("b_cate1"));			
		} else {
			mv.setViewName("redirect:" + old_url2);
		}

		return mv;
	}

//	@RequestMapping (value = "writeInsert.do")
	@PostMapping(value = "writeInsert.do")	
	public ModelAndView writeInsert(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		if (request.getParameter("b_title") != null && request.getParameter("b_content") != null) {			
			commandMap.put("l_nick", session.getAttribute("nick"));
			int result = oService.writeInsert(commandMap.getMap());

			mv.setViewName("redirect:" + commandMap.get("old_url2"));
		} else {
			mv.setViewName("redirect:write.do");
		}

		return mv;
	}
	
	@RequestMapping(value = "delete.do")
	public ModelAndView delete(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("id") != null) {
			int delete = oService.delete(commandMap.getMap());
			if (delete == 1) {
				mv.setViewName("redirect:" + commandMap.get("old_url2"));
			} else {
				mv.setViewName("redirect:detail.do?b_no" + commandMap.get("b_no"));
			}
		}
		
		return mv;
	}
	
	@RequestMapping(value = "update.do")
	public ModelAndView update(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		Map<String, Object> update = oService.update(commandMap.getMap());
		
		
		String old_url = request.getHeader("Referer");
		String old_url2 = old_url.substring(26);
		mv.addObject("old_url2", old_url2);
		
		System.out.println(commandMap.getMap());
		
		if (session.getAttribute("id") != null) {
			mv.addObject("update", update);
		} else {
			mv.setViewName("redirect:" + old_url2);
		}
		
		
//		mv.addObject("b_cate1", commandMap.get("b_cate1"));
//		
//		mv.addObject("b_no", commandMap.get("b_no"));
		
		return mv;
	}
	
	@RequestMapping(value = "updateInsert.do")
	public ModelAndView updateInsert(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		if (request.getParameter("b_title") != null && request.getParameter("b_content") != null) {			
			commandMap.put("l_nick", session.getAttribute("nick"));
			int result = oService.updateInsert(commandMap.getMap());
			System.out.println("result : " + result);
			System.out.println("map : " + commandMap.getMap());

			mv.setViewName("redirect:" + commandMap.get("old_url2"));
		} else {
			mv.setViewName("redirect:update.do");
		}
		
		return mv;
	}
	
	@RequestMapping(value = "boardLikeUp.do", method = RequestMethod.POST)
	public ModelAndView boardLikeUp(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("id") != null) {
			int num = Integer.parseInt(request.getParameter("b_no"));
			oService.boardLikeUp(num);			
		}
		
		return mv;
	}
	
}
