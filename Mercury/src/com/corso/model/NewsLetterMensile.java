package com.corso.model;



import java.sql.SQLException;
import java.util.Date;

public class NewsLetterMensile extends Thread implements Runnable {
		
		Date now;
		
		
		public NewsLetterMensile() {
			super();


		}
		
		public void run() {
			while(true) {
				InviaEmail s = new InviaEmail();  
				try {
					s.sendEmail(3);
					Thread.sleep(2629800);
				}
				catch (InterruptedException e){
					e.printStackTrace();
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
				
		}

	
}
