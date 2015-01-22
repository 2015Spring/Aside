package ktds.aside.control;

import javax.servlet.http.HttpSession;

import ktds.aside.dao.DiaryDao;
import ktds.aside.domain.Diary;
import ktds.aside.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/aside")
public class DiaryControl {

	@Autowired
	DiaryDao diaryDao;

	@RequestMapping("/add")
	public String add(Diary diary, HttpSession session) {
		System.out.println("sldkfjlsjflkjsfdjsfljk");
//		User user = (User)session.getAttribute("loginInfo");
//		diary.setUser_no(user.getUser_no());
//		diaryDao.insert(diary);
		return "redirect:list_timeline.jsp";
	}
}
