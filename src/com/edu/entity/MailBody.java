package com.edu.entity;

/**
 * 激活码邮件内容类
 * 
 * @author Christin
 * Email:869641892@qq.com 
 * MP:18392150948
 */
public class MailBody {
	private String body1;
	private String body2;
	private String body3;
	private String body4;
	private String body5;

	public MailBody() {
		body1 = new String();
		body2 = new String();
		body3 = new String();
		body4 = new String();
		body5 = new String();

		body1 = "	<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">"
				+ "<title>Account Verify</title>"
				+ "	<style media=\"all\" type=\"text/css\">"
				+ "	td, p, h1, h3, a {"
				+ "		font-family: /*Helvetica, Arial, sans-serif*/ \"Microsoft Yahei\";"
				+ "	}"
				+ "	a"
				+ "	{"
				+ "		color: #66c0f4;"
				+ "		text-decoration: none;"
				+ "	}"
				+ "	a:hover"
				+ "	{"
				+ "		color: #66c0f4;"
				+ "		text-decoration: none;"
				+ "	}"
				+ "</style>"
				+ "<table style=\"width: 538px; background-color: #393836;\" align=\"center\" cellspacing=\"0\" cellpadding=\"0\">"
				+ "	<tbody><tr>"
				+ "		<td style=\" height: 65px; background-color: #171a21; border-bottom: 1px solid #4d4b48;\">"

				+ "		</td>"
				+ "	</tr>"
				+ "	<tr>"
				+ "		<td bgcolor=\"#17212e\">"
				+ "			<table width=\"470\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding-left: 5px; padding-right: 5px; padding-bottom: 10px;\">"
				+ "				<tbody><tr bgcolor=\"#17212e\">"
				+ "					<td style=\"padding-top: 32px;\">"
				+ "					<span style=\"font-size: 24px; color: #66c0f4; font-family: Arial, Helvetica, sans-serif; font-weight: bold;\">"
				+ "						你好 ";

		body2 = "					</span><br>"
				+ "	</td>"
				+ "</tr>"
				+ "<tr>"
				+ "	<td style=\"padding-top: 12px; font-size: 17px; color: #c6d4df; font-family: Arial, Helvetica, sans-serif; font-weight: bold;\">"
				+ "		以下是将要验证邮箱所输入的激活码:					</td>"
				+ "</tr>"
				+ "<tr>"
				+ "	<td style=\"padding-top: 24px; padding-bottom: 24px;\">"
				+ "		<div>"
				+ "			<span style=\"font-size: 24px; color: #66c0f4; font-family: Arial, Helvetica, sans-serif; font-weight: bold;\">";

		body3 = "</span>"
				+ "			<br>"
				+ "		</div>"
				+ "	</td>"
				+ "</tr>"
				+ "<tr bgcolor=\"#121a25\">"
				+ "	<td style=\"padding: 20px; font-size: 12px; line-height: 17px; color: #c6d4df; font-family: Arial, Helvetica, sans-serif;\">"
				+ "		如果你并没有打算注册、修改或者找回密码, 请忽略这条邮件. 可能是其他用户填写邮箱信息错误而发到你的邮箱中.					</td>"
				+ "</tr>"
				+ "<tr>"
				+ "	<td style=\"font-size: 12px; color: #6d7880; padding-top: 16px; padding-bottom: 60px;\">"
				+ "		碟碟不朽技术团队<br>"
				+ "		<a style=\"color: #8f98a0;\" href=\"http://wpa.qq.com/msgrd?v=3&uin=869641892&site=qq&menu=yes\">联系我们</a><br>"
				+ "	</td>"
				+ "</tr>"
				+ "</tbody></table>"
				+ "</td>"
				+ "</tr>"
				+ "<tr style=\"background-color: #000000;\">"
				+ "	<td style=\"padding: 12px 24px;\">"
				+ "	<table cellpadding=\"0\" cellspacing=\"0\">"
				+ "		<tbody><tr>"
				+ "		<td width=\"92\">"
				+ "	</td>"
				+ "	<td style=\" font-size: 11px; color: #595959; padding-left: 12px;\">"
				+ "						</td>" + "</tr>" + "</tbody></table>" + "</td>"
				+ "</tr>" + "</tbody></table>";
		
		body4 = "					</span><br>"
			+ "	</td>"
			+ "</tr>"
			+ "<tr>"
			+ "	<td style=\"padding-top: 12px; font-size: 17px; color: #c6d4df; font-family: Arial, Helvetica, sans-serif; font-weight: bold;\">"
			+ "		访问下面的地址对账户进行激活:					</td>"
			+ "</tr>"
			+ "<tr>"
			+ "	<td style=\"padding-top: 24px; padding-bottom: 24px;\">"
			+ "		<div>"
			+ "			<span style=\"font-size: 24px; color: #66c0f4; font-family: Arial, Helvetica, sans-serif; font-weight: bold;\">" 
			+ "<a href=\"";
		
		body5 = "\">激活邮箱</a>"
			+ "</span>"
			+ "			<br>"
			+ "		</div>"
			+ "	</td>"
			+ "</tr>"
			+ "<tr bgcolor=\"#121a25\">"
			+ "	<td style=\"padding: 20px; font-size: 12px; line-height: 17px; color: #c6d4df; font-family: Arial, Helvetica, sans-serif;\">"
			+ "		如果你并没有打算注册、修改或者找回密码, 请忽略这条邮件. 可能是其他用户填写邮箱信息错误而发到你的邮箱中.					</td>"
			+ "</tr>"
			+ "<tr>"
			+ "	<td style=\"font-size: 12px; color: #6d7880; padding-top: 16px; padding-bottom: 60px;\">"
			+ "		碟碟不朽技术团队<br>"
			+ "		<a style=\"color: #8f98a0;\" href=\"http://wpa.qq.com/msgrd?v=3&uin=869641892&site=qq&menu=yes\">联系我们</a><br>"
			+ "	</td>"
			+ "</tr>"
			+ "</tbody></table>"
			+ "</td>"
			+ "</tr>"
			+ "<tr style=\"background-color: #000000;\">"
			+ "	<td style=\"padding: 12px 24px;\">"
			+ "	<table cellpadding=\"0\" cellspacing=\"0\">"
			+ "		<tbody><tr>"
			+ "		<td width=\"92\">"
			+ "	</td>"
			+ "	<td style=\" font-size: 11px; color: #595959; padding-left: 12px;\">"
			+ "						</td>" + "</tr>" + "</tbody></table>" + "</td>"
			+ "</tr>" + "</tbody></table>";
	}

	/**
	 * 邮件内容=body1+目标邮箱+body2+激活码+body3
	 * 
	 * @param toAddress
	 *            目标邮箱地址
	 * @param vcode
	 *            激活码
	 * @return 邮件内容
	 */
	public String emailBody(String toAddress, String vcode) {
		return body1 + toAddress + body2 + vcode + body3;
	}
	
	public String emailBody2(String toAddress, String url){
		return body1 + toAddress + body4 + url + body5;
	}
	
}
