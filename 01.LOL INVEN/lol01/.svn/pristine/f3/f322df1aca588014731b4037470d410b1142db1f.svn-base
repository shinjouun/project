package lol.dbms;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBManager 
{
	private Connection conn = null;
	private String host   = "";
	private String userid = "";
	private String passwd = "";
	
	private Statement stmt   = null;
	private ResultSet result = null;
	private boolean   isMonitoring = true;
	
	public DBManager()
	{
		host   = "jdbc:mysql://127.0.0.1:3306/loldb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
		userid = "root";
		passwd = "ezen";		
	}

	public void setHost(String host)     {  this.host = host;       }
	public void setUserid(String userid) {	this.userid = userid;   }
	public void setPasswd(String passwd) { 	this.passwd = passwd;	}

	//DB를 연결한다.
	//리턴값 : 성공시 true, 실패시 false
	public boolean DBOpen()
	{		
		//JDBC 드라이버를 로딩한다.
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
					
			//데이터베이스에 연결한다.
			conn = DriverManager.getConnection(host,userid,passwd);
						
		} catch (Exception e) 
		{
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	//DB를 닫는다.
	public void DBClose()
	{
		//데이터베이스 연결을 닫는다.
		try 
		{
			conn.close();
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}		
	}
	
	//Insert, Update, Delete SQL 구문 처리
	public boolean RunSQL(String sql)
	{
		if(isMonitoring == true)
		{
			System.out.println("----------------------------------");
			System.out.println(sql);
			System.out.println("----------------------------------");
		}
		try
		{
			//작업 처리용 클래스를 할당 받는다.
			Statement stmt = conn.createStatement();				
			//SQL 구문을 실행한다.
			stmt.executeUpdate(sql);
			stmt.close();		
		}catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	//SQL Query를 실행한다.
	public boolean OpenQuery(String sql)
	{
		if(isMonitoring == true)
		{
			System.out.println("----------------------------------");
			System.out.println(sql);
			System.out.println("----------------------------------");		
		}
		try
		{
			//작업 처리용 클래스를 할당 받는다.
			stmt   = conn.createStatement();
			result = stmt.executeQuery(sql);
		}catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	//다음 결과를 가져온다.
	public boolean GetNext()
	{
		try 
		{
			return result.next();
		} catch (SQLException e) 
		{
			e.printStackTrace();
			return false;
		}
	}
	
	//컬럼 값을 가져온다.
	public String GetValue(String column)
	{
		try 
		{
			return result.getString(column);
		} catch (SQLException e) 
		{
			e.printStackTrace();
			return null;
		}
	}

	//컬럼 값을 가져온다.
	public int GetInt(String column)
	{
		try 
		{
			return result.getInt(column);
		} catch (SQLException e) 
		{
			e.printStackTrace();
			return 0;
		}
	}	
	
	//SQL Query를 종료한다.
	public void CloseQuery()
	{
		try 
		{
			result.close();
			stmt.close();
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
}
