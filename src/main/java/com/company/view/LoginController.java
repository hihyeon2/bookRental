package com.company.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.biz.rental.RentalVO;
import com.company.biz.user.UserService;
import com.company.biz.user.UserVO;

@Controller
public class LoginController {
   
   @Autowired
   private UserService userService;

   @RequestMapping(value="/login.do",method = RequestMethod.POST)
   public String login(UserVO vo,HttpSession session, HttpServletResponse response) throws IOException {
      System.out.println("로그인 인증 요청.");
      response.setContentType("text/html; charset=utf-8");
      response.setCharacterEncoding("utf-8");
      PrintWriter out = response.getWriter();
      try {
      if(vo.getId()==null || vo.getId().equals(""))
         throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다.");
      // 3. 화면 네비게이션
      if(userService.getUser(vo).getId().equals("admin") && userService.getUser(vo).getPassword().equals("1234")) {
    	 // 관리자가 로그인 했을 때,
         session.setAttribute("userName", userService.getUser(vo).getName());
         return "forward:manager-page.jsp";
      }else if (userService.getUser(vo) != null) {
    	 // id랑 pw로 검색을 해서 해당 회원이 존재할 때,
         session.setAttribute("userName", userService.getUser(vo).getName());
         session.setAttribute("id", userService.getUser(vo).getId());
         //session.setAttribute("vo",userService.getUser(vo));
         return "redirect:startPage.jsp";
      } else {
         return "login";
      }} catch(NullPointerException e) {
    	  System.out.println("NullPointerException 발생");
    	  out.print("<script>alert('아이디 또는 비밀번호가 일치하지 않습니다.');location.href='login.do';</script>");
      }
	return null;
   }
   
   @RequestMapping(value="/login.do",method = RequestMethod.GET)
   public String loginView(@ModelAttribute("user") UserVO vo) {
      System.out.println("로그인 화면으로 이동.");
//      vo.setId("hong");
//      vo.setPassword("1234");
      return "login";
   }
   
   @RequestMapping(value="/join.do",method = RequestMethod.GET)
   public String joinView() {
      System.out.println("회원가입 화면으로 이동.");
      return "join";
   }
   
   @RequestMapping(value="/join.do",method = RequestMethod.POST)
   public void join(UserVO vo, HttpServletResponse response) throws IOException {
      System.out.println("회원가입 추가 요청.");  
      response.setContentType("text/html; charset=utf-8");
      response.setCharacterEncoding("utf-8");
      PrintWriter out = response.getWriter();
      userService.insertUser(vo);
      out.print("<script>alert('가입되었습니다.');location.href='login.do';</script>");
      out.close();
   }
   
   @RequestMapping(value="/getMember.do",method = RequestMethod.GET)
   public String getMemberView(UserVO vo,HttpSession session){
      System.out.println("회원멤버화면 요청.");
      session.setAttribute("vo",userService.getMember(vo));
      return "getMember";
   }
   @RequestMapping(value="/getMember.do",method = RequestMethod.POST)
   public void getMember(UserVO vo,HttpSession session,HttpServletResponse response,HttpServletRequest request) throws IOException {
      System.out.println("회원멤버 상세 요청.");
      userService.updateUser(vo);
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");
      PrintWriter out=response.getWriter();
      System.out.println(userService.getUser(vo).getId());
      out.print("<script>alert('수정되었습니다.');location.href='getMember.do?id="+userService.getUser(vo).getId()+"';</script>");
   }
   
   @RequestMapping("/logout.do")
   public void logout(HttpSession session,HttpServletResponse response,HttpServletRequest request) throws IOException {
      session.invalidate();
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");
      PrintWriter out=response.getWriter();
      out.print("<script>alert('로그아웃되었습니다.');location.href='login.do';</script>");
   }
   
   @RequestMapping(value="/idCheckCtrl.do",method = RequestMethod.POST)
   public void idCheckCtrl(UserVO vo,HttpServletResponse response) throws IOException {
      System.out.println("아이디 중복 체크");
      PrintWriter out=response.getWriter();
      if(userService.getMember(vo)!=null) {
         //아이디가 존재하는 경우
         out.print("NOT_USE_ID");
      }else {
         out.print("USE_ID");
      }
   }
   
   @RequestMapping(value =  "/myPage.do",method = RequestMethod.GET)
   public String myPage(HttpSession session,HttpServletRequest request,HttpServletResponse response) {
      if(request.getSession().getAttribute("id") == null) {
            return "login";
        }
      return "memberMypage";
   }
   
   // 관리자
   @RequestMapping("/getUserList.do")
   public String getUserList(UserVO vo, Model model) {
      System.out.println("회원 리스트 요청");
      model.addAttribute("userList", userService.getUserList(vo));
      return "manageUserList";
   }
   
   @RequestMapping("/getUserInfo.do")
   public String getUserInfo(UserVO uvo, Model model, RentalVO rvo) {
      System.out.println("관리자 페이지에서 회원정보 요청");
      model.addAttribute("user", userService.getUserInfo(uvo));
      return "manageUser";
   }
   
   @RequestMapping(value="/updateUser.do",method=RequestMethod.POST)
   public String updateUser(UserVO vo, Model model) {
      System.out.println("관리자 페이지에서 회원정보 수정");
      userService.updateUser(vo);
      System.out.println("수정 완료");
      model.addAttribute("user", userService.getUserInfo(vo));
      return "manageUser";
   }
   
   @RequestMapping("/getUserManage.do")
   public String getUserManage(UserVO vo, Model model) {
      System.out.println("관리자 페이지에서 회원정보 요청");
      model.addAttribute("user", userService.getUserInfo(vo));
      return "manageUserUpdate";
   }
   
   // 관리자 페이지에서 회원 탈퇴
   @RequestMapping("/deleteUserManage.do")
   public String deleteUserManage(UserVO vo) {
      System.out.println("관리자 페이지에서 회원 탈퇴");
      userService.deleteUser(vo);
      return "redirect:getUserList.do";
   }

}