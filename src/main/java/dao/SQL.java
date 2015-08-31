package dao;

public class SQL {
	/*
	 * User SQL
	 */
	public static String USER_INSERT = "insert into tb_user(email, passwd, user_name) values(?,?,?)";
	public static String USER_SELECT = "select * from tb_user where email=?";
	
	/*
	 * Parameter SQL
	 */
	public static String PARAMETER_SELECT_ITEMS = "select * from tb_parameter where user_id=?";
	public static String PARAMETER_INSERT = "insert into tb_parameter(title, parameter, user_id) values(?, ?, ?)";
	public static String PARAMETER_DELETE = "delete from tb_parameter where id=?";
}
