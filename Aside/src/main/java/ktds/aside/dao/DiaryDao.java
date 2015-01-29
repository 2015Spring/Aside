package ktds.aside.dao;


import java.util.Date;
import java.util.HashMap;
import java.util.List;

import ktds.aside.domain.Comment;
import ktds.aside.domain.Diary;

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
  
  public Diary selectOne(Diary diary) {
	  SqlSession sqlSession = sqlSessionFactory.openSession();
	  try {
		  return sqlSession.selectOne("ktds.aside.dao.DiaryDao.selectOne", diary);
	  } catch (Exception e) {
		  e.printStackTrace();
		  return null;
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
  
  public List<Diary> selectMyListAdd(int no, int page) {
	  SqlSession sqlSession = sqlSessionFactory.openSession();
	  try {
		  HashMap<String, Integer> map = new HashMap<String, Integer>();
		  map.put("no", no);
		  map.put("page", page);
		  return sqlSession.selectList("ktds.aside.dao.DiaryDao.selectMyListAdd", map);
	  } catch (Exception e) {
		  e.printStackTrace();
		  return null;
	  } finally {
		  sqlSession.close();
	  }
  }
  
  public List<Diary> selectOtherListAdd(int no, int page) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try {
    	HashMap<String, Integer> map = new HashMap<String, Integer>();
    	map.put("no", no);
    	map.put("page", page);
      return sqlSession.selectList("ktds.aside.dao.DiaryDao.selectOtherListAdd", map);
    } catch (Exception e) {
      return null;
    } finally {
      sqlSession.close();
    }
  }
  
  public List<Diary> selectBookmarkListAdd(int no, int page) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try {
    	HashMap<String, Integer> map = new HashMap<String, Integer>();
    	map.put("no", no);
    	map.put("page", page);
      return sqlSession.selectList("ktds.aside.dao.DiaryDao.selectBookmarkListAdd", map);
    } catch (Exception e) {
      return null;
    } finally {
      sqlSession.close();
    }
  }
  
  public List<Comment> selectComment(int no) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try {
      return sqlSession.selectList("ktds.aside.dao.DiaryDao.selectComment", no);
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    } finally {
      sqlSession.close();
    }
  }
  
  public List<Date> selectDate(int user_no) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try {
      return sqlSession.selectList("ktds.aside.dao.DiaryDao.selectDate", user_no);
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    } finally {
      sqlSession.close();
    }
  }
  
}
