package main;

import java.io.IOException;
import java.io.Reader;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import config.SqlMapper;

public class Emailer extends ActionSupport {

	SqlMapClient sqlMapper;
	
	private String from = "smileha1220@gmail.com";
	private String password = "dhrkawk1!";
	private String email; //to
	private String subject = "[SQUARE] 비밀번호 재설정 안내입니다.";
	private String body = "SQUARE 비밀번호 재설정 안내입니다 \n 아래링크를 통해 비밀번호 재설정 페이지로 이동할 수 있습니다. \n ";
	private String id;
	
	static Properties properties = new Properties();
	static {
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.socketFactory.port", "465");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.port", "465");
	}
	
	public Emailer() {
		 sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute() throws Exception{
		int existNumber = 0;
		memberVO member = new memberVO();
		member.setId(getId());
		member.setEmail(getEmail());
		
		existNumber = (int) sqlMapper.queryForObject("emailExistCheck", member);
		if(existNumber == 0)
			return ERROR;
		
		body += "http://localhost:8080/SQUARE/passChange.action?id="+getId();
		
		try {
			Session session = Session.getDefaultInstance(properties, 
					new javax.mail.Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new
							PasswordAuthentication(from, password);
						}
			});
			
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
			message.setSubject(subject);
			message.setText(body);
			Transport.send(message);
			
			}catch(Exception e) {
				e.printStackTrace();
				return ERROR;
				}
		return SUCCESS;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
}
