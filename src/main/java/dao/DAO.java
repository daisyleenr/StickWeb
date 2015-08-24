package dao;

public interface DAO {
	public int insert(Object object);

	public int update(Object object);

	public int delete(Object object);

	public Object select(Object object);
}
