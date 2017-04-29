package shop.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

/*
 * 发送邮件的工具类
 * */
public class MailUtils {
	public static void sendEmail(String to, String code) 
	{
		Properties p = new Properties();
		p.setProperty("mail.smtp", "localhost");
		Session session = Session.getInstance(p, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication("service@shop.com","111");
			}
		});
		
		Message message = new MimeMessage(session);
		
		try {
			message.setFrom(new InternetAddress("service@shop.com"));
			message.setRecipient(RecipientType.TO, new InternetAddress(to));
			message.setSubject("来自shop的激活邮件");
			message.setContent("<h1>来自shop的激活邮件</h1><h3><a href=''></a></h3>", "text/html;charset=UTF-8");
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
