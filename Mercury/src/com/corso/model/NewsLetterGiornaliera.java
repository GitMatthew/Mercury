package com.corso.model;

import java.sql.SQLException;
import java.util.Date;


public class NewsLetterGiornaliera extends Thread implements Runnable{

	 Date now;
	
	public NewsLetterGiornaliera () {
		super();
	}
	
	public void run () {
		while (true) { 
			InviaEmail s = new InviaEmail();
			try {
				Thread.sleep(86400);
				s.sendEmail(1);

			}
			catch (InterruptedException e) {
				e.printStackTrace();
			}
			catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	}
}