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
    User user = (User) session.getAttribute("loginInfo");
    diary.setUser_no(user.getUser_no());
    
    // 이미지 처리
    if(file.getOriginalFilename().length()>0){
	    String realPath = context.getRealPath("/files");
	    String filename = "photo_" + System.currentTimeMillis();
	    try {
	      file.transferTo(new File(realPath + "/" + filename));
	      diary.setDiary_image(filename);
	    } catch (IllegalStateException e) {
	      e.printStackTrace();
	    } catch (IOException e) {
	      e.printStackTrace();
	    }
    }
    
    diaryDao.insert(diary);
    return "redirect:list_mytimeline.do?viewType=1";
  }
  
  @RequestMapping("/view")
  public String view(int no, Model model, HttpSession session) {
	  Diary diary = new Diary();
	  diary.setDiary_no(no);
	  diary.setUser_no(((User) session.getAttribute("loginInfo")).getUser_no());
	  
      model.addAttribute("list", diaryDao.selectComment(no));
      model.addAttribute("diary", diaryDao.selectOne(diary));
      model.addAttribute("loginInfo", ((User) session.getAttribute("loginInfo")));
      return "/diary/view.jsp";
  }
  
  @RequestMapping("/comment")
  public String comment(int no, Model model) {
	  Diary diary = new Diary();
	  diary.setDiary_no(no);
	  
      model.addAttribute("list", diaryDao.selectComment(no));
      model.addAttribute("diary", diaryDao.selectOne(diary));
      return "/diary/comment.jsp";
  }
  
  @RequestMapping("/delete")
  public String delete(int no) {
	  diaryDao.delete(no);
	  return "redirect:list_mytimeline.do?viewType=1";
  }
  
  @RequestMapping("/update")
  public String update(Diary diary, MultipartFile file) {
	  // 이미지 처리
	  if(file.getOriginalFilename().length()>0){
		 String realPath = context.getRealPath("/files");
		 String filename = "photo_" + System.currentTimeMillis();
		 try {
		    file.transferTo(new File(realPath + "/" + filename));
		    diary.setDiary_image(filename);
		 } catch (IllegalStateException e) {
		    e.printStackTrace();
		 } catch (IOException e) {
		    e.printStackTrace();
		 }
	 }
	diaryDao.update(diary);
	return "redirect:view.do?no="+diary.getDiary_no();
  }
  
  @RequestMapping("/list_mytimeline")
  public String listTimeline(HttpSession session, Model model, int viewType){
      model.addAttribute("list", diaryDao.selectMyList(((User)session.getAttribute("loginInfo")).getUser_no()));
      model.addAttribute("viewType", viewType);
      return "../diary/list_mytimeline.jsp?viewType=1";
  }
  
  @RequestMapping("/list_othertimeline")
  public String listOtherList(Model model, HttpSession session, int viewType) {
	  model.addAttribute("list", diaryDao.selectOtherList(((User) session.getAttribute("loginInfo")).getUser_no()));
	  model.addAttribute("loginInfo", ((User) session.getAttribute("loginInfo")));
	  model.addAttribute("viewType", viewType);
	  return "../diary/list_othertimeline.jsp?viewType=1";
  }
  
  @RequestMapping("/list_bookmarktimeline")
  public String listBookmarkTimeLine(HttpSession session, Model model, int viewType) {
	  model.addAttribute("list", diaryDao.selectBookmarkList(((User)session.getAttribute("loginInfo")).getUser_no()));
	  model.addAttribute("viewType", viewType);
	  return "../diary/list_bookmarktimeline.jsp?viewType=1";
  }
  
  @RequestMapping("/list_mytimeline_add")
  public String listMytimelineAdd(HttpSession session, Model model, int page){
	  model.addAttribute("list", diaryDao.selectMyListAdd(((User)session.getAttribute("loginInfo")).getUser_no(), page));
	  return "list_mytimeline_add.jsp";
  }
  
  @RequestMapping("/list_othertimeline_add")
  public String listOthertimelineAdd(HttpSession session, Model model, int page){
	  model.addAttribute("list", diaryDao.selectOtherListAdd(((User) session.getAttribute("loginInfo")).getUser_no(), page));
	  model.addAttribute("loginInfo", ((User) session.getAttribute("loginInfo")));
	  return "list_othertimeline_add.jsp";
  }
  
  @RequestMapping("/list_bookmarktimeline_add")
  public String listBookmarktimelineAdd(HttpSession session, Model model, int page){
	  model.addAttribute("list", diaryDao.selectBookmarkListAdd(((User) session.getAttribute("loginInfo")).getUser_no(), page));
	  model.addAttribute("loginInfo", ((User) session.getAttribute("loginInfo")));
	  return "list_bookmarktimeline_add.jsp";
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
  
  @RequestMapping("/select_date")
  public String selectDate(HttpSession session,Model model)
  {
    model.addAttribute("list", diaryDao.selectDate(((User)session.getAttribute("loginInfo")).getUser_no()));
    return "../diary/list_myCalendar.jsp";
  }
  
}
