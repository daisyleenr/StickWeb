package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import vo.UserVO;

public class UserDAO implements DAO {
	static final Logger log = LoggerFactory.getLogger(UserDAO.class);

	@Override
	public int insert(Object object) {
		int status = 0;
		UserVO user = (UserVO) object;
		
		log.trace("method:insert #"+user.toString());

		try {
			InitialContext ctx = new InitialContext();
			DataSource pool = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");

			if (pool == null) {
				log.error("DataSource is null");
				return status;
			}
			Connection conn = pool.getConnection();
			log.debug("DB connection");

			PreparedStatement preparedStmt = conn.prepareStatement(SQL.USER_INSERT);
			preparedStmt.setString(1, user.getEmail());
			preparedStmt.setString(2, user.getPasswd());
			preparedStmt.setString(3, user.getUser_name());
			preparedStmt.setString(4, user.getTitle());

			status = preparedStmt.executeUpdate();
			log.debug("execute update: "+SQL.USER_INSERT);

			preparedStmt.close();
			log.debug("PreparedStatement close");
			conn.close();
			log.debug("Connection close");
			
		} catch (Exception e) {
			log.error("DB processing error: "+e);
			System.out.println(e);
			return status;
		}

		return status;
	}

	@Override
	public int update(Object object) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Object object) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Object select(Object object) {
		log.trace("method:select #"+object.toString());
		UserVO user = (UserVO) object;
		UserVO result = null;

		try {
			InitialContext ctx = new InitialContext();
			DataSource pool = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");

			if (pool == null) {
				log.error("DataSource is null");
				return null;
			}
			Connection conn = pool.getConnection();
			log.debug("DB connection");

			PreparedStatement preparedStmt = conn.prepareStatement(SQL.USER_SELECT);
			preparedStmt.setString(1, user.getEmail());
			ResultSet rset = preparedStmt.executeQuery();
			log.debug("execute query: "+SQL.USER_SELECT);

			rset.next();
			result = new UserVO(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getString(4),
					rset.getString(5), rset.getDate(6));
			log.debug("set user: " + result.getEmail());
			
			rset.close();
			log.debug("ResultSet close");
			preparedStmt.close();
			log.debug("PreparedStatement close");
			conn.close();
			log.debug("Connection close");
			
			return result;
		} catch (Exception e) {
			log.error("DB processing error: "+e);
			System.out.println(e);
			return null;
		}
	}
}
