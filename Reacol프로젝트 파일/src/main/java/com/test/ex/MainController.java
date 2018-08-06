package com.test.ex;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.board.BoardDAO;
import com.test.board.BoardDTO;
import com.test.service.MemberService;

@Controller
public class MainController {

	@Inject
	MemberService service;

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("home")
	public String Home() {
		return "homepage";
	}

	@RequestMapping("Login")
	public String Login() {

		return "Login";
	}

	@RequestMapping("joinprocess")
	public String JoinProcess(Model model, @RequestParam("id") String id, @RequestParam("name") String name,
			@RequestParam("pass") String password, @RequestParam("email") String email, HttpServletResponse response) {
		String outcome = "";
		MemberDAO mapper = sqlSession.getMapper(MemberDAO.class);

		String idcheck = mapper.selectMember(id);
		System.out.println(idcheck);
			if (idcheck == null) {

					MemberDTO member = new MemberDTO();
					member.setId(id);
					member.setName(name);
					member.setPassword(password);
					member.setEmail(email);

					mapper.insert(member);
					outcome = "회원가입 완료";
					
			} else {
				outcome = "이미 회원가입된 아이디입니다";
			}
		

		model.addAttribute("outcome", outcome);
		model.addAttribute("url", "Login");
		return "Login";
	}

	@RequestMapping("loginprocess")
	public String LoginProcess(HttpSession session, Model model, @RequestParam("id") String id,
			@RequestParam("password") String password) {
		String page = "";
		String outcome = "";

		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPassword(password);

		if (session.getAttribute("loginProcess") != null) {
			session.removeAttribute("loginProcess");
		}
		
		MemberDTO mdto = service.loginProcess(dto);

		if (mdto != null) {
			session.setAttribute("loginProcess", dto);
			session.setAttribute("id", dto.getId());
			if(mdto.getId().equals("sbadmin")) {
				page = "AdminPage";
			} else{
				page = "homepage";
			}
			
		} else {
			page = "redirect:Login";
			outcome = "로그인 실패";
		}

		model.addAttribute("outcome", outcome);
		model.addAttribute("url", "Login");
		return page;
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		/*
		 * session.removeAttribute("loginProcess"); session.removeAttribute("id");
		 */
		return "redirect:home";
	}

	@RequestMapping("Board")
	public String Board(Model model) {

		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);
		ArrayList<BoardDTO> dao = mapper.boardSelect();
		model.addAttribute("list", dao);

		return "Board";
	}

	@RequestMapping("context")
	public String context(Model model, HttpSession session, @RequestParam("no") int no) {
		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);
		BoardDTO dto = mapper.contextone(no);

		mapper.hits(dto);
		model.addAttribute("list", dto);
		return "context";
	}

	@RequestMapping("modify")
	public String modify(Model model, HttpSession session, @RequestParam("no") int no, @RequestParam("id") String id) {
		String Msg = "";
		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);
		String sid = (String) session.getAttribute("id");
		if (sid==null) {
			Msg = "로그인 후 이용하세요";
			model.addAttribute("url", "Login");
		} else {
			if (sid.equals(id)||sid.equals("sbadmin")) {
				BoardDTO dto = mapper.contextone(no);
				model.addAttribute("list",dto);
			} else {
				Msg= "계시물에 대한 권한이 없습니다";
				model.addAttribute("url", "Board");
			}
		}
		
		model.addAttribute("Msg",Msg);
		
		return "Board_Modify";
	}
	@RequestMapping("modifyProcess")
	public String modifyProcess(Model model,@RequestParam("title") String title,@RequestParam("context") String context,@RequestParam("no") int no) {
		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);
		BoardDTO dto = new BoardDTO();
		dto.setNo(no);
		dto.setTitle(title);
		dto.setContext(context);
		mapper.boardModify(dto);
		
		model.addAttribute("list",dto);
		
		return "context";
	}
	@RequestMapping("delete")
	public String delete(Model model,@RequestParam("no") int no,@RequestParam("id") String id) {
		String page = "";
		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);
		BoardDTO dto = new BoardDTO();
		dto.setNo(no);
		mapper.boardDelete(dto);
		if(id.equals("sbadmin")) {
			page = "redirect:AdminBoard";
		} else {
			page = "redirect:Board";
		}

		return page;
	}
	@RequestMapping("boardMake")
	public String boardMake(Model model, HttpSession session) {
		String sid = (String) session.getAttribute("id");
		if (sid==null) {
			model.addAttribute("Msg","로그인 후 이용하세요");
			model.addAttribute("url", "Login");
			
		}
		
		return "Board_Make";
	}
	@RequestMapping("boardMakeProcess")
	public String boardMakeProcess(Model model,HttpSession session,@RequestParam("title") String title,@RequestParam("context") String context) {
		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);
		BoardDTO dto = new BoardDTO();
		dto.setId((String) session.getAttribute("id"));
		dto.setTitle(title);
		dto.setContext(context);
		mapper.insert(dto);
		
		return "redirect:Board";
	}
	@RequestMapping("AdminBoard")
	public String AdminBoard(Model model) {
		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);
		ArrayList<BoardDTO> dao = mapper.boardSelect();
		model.addAttribute("list", dao);
		return "AdminBoard";
	}
	@RequestMapping("AdminMember")
	public String AdminMember(Model model) {
		MemberDAO mapper = sqlSession.getMapper(MemberDAO.class);
		ArrayList<MemberDTO> dao = mapper.memberSelect();
		
		for(int i=0; i<dao.size(); i++) {
			if(dao.get(i).getId().equals("sbadmin")) {
				dao.remove(i);
			}
		}
		model.addAttribute("list", dao);
		return"AdminMember";
	}
	@RequestMapping("Admin_Member_Modify")
	public String Admin_Member_Modify(Model model,@RequestParam("id") String id) {
		MemberDAO mapper = sqlSession.getMapper(MemberDAO.class);
		MemberDTO dao = mapper.selectMemberOne(id);
		
		model.addAttribute("list", dao);
		
		return "Admin_Member_Modify";
	}
	@RequestMapping("Member_Modify")
	public String Member_Modify(Model model,HttpSession session) {
		String id = (String) session.getAttribute("id");
		MemberDAO mapper = sqlSession.getMapper(MemberDAO.class);
		MemberDTO dao = mapper.selectMemberOne(id);
		
		model.addAttribute("list", dao);
		
		return "Member_Modify";
	}
	@RequestMapping("memberModifyProcess")
	public String memberModifyProcess(HttpSession session,@RequestParam("id") String id,@RequestParam("name") 
	String name,@RequestParam("password") String password,@RequestParam("email") String email) {
		String page = "";
		MemberDAO mapper = sqlSession.getMapper(MemberDAO.class);
		MemberDTO dao = new MemberDTO();
		dao.setId(id);
		dao.setName(name);
		dao.setPassword(password);
		dao.setEmail(email);
		mapper.modifyMember(dao);
		String sid = (String) session.getAttribute("id");
		if(sid.equals("sbadmin")) {
			page = "redirect:AdminMember";
		} else {
			page = "homepage";
		}
		
		return page;
	}
	@RequestMapping("MemberDelete")
	public String MemberDelete(HttpSession session,@RequestParam("id") String id) {
		String page = "";
		MemberDAO mapper = sqlSession.getMapper(MemberDAO.class);
		mapper.deleteMember(id);
		String sid = (String) session.getAttribute("id");
		if(sid.equals("sbadmin")) {
			page = "redirect:AdminMember";
		} else {
			session.invalidate();
			page = "homepage";
		}
		return page;
	}
	
	

}