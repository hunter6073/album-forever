package com.edu.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import com.edu.util.base64.BASE64Encoder;


/**
 * 摘要加密
 * @author Christin 
 * Email:869641892@qq.com 
 * MP:18392150948
 */
public class EncryptUtil {
	/**
	 * 密码摘要加密
	 * @param pwd 待加密密码
	 * @return 返回加密后的值
	 */
	public static String md5Encrypt(String pwd){
		try {
			MessageDigest digest = MessageDigest.getInstance("MD5");
			byte []bytes = digest.digest(pwd.getBytes());
			BASE64Encoder base64 = new BASE64Encoder();
			return base64.encode(bytes);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} 
		return null;
	}
	
	
	public static void main(String[] args) {
		String pwd = "123456";
		
		String Epwd = EncryptUtil.md5Encrypt(pwd);
		System.out.println(Epwd);
		
	}
}
