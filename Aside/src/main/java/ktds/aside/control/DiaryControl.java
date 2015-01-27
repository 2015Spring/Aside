package ktds.aside.control;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import ktds.aside.dao.DiaryDao;
import ktds.aside.dao.UserDao;
import ktds.aside.domain.Diary;
import ktds.aside.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/diary")
public class DiaryControl {

  @Autowired
  DiaryDao diaryDao;
  
  @Autowired
  UserDao userDao;
  
  @Autowired
  ServletContext context;

  @RequestMapping("/add")
  public String add(Diary diary, HttpSession session, MultipartFile file) {
    System.out.println("add.do 들어왔숑");
    User user = (User) session.getAttribute("loginInfo");
    diary.setUser_no(user.getUser_no());
    String realPath = context.getRealPath("/files");
    String filename = "photo_" + System.currentTimeMillis();
    try {
      System.out.println("경로 : " + realPath + "/" + filename);
      file.transferTo(new File(realPath + "/" + filename));
      diary.setDiary_image(filename);
      System.out.println(diary.getDiary_image());
    } catch (IllegalStateException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
    diaryDao.insert(diary);
    return "redirect:list_mytimeline.do";
  }

  @RequestMapping("/list_mytimeline")
  public String listTimeline(HttpSession session, Model model) {
      model.addAttribute("list", diaryDao.selectMyList(((User)session.getAttribute("loginInfo")).getUser_no()));
      return "../diary/list_mytimeline.jsp";
  }

  @RequestMapping("/view")
  public String view(int no, Model model, HttpSession session) {
      model.addAttribute("list", diaryDao.selectComment(no));
      model.addAttribute("diary", diaryDao.selectOne(no));
      model.addAttribute("loginInfo", ((User) session.getAttribute("loginInfo")));
      return "/diary/view.jsp";
  }
  
  @RequestMapping("/comment")
  public String comment(int no, Model model) {
      model.addAttribute("list", diaryDao.selectComment(no));
      model.addAttribute("diary", diaryDao.selectOne(no));
      return "/diary/comment.jsp";
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
  public String listOtherList(Model model, HttpSession session) {
    model.addAttribute("list", diaryDao.selectOtherList(((User) session.getAttribute("loginInfo")).getUser_no()));
    model.addAttribute("loginInfo", ((User) session.getAttribute("loginInfo")));
    return "../diary/list_othertimeline.jsp";
  }
  
  @RequestMapping("/list_bookmarktimeline")
  public String listBookmarkTimeLine(HttpSession session, Model model) {
    model.addAttribute("list", diaryDao.selectBookmarkList(((User)session.getAttribute("loginInfo")).getUser_no()));
    return "../diary/list_bookmarktimeline.jsp";
  }
  
  @RequestMapping("/logout")
  public String logout(HttpSession session)
  {
    session.invalidate();
    return "redirect:../";
  }
  
  @RequestMapping("/signout")
  public String signout(HttpSession session)
  {
    userDao.delete(((User)session.getAttribute("loginInfo")).getUser_no());
    session.invalidate();
    return "redirect:../";
  }
  
  @RequestMapping("/setpassword")
  public String setpassword(HttpSession session)
  {
    userDao.delete(((User)session.getAttribute("loginInfo")).getUser_no());
    session.invalidate();
    return "redirect:../";
  }
}
