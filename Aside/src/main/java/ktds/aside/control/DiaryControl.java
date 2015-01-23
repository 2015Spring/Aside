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
  	    User user = (User)session.getAttribute("loginInfo");
  	    diary.setUser_no(user.getUser_no());
		System.out.println("다이어리 내용을 찍어보겠습니다");
		System.out.println("diary_no : " + diary.getDiary_no());
		System.out.println("date : " + diary.getDiary_date());
		System.out.println("context : " + diary.getDiary_context());
		System.out.println("open : " + diary.getDiary_isopen());
		System.out.println("comment : " + diary.getDiary_iscomment());
		diaryDao.insert(diary);
		return "redirect:list_timeline.do";
	}
	
	@RequestMapping("/list_timeline")
    public String listTimeline(Model model) {
	    model.addAttribute("list", diaryDao.selectList());
        return "../diary/list_timeline.jsp";
    }
	
	@RequestMapping("/view")
    public String view(int no, Model model) {
	  System.out.println("nnnnoooooooooooo :" + no);
        model.addAttribute("diary", diaryDao.selectOne(no));
        System.out.println(model);
        return "/diary/view.jsp";
    }
}
