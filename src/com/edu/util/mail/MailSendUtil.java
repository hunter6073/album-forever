package com.edu.util.mail;

import java.util.Date;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;


/**
 * 发送邮件方法类
 * @author Christin 
 * Email:869641892@qq.com 
 * MP:18392150948
 */
public class MailSendUtil {
	/**
	 * 邮箱服务器
	 */
	 private final static String host = "smtp.126.com"; 
	 
	 /**
	  * 服务器邮箱地址
	  */
	    private final static String formName = "zzzyyy96@126.com";
	    
	    /**
	     * 服务器邮箱授权码
	     */
	    private final static String password = "qawsed1345";
	    
	    /**
	     * 用户回复邮件接收地址
	     */
	    private final static String replayAddress = "zzzyyy96@126.com";

	    /**
	     * 发送HTML格式邮件
	     * @param info	邮件信息bean类
	     * @throws Exception
	     */
	    public static void sendHtmlMail(MailInfo info)throws Exception{
	        info.setHost(host);
	        info.setFormName(formName);
	        info.setFormPassword(password);  
	        info.setReplayAddress(replayAddress);

	        Message message = getMessage(info);
	       
	        Multipart mainPart = new MimeMultipart();
	       
	        BodyPart html = new MimeBodyPart();
	       
	        html.setContent(info.getContent(), "text/html; charset=utf-8");
	        mainPart.addBodyPart(html);
	       
	        message.setContent(mainPart);
	        Transport.send(message);
	    }

	    /**
	     * 初始化邮件信息
	     * @param info 邮件信息bean类
	     * @return 返回发送Message类
	     * @throws Exception
	     */
	    private static Message getMessage(MailInfo info) throws Exception{
	        final Properties p = System.getProperties() ;
	        p.setProperty("mail.smtp.host", info.getHost());
	        p.setProperty("mail.smtp.auth", "true");
	        p.setProperty("mail.smtp.user", info.getFormName());
	        p.setProperty("mail.smtp.pass", info.getFormPassword());

	    
	        Session session = Session.getInstance(p, new Authenticator(){
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(p.getProperty("mail.smtp.user"),p.getProperty("mail.smtp.pass"));
	            }
	        });
	        session.setDebug(true);
	        Message message = new MimeMessage(session);
	      
	        message.setSubject(info.getSubject());
	      
	        message.setReplyTo(InternetAddress.parse(info.getReplayAddress()));
	       
	        message.setFrom(new InternetAddress(p.getProperty("mail.smtp.user"),"碟碟不朽网"));
	       
	        message.setRecipient(Message.RecipientType.TO,new InternetAddress(info.getToAddress()));

	        message.setSentDate(new Date());


	        return message ;
	    }
	    
	    
}
