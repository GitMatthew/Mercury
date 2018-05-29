package com.corso.connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Savepoint;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.swing.JOptionPane;

public class Dao
{
	
	private static Dao Dao = null;
	
	private static DataSource ds = null;
	
	private Dao()
	{
		InitialContext initContext = null;
		
		try {
			initContext = new InitialContext();
			
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/mercury03");
			
		}
		catch (NamingException ex) {
			ex.printStackTrace();
		}
	}
	
	public static Dao getDao()
	{
		if (Dao == null) {
			Dao = new Dao();
		}
		return Dao;
	}
	
	public static Connection getConnection()
	{
		Connection c = null;
		if (ds == null) {
			Dao = new Dao();
		}
		
		try {
			c = ds.getConnection();
		}
		catch (SQLException e) {
			JOptionPane.showMessageDialog(null, e.getMessage());
		}
		
		return c;
	}
	
	public static ResultSet execute_Query(Connection conn, String query) throws SQLException
	{
		if (conn == null)
			conn = Dao.getConnection();
		Statement st = conn.createStatement();
		
		ResultSet rs = st.executeQuery(query);
		
		return rs;
	}
	
	public static int execute_Update(Connection conn, String query) throws SQLException
	{
		if (conn == null)
			conn = Dao.getConnection();
		
		Statement st = conn.createStatement();
		return st.executeUpdate(query);
	}
	
	public static int execute_Update(Connection conn, PreparedStatement st)
	{
		int n_rows = 0;
		if (conn == null)
			conn = Dao.getConnection();
		
		try {
			st.executeUpdate();
		}
		catch (SQLException e) {
			JOptionPane.showMessageDialog(null, e.getMessage());
		}
		finally {
			return n_rows;
		}
	}
	
	public static boolean close_connection(Connection conn)
	{
		
		boolean b = false;
		
		if (conn == null)
			return b;
		
		try {
			conn.close();
			b = true;
		}
		catch (SQLException e) {
			JOptionPane.showMessageDialog(null, e.getMessage());
		}
		finally {
			return b;
		}
	}
	
	public static Connection setTransaction(Connection conn, int lvl)
	{
		if (conn == null)
			conn = Dao.getConnection();
		try {
			conn.setAutoCommit(false);
			conn.setTransactionIsolation(lvl);
			
		}
		catch (SQLException e) {
			JOptionPane.showMessageDialog(null, e.getMessage());
		}
		finally {
			return conn;
		}
	}
	
	public static boolean commit(Connection conn)
	{
		boolean b = false;
		if (conn != null) {
			try {
				conn.commit();
				b = true;
			}
			catch (SQLException e) {
				JOptionPane.showMessageDialog(null, e.getMessage());
				
			}
			finally {
				return b;
			}
		}
		else
			return b;
	}
	
	public static boolean rollback(Connection conn, Savepoint p)
	{
		if (conn == null)
			return false;
		else {
			try {
				if (p == null)
					conn.rollback();
				else
					conn.rollback(p);
			}
			catch (SQLException e) {
				JOptionPane.showMessageDialog(null, e.getMessage());
				return false;
			}
			finally {
				return true;
			}
		}
		
	}
	
}
