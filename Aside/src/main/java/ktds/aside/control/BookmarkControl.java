package ktds.aside.control;

import javax.servlet.http.HttpSession;

import ktds.aside.dao.BookmarkDao;
import ktds.aside.dao.DiaryDao;
import ktds.aside.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/bookmark")
public class BookmarkControl {

  @Autowired
  BookmarkDao bookmarkdao;

  @RequestMapping("/list_bookmarktiimeline")
  public String listBookmarkTimeLine(HttpSession session, Model model) {
    model.addAttribute("list", bookmarkdao.selectBookmarkList(((User)session.getAttribute("loginInfo")).getUser_no()));
    return "../diary/list_mytimeline.jsp";
  }
  
}
