package ktds.aside.dao;

import ktds.aside.domain.User;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmailDao {

	@Autowired
	SqlSessionFactory sqlSessionFactory;

	public User selectOne(String user_email) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.selectOne("ktds.aside.dao.EmailDao.selectUser", user_email);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			sqlSession.close();
		}
	}
}
