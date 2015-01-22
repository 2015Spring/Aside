package ktds.aside.dao;


import ktds.aside.domain.Diary;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class DiaryDao {
  
  @Autowired
  SqlSessionFactory sqlSessionFactory;
  
  public void insert(Diary diary){
    SqlSession sqlSession=sqlSessionFactory.openSession();
    System.out.println(diary.getDiary_context());
    try {
        sqlSession.insert("ktds.aside.dao.DiaryDao.insert", diary); 
        sqlSession.commit();
        
      } catch (Exception e) {
        e.printStackTrace();
      } finally{
        sqlSession.close();
      }
  }
  
}
