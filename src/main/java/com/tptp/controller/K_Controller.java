package com.tptp.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tptp.service.K_Service;

import com.common.common.CommandMap;

@Controller
public class K_Controller {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "k_Service")
	private K_Service k_Service;

	@RequestMapping(value = "QnAlist.do")
	public ModelAndView QnA(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();

		List<Map<String, Object>> list = k_Service.QnAlist();
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		System.out.println(request.getParameter("url"));

		String url = request.getParameter("url").substring(17);
		String url2 = url.replace(".jsp", ".do");

		if (session.getAttribute("id") != null && session.getAttribute("pw") != null) {

			if (session.getAttribute("id") != null) {
				session.removeAttribute("id");
			}
			if (session.getAttribute("pw") != null) {
				session.removeAttribute("pw");
			}
			if (session.getAttribute("nick") != null) {
				session.removeAttribute("nick");
			}
			if (session.getAttribute("auth") != null) {
				session.removeAttribute("auth");
			}

		} else if (/*session.getAttribute("id") == null && session.getAttribute("pw") == null*/
				 request.getParameter("ID") != null && request.getParameter("PW") != null) {

			Map<String, Object> loginmap = k_Service.login(commandMap.getMap());
			System.out.println("id "+loginmap.get("l_id"));
			
			if (loginmap != null) {
				session.setAttribute("id", loginmap.get("l_id"));
				session.setAttribute("pw", loginmap.get("l_pw"));
				session.setAttribute("nick", loginmap.get("l_nick"));
				session.setAttribute("auth", loginmap.get("l_auth"));
				System.out.println("이건 아이디 세션" + session.getAttribute("id"));
				

			}
		}
		mv.setViewName("redirect:" + url2);
		return mv;
	}

	@RequestMapping(value = "admCommSearch.do")
	public ModelAndView admCommSearch(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();

		if (!request.getParameter("searchCont").equals("")) {

			List<Map<String, Object>> list = k_Service.adSearch(commandMap.getMap());
			mv.addObject("resultSearch", list);
			System.out.println(list.get(0));
			mv.setViewName("admCommList");
		}

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
		ModelAndView mv = new ModelAndView("redirect:join.do");

		if (request.getParameter("id") != null && request.getParameter("nick") != null
				&& request.getParameter("pw1") != null && request.getParameter("eFront") != null
				&& request.getParameter("eBack") != null) {

			String email = request.getParameter("eFront") + "@" + request.getParameter("eBack");
			commandMap.put("email", email);

			int result = k_Service.joinReg(commandMap.getMap());
			if (result == 1) {
				mv.setViewName("main");

			}
		}
		return mv;
	}

	@RequestMapping(value = "checkID.do", method = RequestMethod.POST)
	public @ResponseBody String checkID(HttpServletRequest request, String id, String nick) throws Exception {

		int check = 0;
		if (id != null && nick == null) {
			check = k_Service.checkID(id);

		} else if (nick != null && id == null || id != null) {
			check = k_Service.checkID(nick);
		}
		return String.valueOf(check);
	}

	@RequestMapping(value = "commInsert.do")
	public ModelAndView commInsert(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();

		if (request.getParameter("c_content") != null) {
			int result = k_Service.commInsert(commandMap.getMap());
			System.out.println(result);
		}
		return mv;
	}

	@RequestMapping(value = "commShow.do")
	public ModelAndView commShow(HttpServletRequest request, int b_no) throws Exception {
		ModelAndView mv = new ModelAndView();

		List<Map<String, Object>> list = k_Service.commShow(b_no);
		mv.addObject(list);
		return mv;
	}

	@RequestMapping(value = "LsideB.do")
	public ModelAndView LsideB(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		return mv;
	}

	@RequestMapping(value = "RsideB.do")
	public ModelAndView RsideB(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		return mv;
	}

	@RequestMapping(value = "mypage.do")
	public ModelAndView mypage(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();

		if (session.getAttribute("l_id") != null && session.getAttribute("l_auth") != null
				&& session.getAttribute("l_nick") != null) {

			String nick = (String) session.getAttribute("l_nick");

			List<Map<String, Object>> mylist = k_Service.mylist(nick);
			System.out.println(mylist);
			mv.addObject("mylist", mylist);
		}
		return mv;
	}

	@RequestMapping(value = "index.do")
	public ModelAndView index(HttpServletRequest request) throws Exception {
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
}