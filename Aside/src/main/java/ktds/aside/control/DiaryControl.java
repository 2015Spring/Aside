package ktds.aside.control;

import ktds.aside.dao.DiaryDao;
import ktds.aside.domain.Diary;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/aside")
public class DiaryControl {

	@Autowired
	DiaryDao diaryDao;

	@RequestMapping("/add")
	public String add(Diary diary) {
		System.out.println("sldkfjlsjflkjsfdjsfljk");
		diaryDao.insert(diary);
		return "redirect:list_timeline.jsp";
	}
}
