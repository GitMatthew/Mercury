package com.corso.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import com.corso.connection.Dao;

public class AdminImpl implements AdminUtility 
{

	@Override
	public boolean login() {

		return false;
	}
	
	@Override
	public void sendNotifica() {
		
	}

	@Override
	public ArrayList<Evento> getEventiAttesa() {

		return null;
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
