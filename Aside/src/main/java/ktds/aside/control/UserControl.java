package ktds.aside.control;


import javax.servlet.http.HttpSession;

import ktds.aside.dao.UserDao;
import ktds.aside.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/aside") 
public class UserControl {
 
    @Autowired
    UserDao userDao;
    
    @RequestMapping("/signin")
    public String signUp(User user){ 
        
      userDao.insert(user);
        
      return "redirect:login.html"; 
    }
    
    @RequestMapping(value="/login",method=RequestMethod.POST)
    public String login(String user_password, String user_email, HttpSession session)
    {
      User user = userDao.getLoginInfo(user_email, user_password);
      
      if(user != null)
      {
        session.setAttribute("loginInfo", user);
        return "redirect:../diary/list_timeline.jsp";
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