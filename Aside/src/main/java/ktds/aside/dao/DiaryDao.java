package ktds.aside.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import ktds.aside.domain.Diary;
import ktds.aside.domain.User;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class DiaryDao {

  @Autowired
  SqlSessionFactory sqlSessionFactory;

  public void insert(Diary diary) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try {
      sqlSession.insert("ktds.aside.dao.DiaryDao.insert", diary);
      sqlSession.commit();

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      sqlSession.close();
    }
  }

  public List<Diary> selectMyList(int no) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try {
      return sqlSession.selectList("ktds.aside.dao.DiaryDao.selectMyList", no);
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    } finally {
      sqlSession.close();
    }
  }

  public Diary selectOne(int no) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try {
      return sqlSession.selectOne("ktds.aside.dao.DiaryDao.selectOne", no);
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    } finally {
      sqlSession.close();
    }
  }

  public void delete(int no) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try {
      sqlSession.delete("ktds.aside.dao.DiaryDao.delete", no);
      sqlSession.commit();
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      sqlSession.close();
    }
  }

  public void update(Diary diary) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try {
      sqlSession.delete("ktds.aside.dao.DiaryDao.update", diary);
      sqlSession.commit();
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      sqlSession.close();
    }
  }
  
  public List<Diary> selectOtherList(int no) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try {
      return sqlSession.selectList("ktds.aside.dao.DiaryDao.selectOtherList", no);
    } catch (Exception e) {
      return null;
    } finally {
      sqlSession.close();
    }
  }
  
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
