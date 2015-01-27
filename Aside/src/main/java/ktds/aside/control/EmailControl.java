package ktds.aside.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmailControl {
 
    @Autowired
    JavaMailSender mailSender;
    
    @RequestMapping("/email/send")
    public String signUp(String to, String subject, String content){
      SimpleMailMessage message = new SimpleMailMessage(); // 메일 정보를 담을 객체
      message.setFrom("springaside@gmail.com"); // 누가 보내는지는 반드시 있어야함
      message.setTo(to);
      message.setSubject(subject);
      message.setText(content);
      mailSender.send(message);
	  return "/email/sendResult.jsp"; // 일단 결과 확인용
    }
    
}