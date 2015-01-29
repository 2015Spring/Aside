package ktds.aside.domain;

import java.util.Date;

public class Comment {
  int comment_no;
  int diary_no;
  int user_no;
  Date comment_date;
  String comment_context;
  
  public int getComment_no() {
    return comment_no;
  }
  public void setComment_no(int comment_no) {
    this.comment_no = comment_no;
  }
  public int getDiary_no() {
    return diary_no;
  }
  public void setDiary_no(int diary_no) {
    this.diary_no = diary_no;
  }
  public int getUser_no() {
    return user_no;
  }
  public void setUser_no(int user_no) {
    this.user_no = user_no;
  }
  public Date getComment_date() {
    return comment_date;
  }
  public void setComment_date(Date comment_date) {
    this.comment_date = comment_date;
  }
  public String getComment_context() {
    return comment_context;
  }
  public void setComment_context(String comment_context) {
    this.comment_context = comment_context;
  }
  
  
  
}
