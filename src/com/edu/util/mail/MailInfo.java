package com.edu.util.mail;


/**
 * 邮件信息bean类
 * @author Christin 
 * Email:869641892@qq.com 
 * MP:18392150948
 */
public class MailInfo {
	
	/**
	 * 邮箱服务器 如smtp.126.com
	 */
    private String host ;
    
    /**
     * 发送邮件的邮箱（服务器邮箱）
     */
    private String formName ;
    
    /**
     * 服务器邮箱授权码
     */
    private String formPassword ;
    
    /**
     * 用户回复消息设置的邮箱
     */
    private String replayAddress ;

    /**
     * 接受者邮箱地址
     */
    private String toAddress ;
    
    /**
     * 邮件主题
     */
    private String subject ;
    
    /**
     * 发送内容
     */
    private String content ;
    
    
    public String getHost() {
        return host;
    }
    public void setHost(String host) {
        this.host = host;
    }
    public String getFormName() {
        return formName;
    }
    public void setFormName(String formName) {
        this.formName = formName;
    }
    public String getFormPassword() {
        return formPassword;
    }
    public void setFormPassword(String formPassword) {
        this.formPassword = formPassword;
    }
    public String getReplayAddress() {
        return replayAddress;
    }
    public void setReplayAddress(String replayAddress) {
        this.replayAddress = replayAddress;
    }
    public String getToAddress() {
        return toAddress;
    }
    public void setToAddress(String toAddress) {
        this.toAddress = toAddress;
    }
    public String getSubject() {
        return subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
}
