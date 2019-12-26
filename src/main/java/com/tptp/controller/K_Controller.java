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
	public ModelAndView QnA(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
				
		
		int page = 1;
		if (commandMap.containsKey("page") && Integer.parseInt((String) commandMap.get("page")) > 0) {
			page = Integer.parseInt((String) commandMap.get("page"));
		}
		commandMap.put("page", (page - 1) * 10);// '0'
		List<Map<String, Object>> Qlist = k_Service.QnAlist(commandMap.getMap());
		//System.out.println(Qlist.get(0));
		if(Qlist.size() > 0) {			
			mv.addObject("Qlist", Qlist);
			mv.addObject("b_cate1", Qlist.get(0).get("b_cate1"));
			mv.addObject("B1total", Qlist.get(0).get("pencile"));
			mv.addObject("B1total", Qlist.get(0).get("샤프"));
			mv.addObject("B1total", Qlist.get(0).get("볼펜"));
			mv.addObject("B1total", Qlist.get(0).get("만년필"));
			mv.addObject("B1total", Qlist.get(0).get("형광펜"));
			mv.addObject("B1total", Qlist.get(0).get("기타"));
			mv.addObject("count", Qlist.get(0).get("Qtotal"));
			System.out.println("1."+ Qlist.get(0).get("Qtotal"));
			System.out.println("1."+ Qlist.get(0).get("기타"));
			System.out.println(Qlist.get(0).get("b_cate1"));
			System.out.println(Qlist.get(0));
		
			mv.addObject("page", page);
		}
		return mv;
	}

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();

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
			if (session.getAttribute("countB") != null) {
				session.removeAttribute("countB");
			}
			if (session.getAttribute("countC") != null) {
				session.removeAttribute("countC");
			}

		} else if (session.getAttribute("id") == null && session.getAttribute("pw") == null &&
		request.getParameter("ID") != null && request.getParameter("PW") != null) {

			Map<String, Object> loginmap = k_Service.login(commandMap.getMap());

			if (loginmap != null) {
				mv.addObject("loginmap", loginmap);
				session.setAttribute("id", loginmap.get("l_id"));
				session.setAttribute("pw", loginmap.get("l_pw"));
				session.setAttribute("nick", loginmap.get("l_nick"));
				session.setAttribute("auth", loginmap.get("l_auth"));
				session.setAttribute("countB", loginmap.get("countB"));
				session.setAttribute("countC", loginmap.get("countC"));
				System.out.println(loginmap.get("countB"));
				System.out.println(loginmap.get("countC"));
			}
		}
		mv.setViewName("redirect:" + url2);
		return mv;
	}

	@RequestMapping(value = "admCommSearch.do")
	public ModelAndView admCommSearch(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();

		System.out.println(request.getParameter("b_cate1"));
		if (!request.getParameter("searchCont").equals("")) {
			List<Map<String, Object>> list = k_Service.adSearch(commandMap.getMap());
			if(list.size() > 0) {			
			mv.addObject("resultSearch", list);
			}
			mv.setViewName("admCommList");
		}
		return mv;
	}
	
	@RequestMapping(value = "qnaSearch.do")
	public ModelAndView qnaSearch(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		System.out.println(request.getParameter("b_cate1"));
		if (!request.getParameter("searchCont").equals("")) {
			List<Map<String, Object>> list = k_Service.qnaSearch(commandMap.getMap());
			if(list.size() > 0) {			
				mv.addObject("resultSearch", list);
			}
			mv.setViewName("QnAlist");
		}
		return mv;
	}

	@RequestMapping(value = "admCommList.do")
	public ModelAndView admCommList(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admCommList");
		HttpSession session = request.getSession();
		
		int page = 1;
		if (commandMap.containsKey("page") && Integer.parseInt((String) commandMap.get("page")) > 0) {
			page = Integer.parseInt((String) commandMap.get("page"));
		}
		commandMap.put("page", (page - 1) * 10);// '0'
		
			List<Map<String, Object>> list = k_Service.admOper(commandMap.getMap());
			mv.addObject("count", list.get(0).get("ADtotal"));
			mv.addObject("page", page);
			mv.addObject("list", list);
			mv.addObject("b_cate1", list.get(0).get("b_cate1"));
			System.out.println(list.get(0));
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
	public @ResponseBody String checkID(HttpServletRequest request, String id) throws Exception {

		int check = 0;
		if (id != null) {
			check = k_Service.checkID(id);
		}
		return String.valueOf(check);
	}

	@RequestMapping(value = "checkNick.do", method = RequestMethod.POST)
	public @ResponseBody String checkNick(HttpServletRequest request, String nick) throws Exception {

		int check = 0;
		if (nick != null) {
			check = k_Service.checkNick(nick);
		}
		return String.valueOf(check);
	}

	@RequestMapping(value = "checkPW.do", method = RequestMethod.POST)
	public @ResponseBody String checkPW(HttpServletRequest request, String pw, CommandMap commandmap) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		commandmap.put("id", id);
		commandmap.put("pw", pw);
		int check = 0;
		if (pw != null) {
			check = k_Service.checkPW(commandmap.getMap());
		}
		return String.valueOf(check);
	}
	
	//현재: 커멘트 db에 등록
	@RequestMapping(value = "commUpdate.do", method = RequestMethod.POST)
	public ModelAndView commUpdate(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		
		String url = request.getParameter("url").substring(17);
//		System.out.println(url);
		String url2 = url.replace(".jsp", ".do?b_no=");
//		System.out.println(url2);
		System.out.println(commandMap.get("b_no"));
		String b_no = (String) commandMap.get("b_no");
		
		System.out.println(request.getParameter("ccontent"));
		
		if (session.getAttribute("id") != null && request.getParameter("c_content") != " ") {
			commandMap.put("nick", session.getAttribute("nick"));
			int result = k_Service.commUpdate(commandMap.getMap());
			if (result == 0) {
				System.out.println("실패했습니다.");
			} else if (result == 1) {
				mv.setViewName("redirect:"+url2+b_no );						
			}
		}
		return mv;
	}
	
	//댓글 창 불러오기
	@RequestMapping(value = "likeUp.do")
	public ModelAndView likeUp(HttpServletRequest request, String b_no, String cno, String likeCount) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		
		String url = request.getParameter("url").substring(17);
		String url2 = url.replace(".jsp", ".do?b_no=");
		
		System.out.println(cno);
		System.out.println(likeCount);
		System.out.println("여기 저 있어요22");
