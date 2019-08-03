package com.edu.util;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import com.edu.entity.MailBody;
import com.edu.util.mail.MailInfo;
import com.edu.util.mail.MailSendUtil;


/**
 * 发送激活码邮件工具
 * @author Christin 
 * Email:869641892@qq.com 
 * MP:18392150948
 */
public class MailUtil {

	/**
	 * 获取随机激活码
	 * @return 返回随机字符串
	 */
	public static String randomUUID() {
		UUID r = UUID.randomUUID();
		String verifyCode = r.toString().substring(
				r.toString().lastIndexOf("-") + 1);
		return verifyCode;
	}

	/**
	 * 发送激活码到邮箱地址中
	 * @param email 邮箱地址
	 * @return 返回发送的激活码
	 */
	public static String sendCodeEmail(String email) {
		String mail = email;
		String title = "碟碟不朽注册激活码";
		String vcode = randomUUID();
		String content = "";

		MailBody mb = new MailBody();	
		content = mb.emailBody(mail, vcode);

		MailInfo info = new MailInfo();
		//设置目的邮箱地址
		info.setToAddress(mail);
		//设置邮件标题
		info.setSubject(title);
		//设置邮件内容
		info.setContent(content);

		try {
			MailSendUtil.sendHtmlMail(info);
			return vcode;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("邮件发送失败");
			e.printStackTrace();
		}
		return "";
	}

	/**
	 * 发送激活邮件
	 * @param email	邮箱地址
	 */
	public static void sendActiveEmail(String email){
		String mail = email;
		String title = "碟碟不朽账户激活";
		String content = "";
		
		String enEmail = CookieUtil.encryptString(email);
		Date t = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String enTime = CookieUtil.encryptString(sdf.format(t));
		
		try {
			enEmail = URLEncoder.encode(enEmail, "utf-8");
			enTime = URLEncoder.encode(enTime,"utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		String url = "http://172.29.17.12:8088/diskdistribution/unFreeze.form?email="+enEmail+"&time="+enTime+"";
		
		MailBody mb = new MailBody();
		content = mb.emailBody2(email, url);
		
		
		MailInfo info = new MailInfo();
		info.setToAddress(email);
		info.setSubject(title);
		info.setContent(content);
		
		try {
			MailSendUtil.sendHtmlMail(info);
		} catch (Exception e) {
			System.out.println("邮件发送失败");
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
//		System.out.println(MailUtil.sendEmail("598538356@qq.com"));
		// MailUtil.sendEmail("598538356@qq.com");
		sendActiveEmail("598538356@qq.com");
	}
}
