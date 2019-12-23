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

	@RequestMapping(value = "notice.do")
	public ModelAndView notice(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		// 임시로 page 만들어주기
		int page = 1;
		if (commandMap.containsKey("page") && Integer.parseInt((String) commandMap.get("page")) > 0) {
			page = Integer.parseInt((String) commandMap.get("page"));
		}
		
		commandMap.put("page", (page - 1) * 10);// '0'
		List<Map<String, Object>> notice = oService.notice(commandMap.getMap());
		
		mv.addObject("notice", notice);
		mv.addObject("page", page);

		mv.addObject("b_cate1", notice.get(0).get("b_cate1"));
		System.out.println(commandMap.getMap());


		if (notice.size() > 0) {
			// 총페이지는?
			// System.out.println("총 글의 수 : " + list.get(0).get("COUNT"));
			mv.addObject("count", notice.get(0).get("count"));
		}
		return mv;
	}

	@RequestMapping(value = "brand1.do")
	public ModelAndView brand1(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		// 임시로 page 만들어주기
		int page = 1;
		if (commandMap.containsKey("page") && Integer.parseInt((String) commandMap.get("page")) > 0) {
			page = Integer.parseInt((String) commandMap.get("page"));
		}
		commandMap.put("page", (page - 1) * 10);// '0'

		List<Map<String, Object>> brand1 = oService.brand1(commandMap.getMap());

		mv.addObject("brand1", brand1);

		mv.addObject("b_cate1", brand1.get(0).get("b_cate1"));

		mv.addObject("page", page);

		if (brand1.size() > 0) {
			// 총페이지는?
			// System.out.println("총 글의 수 : " + list.get(0).get("COUNT"));
			mv.addObject("count", brand1.get(0).get("count"));
		}

		return mv;
	}

	@RequestMapping(value = "brand2.do")
	public ModelAndView brand2(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();

		// 임시로 page 만들어주기
		int page = 1;
		if (commandMap.containsKey("page") && Integer.parseInt((String) commandMap.get("page")) > 0) {
			page = Integer.parseInt((String) commandMap.get("page"));
		}
		commandMap.put("page", (page - 1) * 10);// '0'

		List<Map<String, Object>> brand2 = oService.brand2(commandMap.getMap());

		mv.addObject("brand2", brand2);

		mv.addObject("b_cate1", brand2.get(0).get("b_cate1"));

		mv.addObject("page", page);

		if (brand2.size() > 0) {
			// 총페이지는?
			// System.out.println("총 글의 수 : " + list.get(0).get("COUNT"));
			mv.addObject("count", brand2.get(0).get("count"));
		}

		return mv;
	}

	@RequestMapping(value = "brand3.do")
	public ModelAndView brand3(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();

		// 임시로 page 만들어주기
		int page = 1;
		if (commandMap.containsKey("page") && Integer.parseInt((String) commandMap.get("page")) > 0) {
			page = Integer.parseInt((String) commandMap.get("page"));
		}
		commandMap.put("page", (page - 1) * 10);// '0'

		List<Map<String, Object>> brand3 = oService.brand3(commandMap.getMap());

		mv.addObject("brand3", brand3);

		mv.addObject("b_cate1", brand3.get(0).get("b_cate1"));

		mv.addObject("page", page);

		if (brand3.size() > 0) {
			// 총페이지는?
			// System.out.println("총 글의 수 : " + list.get(0).get("COUNT"));
			mv.addObject("count", brand3.get(0).get("count"));
		}

		return mv;
	}

	@RequestMapping(value = "detail.do")
	public ModelAndView detail(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> detail = oService.detail(commandMap.getMap());

		// 조회수 + 1
		int num = Integer.parseInt(request.getParameter("b_no"));
		oService.countUp(num);

		mv.addObject("detail", detail);

		return mv;
	}

	@RequestMapping(value = "write.do")
	public ModelAndView write(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("b_cate1 :" + commandMap.get("b_cate1"));
		mv.addObject("b_cate1", commandMap.get("b_cate1"));

		return mv;
	}

//	@RequestMapping (value = "writeInsert.do")
	@PostMapping(value = "writeInsert.do")
	public ModelAndView writeInsert(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();

		if (request.getParameter("b_title") != null && request.getParameter("b_content") != null) {

			commandMap.put("l_nick", "bill");
			int result = oService.writeInsert(commandMap.getMap());

//			String old_url = request.getHeader("Referer");
//			System.out.println(old_url);
			mv.setViewName("redirect:brand1.do");
		} else {
			mv.setViewName("redirect:write.do");
		}

		return mv;
	}
	
	@RequestMapping(value = "delete.do")
	public ModelAndView delete(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		
//		System.out.println(request.getParameter("url"));
//		String url = request.getParameter("url").substring(17);
//		String url2 = url.replace(".jsp", ".do");
//		String old_url = request.getHeader("Referer");
//		String old_url2 = old_url.substring(26);
//		System.out.println(url2);
		int delete = oService.delete(commandMap.getMap());
		
		if (delete == 1) {
//			mv.setViewName("redirect:" + url2);
			mv.setViewName("redirect:brand1.do");
		}
		mv.addObject("delete", delete);
	
		return mv;
	}
	
	@RequestMapping(value = "update.do")
	public ModelAndView update(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("b_cate1", commandMap.get("b_cate1"));
		mv.addObject("b_no", commandMap.get("b_no"));
		System.out.println("b_cate1 :" + commandMap.get("b_cate1"));
		System.out.println("b_no :" + commandMap.get("b_no"));
		
		return mv;
	}
	
	@RequestMapping(value = "updateInsert.do")
	public ModelAndView updateInsert(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = oService.updateInsert(commandMap.getMap());
		System.out.println("b_no : " + commandMap.get("b_no"));
		System.out.println("b_cate1 : " + commandMap.get("b_cate1"));
		System.out.println("b_cate2 : " + commandMap.get("b_cate2"));
		System.out.println("b_title : " + commandMap.get("b_title"));
		System.out.println("b_content : " + commandMap.get("b_content"));
		
		mv.setViewName("redirect:brand1.do");
		
		return mv;
	}
}