//		System.out.println(c_no);
		int result = 0;
		int likeUp = 0;
		
		if (session.getAttribute("id") != null) {
			result = k_Service.likeUp(cno);
			likeUp = Integer.parseInt(likeCount) + 1;
			
			mv.addObject("likeUp", likeUp);
			mv.setViewName("redirect:"+url2+b_no );
			System.out.println(result);
			System.out.println(likeUp);
		} else {
			likeUp = 0;
			System.out.println("여기 저 있어요");
		}
		
		System.out.println("아뇨, 저 여기 있어요");
		return mv;
	}
//	//댓글 수정하기
//	@RequestMapping(value = "commModi.do")
//	public @ResponseBody String commModi(HttpServletRequest request, CommandMap commandMap) throws Exception {
//		ModelAndView mv = new ModelAndView();
//		HttpSession session = request.getSession();
//		
//		commandMap.put("comment", request.getParameter("comment"));
//		commandMap.put("c_no", request.getParameter("c_no"));
//		String mapcomm = null;
//		String c_no = request.getParameter("c_no");
//				
//			int result= k_Service.commModi(commandMap.getMap());
//			if (result == 0) {
//				mapcomm = k_Service.reComm(c_no);
//			}
//			return mapcomm;	
//	}
	
	//댓글 삭제
	@RequestMapping(value = "commDelete.do", method = RequestMethod.POST)
	public ModelAndView commDelete(HttpServletRequest request, int c_no, int b_no) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		
		String url = request.getParameter("url").substring(17);
		System.out.println(url);
		String url2 = url.replace(".jsp", ".do?b_no=");
		
			int result = k_Service.commDelete(c_no);
			if (result == 1) {
				mv.setViewName("redirect:" + url2 + b_no);
				System.out.println(url2);
			} else if(result == 0) {
				mv.setViewName(url2 + b_no);
				System.out.println("url2");
			}
		return mv;
	}

	@RequestMapping(value = "LsideB.do")
	public ModelAndView LsideB(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		return mv;
	}

	@RequestMapping(value = "RsideB.do")
	public ModelAndView RsideB(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		
		return mv;
	}
	
	@RequestMapping(value = "RsideB2.do")
	public ModelAndView RsideB2(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		
		return mv;
	}

	@RequestMapping(value = "mypage.do")
	public ModelAndView mypage(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();

		if (session.getAttribute("id") != null && session.getAttribute("auth") != null
				&& session.getAttribute("nick") != null) {

			String id = (String) session.getAttribute("id");

			Map<String, Object> mylist = k_Service.mylist(id);
			mv.addObject("mylist", mylist);
		}
		return mv;
	}

	@RequestMapping(value = "nickUpdate.do")
	public ModelAndView nickUpdate(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		commandMap.put("id", session.getAttribute("id"));
		System.out.println(request.getParameter("renick"));
		if (session.getAttribute("id") != null && session.getAttribute("nick") != null) {

			int result = k_Service.nickUpdate(commandMap.getMap());

			if (result == 0) {
				mv.setViewName("mypage");
			} else if (result == 1) {
				session.setAttribute("nick", request.getParameter("renick"));
				mv.setViewName("redirect:mypage.do");
			}
		}
		return mv;
	}

	@RequestMapping(value = "repw.do")
	public ModelAndView repw(HttpServletRequest request, CommandMap commandMap ,String pw2) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();

		if (session.getAttribute("id") != null && session.getAttribute("pw") != null) {
			String id = (String) request.getAttribute("id");
			commandMap.put("id", id);
			commandMap.put("pw2", pw2);
			
			int result = k_Service.pwModi(commandMap.getMap());
			System.out.println(result);
			if (result == 1) {
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
				mv.setViewName("main");
			}
			mv.setViewName("redirect:repw.do");
		}
		return mv;
	}

	@RequestMapping(value = "index.do")
	public ModelAndView index(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		return mv;
	}
//
//	@RequestMapping(value = "repw.do")
//	public ModelAndView repw(HttpServletRequest request) throws Exception {
//		ModelAndView mv = new ModelAndView();
//		
//		return mv;
//	}

	@RequestMapping(value = "lostLogin.do")
	public ModelAndView lostLogin(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		return mv;
	}
}
