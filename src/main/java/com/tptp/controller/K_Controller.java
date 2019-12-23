package com.tptp.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.common.common.CommandMap;
import com.tptp.service.K_Service;

@Controller
public class K_Controller {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "k_Service")
	private K_Service k_Service;

	@RequestMapping(value = "QnAlist.do")
	public ModelAndView QnA(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		List<Map<String, Object>> list = k_Service.QnAlist();
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping(value = "brandBoard.do")
	public ModelAndView brandBoard(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		return mv;
	}

	@RequestMapping(value = "admCommSearch.do")
	public ModelAndView admCommSearch(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();

		if (!request.getParameter("searchCont").equals("")) {

			List<Map<String, Object>> list = k_Service.adSearch(commandMap.getMap());
			mv.addObject("result", list);
			System.out.println(list.get(0));
		}
		mv.setViewName("admCommList");

		return mv;
	}

	@RequestMapping(value = "admCommList.do")
	public ModelAndView admCommList(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admCommList");

		List<Map<String, Object>> list = k_Service.admOper();
		mv.addObject("list", list);

		return mv;
	}

	@RequestMapping(value = "join.do")
	public ModelAndView welcome(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		return mv;
	}
	
	@RequestMapping(value = "joinReg.do", method = RequestMethod.POST)
	public ModelAndView joinReg(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("main");
		
		if (request.getParameter("id") != null && request.getParameter("nick") != null 
			&& request.getParameter("pw1") != null && request.getParameter("eFront") != null
			&& request.getParameter("eBack") != null) {
			
			String email = request.getParameter("eFront") + "@" + request.getParameter("eBack");
			commandMap.put("email", email);
			
			int result = k_Service.joinReg(commandMap.getMap());
			if (result == 0) {
				mv.addObject("main");
			} else {
				mv.setViewName("redirect:join.do");
			}
		}
		return mv;
	}
	
	@RequestMapping(value = "checkID.do", method = RequestMethod.POST)
	public @ResponseBody String checkDouble(HttpServletRequest request, CommandMap commandMap) throws Exception {
		
		System.out.println(commandMap.getMap());
		int check = k_Service.checkId(commandMap.getMap());	
		System.out.println(check);
		
		return String.valueOf(check);
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

	@RequestMapping(value = "commInsert.do")
	public ModelAndView commInsert(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		return mv;
	}
}
