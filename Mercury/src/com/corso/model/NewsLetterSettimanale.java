package com.corso.model;


	import java.sql.SQLException;
	import java.util.Date;

	public class NewsLetterSettimanale  extends Thread implements Runnable{
		
		Date now;

		
		public NewsLetterSettimanale () {
			super();
		}
		
		public void run() {
			while(true) {
				InviaEmail s = new InviaEmail();
				try {
					s.sendEmail(2);
					Thread.sleep(604800);
				}
				catch (InterruptedException e){
					e.printStackTrace();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}			
			}
		}
	
}
