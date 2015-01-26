package ktds.aside.dao;

import java.util.HashMap;

import ktds.aside.domain.User;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {

	@Autowired
	SqlSessionFactory sqlSessionFactory;

	public void insert(User user) {
		SqlSession sqlSession = sqlSessionFactory.openSession();

		try {
			sqlSession.insert("ktds.aside.dao.UserDao.insert", user);
			sqlSession.commit();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

	public String login(String user_email) {
		SqlSession sqlSession = sqlSessionFactory.openSession();

		try {
			return sqlSession.selectOne("ktds.aside.dao.UserDao.login",
					user_email);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			sqlSession.close();
		}
	}

	public User getLoginInfo(String user_email, String user_password) {
		SqlSession sqlSession = sqlSessionFactory.openSession();

		try {
			HashMap<String, String> params = new HashMap<String, String>();
			params.put("user_email", user_email);
			params.put("user_password", user_password);

			return sqlSession.selectOne("ktds.aside.dao.UserDao.loginInfo",
					params);

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			sqlSession.close();
		}
	}

	public void delete(int user_no) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			sqlSession.delete("ktds.aside.dao.UserDao.delete", user_no);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

}
