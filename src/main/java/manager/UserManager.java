package manager;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dao.UserDAO;

public class UserManager {

	static final Logger log = LoggerFactory.getLogger(UserManager.class);
	private UserDAO userDAO;

	public UserManager() {
		userDAO = new UserDAO();
	}

	public void register(Object object) {
		log.trace("method:register #" + object.toString());
		userDAO.insert(object);
	}

	public Object searchUser(Object object) {
		log.trace("method:searchUser #" + object.toString());
		Object result = (Object) userDAO.select(object);
		return result;
	}
}
