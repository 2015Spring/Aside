package ktds.aside.control;

import javax.servlet.http.HttpSession;

import ktds.aside.dao.DiaryDao;
import ktds.aside.domain.Diary;
import ktds.aside.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/diary")
public class DiaryControl {

  @Autowired
  DiaryDao diaryDao;

  @RequestMapping("/add")
  public String add(Diary diary, HttpSession session) {
    User user = (User) session.getAttribute("loginInfo");
    diary.setUser_no(user.getUser_no());
    diaryDao.insert(diary);
    return "redirect:list_mytimeline.do";
  }

  @RequestMapping("/list_mytimeline")
  public String listTimeline(HttpSession session, Model model) {
    model.addAttribute("list", diaryDao.selectMyList(((User)session.getAttribute("loginInfo")).getUser_no()));
    return "../diary/list_mytimeline.jsp";
  }

  @RequestMapping("/view")
  public String view(int no, Model model) {
    model.addAttribute("diary", diaryDao.selectOne(no));
    return "/diary/view.jsp";
  }

  @RequestMapping("/delete")
  public String delete(int no) {
    diaryDao.delete(no);
    return "redirect:list_mytimeline.do";
  }

  @RequestMapping("/update")
  public String update(Diary diary) {
    diaryDao.update(diary);
    return "redirect:view.do?no="+diary.getDiary_no();
  }
  
  @RequestMapping("/list_othertimeline")
  public String listOtherList(Model model) {
    model.addAttribute("list", diaryDao.selectOtherList());
    return "../diary/list_othertimeline.jsp";
  }
  
  @RequestMapping("/list_bookmarktimeline")
  public String listBookmarkTimeLine(HttpSession session, Model model) {
    model.addAttribute("list", diaryDao.selectBookmarkList(((User)session.getAttribute("loginInfo")).getUser_no()));
    return "../diary/list_bookmarktimeline.jsp";
  }
}
