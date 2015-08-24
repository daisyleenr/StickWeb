package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.exceptions.JedisConnectionException;
import vo.ParameterVO;
import vo.UserVO;

public class ParameterDAO implements DAO {

	static final Logger log = LoggerFactory.getLogger(ParameterDAO.class);
	private static String IPADDR = "localhost";

	@Override
	public int insert(Object object) {
		log.trace("method:insert #" + object.toString());
		
		int status = 0;
		ParameterVO param = (ParameterVO) object;

		try {
			InitialContext ctx = new InitialContext();
			DataSource pool = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");

			if (pool == null) {
				log.error("DataSource is null");
				return status;
			}
			Connection conn = pool.getConnection();
			log.debug("DB connection");

			PreparedStatement preparedStmt = conn.prepareStatement(SQL.PARAMETER_INSERT);
			preparedStmt.setString(1, param.getTitle());
			preparedStmt.setString(2, param.getParameter());
			preparedStmt.setInt(3, param.getUser_id());

			status = preparedStmt.executeUpdate();
			log.debug("execute update: " + SQL.PARAMETER_INSERT);

			preparedStmt.close();
			log.debug("PreparedStatement close");
			conn.close();
			log.debug("Connection close");

		} catch (Exception e) {
			log.error("DB processing error: " + e);
			System.out.println(e);
			return status;
		}

		return status;
	}

	public int createRedisSortedSet(Object object) {
		log.trace("method:createRedisSortedSet #" + object.toString());
		int status = 0;
		ParameterVO param = (ParameterVO) object;

		Jedis jedis = new Jedis(IPADDR);
		try {
			jedis.zadd(param.getParameter(), 0, "create");
			// jedis.zrem(param.getParameter(), "create");
		} catch (JedisConnectionException e) {
			log.error("fail DB connection: " + e);
		}

		jedis.close();
		log.debug("success to create redis key " + param.getParameter());
		status = 1;
		return status;
	}

	@Override
	public int update(Object object) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Object object) {
		log.trace("method:delete #" + object.toString());

		int status = 0;
		ParameterVO param = (ParameterVO) object;

		try {
			InitialContext ctx = new InitialContext();
			DataSource pool = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");

			if (pool == null) {
				log.error("DataSource is null");
				return status;
			}
			Connection conn = pool.getConnection();
			log.debug("DB connection");

			PreparedStatement preparedStmt = conn.prepareStatement(SQL.PARAMETER_DELETE);
			preparedStmt.setInt(1, param.getId());

			status = preparedStmt.executeUpdate();
			log.debug("execute update: " + SQL.PARAMETER_DELETE);

			preparedStmt.close();
			log.debug("PreparedStatement close");
			conn.close();
			log.debug("Connection close");

		} catch (Exception e) {
			log.error("DB processing error: " + e);
			System.out.println(e);
			return status;
		}

		return status;
	}

	@Override
	public Object select(Object object) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<ParameterVO> selectParameters(Object object) {
		log.trace("method:selectParameters #" + object.toString());
		ArrayList<ParameterVO> resultParamList = new ArrayList<ParameterVO>();
		UserVO user = (UserVO) object;

		try {
			InitialContext ctx = new InitialContext();
			DataSource pool = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");

			if (pool == null) {
				log.error("DataSource is null");
				return null;
			}
			Connection conn = pool.getConnection();
			log.debug("DB connection");

			PreparedStatement preparedStmt = conn.prepareStatement(SQL.PARAMETER_SELECT_ITEMS);
			preparedStmt.setInt(1, user.getId());
			ResultSet rset = preparedStmt.executeQuery();
			log.debug("execute query: " + SQL.PARAMETER_SELECT_ITEMS);

			while (rset.next()) {
				ParameterVO param = new ParameterVO(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getInt(4), 0, rset.getDate(5));
				resultParamList.add(param);
			}
			log.debug("set paramList: " + resultParamList.size());

			rset.close();
			log.debug("ResultSet close");
			preparedStmt.close();
			log.debug("PreparedStatement close");
			conn.close();
			log.debug("Connection close");

			return resultParamList;
		} catch (Exception e) {
			log.error("DB processing error: " + e);
			System.out.println(e);
			return null;
		}
	}

	public int removeRedisSortedSet(Object object) {
		log.trace("method:removeRedisSortedSet #" + object.toString());
		int status = 0;
		ParameterVO param = (ParameterVO) object;

		Jedis jedis = new Jedis(IPADDR);
		try {
			jedis.del(param.getParameter());
		} catch (JedisConnectionException e) {
			log.error("fail DB connection: " + e);
		}

		jedis.close();
		log.debug("success to remove redis key " + param.getParameter());
		status = 1;
		return status;
	}

	public int zcardParameter(String parameter) {
		log.trace("method:zcardParameter #:"+parameter);
		long number = 0;

		Jedis jedis = new Jedis(IPADDR);
		try {
			number = jedis.zcard(parameter);
		} catch (JedisConnectionException e) {
			log.error("fail DB connection: " + e);
		}

		jedis.close();
		
		log.debug("number of "+parameter+": " + number);
		return (int) number;
	}
}
