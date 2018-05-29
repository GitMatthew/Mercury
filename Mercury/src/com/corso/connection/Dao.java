package com.corso.connection;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.corso.connection.Dao;

public class Dao 
{

	private static Connection conn=null;
	private static DataSource ds=null;
	private static Dao d=null;
	
	private Dao() 
	{
		
		Context primoLivello;
		Context secondoLivello;
		
		try 
		{
			primoLivello = new InitialContext();
			secondoLivello = (Context) primoLivello.lookup("java:comp/env");
			ds = (DataSource) secondoLivello.lookup("jdbc/mercury03");
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		
		
	}
	
	public static Connection getConnection() 
	{
		if(d==null)
		{
			d=new Dao();
		}
		
		try 
			{
				conn=ds.getConnection();
			} 
		catch (SQLException e) 
							{
								e.printStackTrace();
							}
		
		return conn;
	}
	
	
}
