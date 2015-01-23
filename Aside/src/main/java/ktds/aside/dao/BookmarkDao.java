package ktds.aside.dao;


import java.util.ArrayList;
import java.util.List;

import ktds.aside.domain.Diary;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class BookmarkDao {

  @Autowired
  SqlSessionFactory sqlSessionFactory;

  public List<Diary> selectBookmarkList(int no) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try {
      return sqlSession.selectList("ktds.aside.dao.DiaryDao.selectBookmarkList", no);
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    } finally {
      sqlSession.close();
    }
  }

}
