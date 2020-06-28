package com.employee.model;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailService {
	
		public void getNewPsw (EmployeeVO empVO) {
			
			String ename = empVO.getEname();
			String to = empVO.getEmail();
			String epsw = empVO.getEpsw();
			String subject = "密碼通知信件";
			String messageText = "FitMate員工"+ename+"您好,您的後台系統登入密碼為"+epsw+",請務必保管好此信件,謝謝";
				
			MailService mSvc = new MailService();
			mSvc.sendMail(to, subject, messageText);
		}
		
		public void forgetPsw (EmployeeVO empVO) {
			String ename = empVO.getEname();
			String to = empVO.getEmail();			
			String epsw = empVO.getEpsw();
			String subject = "忘記密碼通知信件";
			String messageText = "FitMate員工"+ename+"您好,您的後台系統登入密碼為"+epsw+",請務必保管好此信件,謝謝";
			
			MailService mSvc = new MailService();
			mSvc.sendMail(to, subject, messageText);
		}
	
	// 設定傳送郵件:至收信人的Email信箱,Email主旨,Email內容
		public void sendMail(String to, String subject, String messageText) {
				
		   try {
			   // 設定使用SSL連線至 Gmail smtp Server
			   Properties props = new Properties();
			   props.put("mail.smtp.host", "smtp.gmail.com");
			   props.put("mail.smtp.socketFactory.port", "465");
			   props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
			   props.put("mail.smtp.auth", "true");
			   props.put("mail.smtp.port", "465");

	       // ●設定 gmail 的帳號 & 密碼 (將藉由你的Gmail來傳送Email)
	       // ●須將myGmail的【安全性較低的應用程式存取權】打開
		     final String myGmail = "ixlogic.wu@gmail.com";
		     final String myGmail_password = "BBB45678BBB";
			   Session session = Session.getInstance(props, new Authenticator() {
				   protected PasswordAuthentication getPasswordAuthentication() {
					   return new PasswordAuthentication(myGmail, myGmail_password);
				   }
			   });
			   
			   
			   Message message = new MimeMessage(session);
			   message.setFrom(new InternetAddress(myGmail));
			   message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
			  
			   //設定信中的主旨  
			   message.setSubject(subject);
			   //設定信中的內容 
			   message.setText(messageText);

			   Transport.send(message);
			   
		   	}catch (MessagingException e){
		     
		     e.printStackTrace();
	     }
	   }
		
}
