package ktds.aside.control;


import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import ktds.aside.dao.UserDao;
import ktds.aside.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/aside") //member로 들어오는 mapping 처리한다.
public class UserControl {
 
    //Spring에게 필요한 객체를 요구한다.
    //"나 BoardDao 객체가 필요하니까, BoardControl객체를 만들 때 설정해줘!"
    @Autowired
    UserDao userDao;
    
    //http://localhost:8080/DreamPlus/member/signUp.do
    @RequestMapping("/signin")
    public String signUp(User user){//클라이언트가 http:/.../signUp.do라고 쓸 때 디스패쳐서블릿이 signUp메소드를 호출 
        
      userDao.insert(user);
        
      return "redirect:login.html"; //insert한 후 상위폴더에 index.html로..
    }
    
    @RequestMapping(value="/login",method=RequestMethod.POST)
    public String login(String user_password, String user_email, HttpSession session)
    {
      User user = userDao.getLoginInfo(user_email, user_password);
      
      if(user != null)
      {
        //로그인 성공이라면, 로그인 기본 정보를 세션에 보관한다.
        session.setAttribute("loginInfo", user);
        return "redirect:list_timeline.jsp";
      }else
      {
        return "redirect:login.html";
      }
      
    }
    
    @RequestMapping("/logout")
    public String logout(HttpSession session)
    {
      session.invalidate();
      return "redirect:../";
    }
}
