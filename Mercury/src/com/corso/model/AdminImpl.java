package com.corso.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.corso.connection.Dao;

public class AdminImpl implements AdminUtility 
{

	@Override
	public boolean login(String user,String psw) {
		Connection c = Dao.getConnection();
		boolean result=false;
		try {
		  PreparedStatement pst = c.prepareStatement(AdminUtility.CHECK_PSW);

		  pst.setString(1,user);
		  pst.setString(2,psw);

		  ResultSet rs=pst.executeQuery();

		  if(rs.getInt("tot")>0)
		  { 
		    result=true;
		  }
		 }
		 catch(SQLException e){

		  e.printStackTrace();		
		 }
		return result;
	}
	
	@Override
	public void sendNotifica() {
		
	}

	
	// da completare
	@Override
	public ArrayList<Evento> getEventiAttesa() {
		ArrayList<Evento> evList=new ArrayList<Evento>();
		Evento e=null;
		
		Connection conn=Dao.getConnection();
		try 
		{
			Statement st=conn.createStatement();
			ResultSet rst=st.executeQuery(AdminUtility.GET_EVENTS_BY_STATUS);
			
			while(rst.next())
			{
				e=new Evento();
				//set attributi
				evList.add(e);
				
			}
		} 
		catch (SQLException a) 
		{
			a.printStackTrace();
		}
		finally
		{
			try 
				{
					conn.close();
				} 
			catch (SQLException o) 
								{
									o.printStackTrace();
								}
		}
		
		return evList;
	}

	@Override
	public ArrayList<Ente> getEntiAttesa() {
		return null;
	}

	@Override
	public String newCat() {

		return null;
	}

	@Override
	public String modCat() {

		return null;
	}

}
