package ktds.aside.control;

import ktds.aside.dao.EmailDao;
import ktds.aside.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmailControl {

	@Autowired
	JavaMailSender mailSender;

	@Autowired
	EmailDao emailDao;

	@RequestMapping("/email/findpassword")
	public String signUp(String user_email) {
		int user_no = ((User) emailDao.selectOne(user_email)).getUser_no();
		String title = "[Aside] Please reset your password!";
		String content = "We heard that you lost your GitHub password. Sorry about that!\n\n";
		content += "But don't worry! You can use the following link within the next day to reset your password :)\n\n";
		content += "http://localhost:8080/Aside/user/set_password.jsp?no="+user_no+"\n\n";
		content += "Thanks,\n";
		content += "Your friends at Aside";

		SimpleMailMessage message = new SimpleMailMessage(); // 메일 정보를 담을 객체
		message.setFrom("springaside@gmail.com"); // 누가 보내는지는 반드시 있어야함
		message.setTo(user_email);
		message.setSubject(title);
		message.setText(content);
		mailSender.send(message);
		return "redirect:../index.html";
	}

}