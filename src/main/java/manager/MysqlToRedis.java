package manager;

import java.util.Vector;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.exceptions.JedisConnectionException;

public class MysqlToRedis {

	private DumpFileParsing mDumpFileParsing;
	private String mKey;
	static final Logger log = LoggerFactory.getLogger(MysqlToRedis.class);

	String IPADDR = "localhost";

	public MysqlToRedis(String fileName, String key) {
		mDumpFileParsing = new DumpFileParsing(fileName);
		mKey = key;
		DumpFileParsing();
	}

	private void DumpFileParsing() {
		log.trace("method:DumpFileParsing");
		Jedis jedis = new Jedis(IPADDR);
		try {
			int rowCount = mDumpFileParsing.mColumnValue.size() ;
			int columnCount = mDumpFileParsing.mColumnName.size();
			Vector<String> temp = mDumpFileParsing.mColumnName;
			String[] columnName = mKey.split("_");
			int count[] = new int[3]; // [0] : id
			// [1] : user_id
			// [2] : score
			
			count[1] = 1;
			count[2] = 2;
			
//			for (int i = 0; i < columnCount; ++i) {
//				if ("id".equals(mDumpFileParsing.mColumnName.get(i))) {
//					count[0] = i;
//
//				} else if ("user_id".equals(mDumpFileParsing.mColumnName.get(i))) {
//					count[1] = i;
//
//				}
//				if (columnName[1].equals(mDumpFileParsing.mColumnName.get(i))) {
//					count[2] = i;
//				}
//			}

			for (int j = 0; j < rowCount; ++j) {
				
				if (j % columnCount == count[2])
				{
					System.out.println(mDumpFileParsing.mColumnValue.get(j) +" : " + mDumpFileParsing.mColumnValue.get(j + count[1] - count[2]) );
					jedis.zadd(mKey, Double.parseDouble(mDumpFileParsing.mColumnValue.get(j)),
							mDumpFileParsing.mColumnValue.get(j + count[1] - count[2]));
				}
			}
			
		} catch (JedisConnectionException e) {
			log.error("jedis error: "+e);
		}

		jedis.close();
	}
}
