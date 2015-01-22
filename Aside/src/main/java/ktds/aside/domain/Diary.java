package ktds.aside.domain;

import java.util.Date;

public class Diary {

  int diary_no;
  int user_no;
  String diary_context;
  int diary_isopen;
  int diary_iscomment;
  String diary_image;
  Date diary_date;
  
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
  public String getDiary_context() {
    return diary_context;
  }
  public void setDiary_context(String diary_context) {
    this.diary_context = diary_context;
  }
  public int getDiary_isopen() {
    return diary_isopen;
  }
  public void setDiary_isopen(int diary_isopen) {
    this.diary_isopen = diary_isopen;
  }
  public int getDiary_iscomment() {
    return diary_iscomment;
  }
  public void setDiary_iscomment(int diary_iscomment) {
    this.diary_iscomment = diary_iscomment;
  }
  public String getDiary_image() {
    return diary_image;
  }
  public void setDiary_image(String diary_image) {
    this.diary_image = diary_image;
  }
  public Date getDiary_date() {
    return diary_date;
  }
  public void setDiary_date(Date diary_date) {
    this.diary_date = diary_date;
  }
}
