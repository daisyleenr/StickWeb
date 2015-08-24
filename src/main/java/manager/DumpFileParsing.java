package manager;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Vector;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DumpFileParsing {
	public String mCurrentTableName;
	public Vector<String> mColumnValue;
	public Vector<String> mColumnName;
	public Vector<String> mColumnNameStructure ;
	static final Logger log = LoggerFactory.getLogger(DumpFileParsing.class);
	
	public DumpFileParsing(String fileName) {
		log.trace("method:DumpFileParsing #"+fileName);
		
		mColumnValue = new Vector<String>();
		mColumnName = new Vector<String>();
	    mColumnNameStructure = new Vector<String>();
		   try
		    {
		      BufferedReader myDumpfileReader = new BufferedReader(new FileReader(fileName));
		      String dumpFileLine = myDumpfileReader.readLine();
		  
		      while(!dumpFileLine.startsWith("UNLOCK TABLE") && (dumpFileLine = myDumpfileReader.readLine()) != null)
		      {
		        if(dumpFileLine.startsWith("CREATE TABLE"))
		        {
		          String[] parts = dumpFileLine.split(" ");
		          mCurrentTableName = parts[2].substring(1, parts[2].length()-1);
		          	
		          while((dumpFileLine = myDumpfileReader.readLine()) != null && !dumpFileLine.startsWith("UNLOCK TABLE"))
		          {
		            if(dumpFileLine.startsWith("  `"))
		            {
		                String[] parts2 = dumpFileLine.split(" ");
	
		                parts2[2] = parts2[2].substring(1, parts2[2].length()-1);

		                mColumnName.addElement(parts2[2]);
		                mColumnNameStructure.addElement(parts2[3]);
		            }
		            if(dumpFileLine.startsWith("INSERT INTO "))
		            {
		                String[] parts3 = dumpFileLine.split(" ");
		                parts3[4] = parts3[4].replace("(", "");
		                parts3[4] = parts3[4].replace(")","");
		                parts3[4] = parts3[4].replace("'","");
		                parts3[4] = parts3[4].replace(";","");
		                
		                String []columnV = parts3[4].split(",");
		                 
		                for(int i = 0 ; i < columnV.length ; ++i)
		                	mColumnValue.addElement(columnV[i]);   
		            }
		          }
		        }
		      }
		    }
		    catch(Exception ex)
		    {
		      log.error("file convert errer: "+ex);
		    }
//		   
//		   for(int i = 0 ; i < mColumnNameStructure.size(); ++i)
//           {
//              System.out.println(mColumnName.get(i) +" : " + mColumnNameStructure.get(i));
//           }
//           
//           for(int i = 0 ; i < mColumnValue.size() ; ++i)
//           {
//              
//              System.out.print(mColumnValue.get(i) + " ");
//              if(i % 3 == 2) System.out.println();
//           }
	}
}
