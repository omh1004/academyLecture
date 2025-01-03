package com.lecture.common.alert.utils;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

import com.lecture.common.alert.config.EmailConfig;

public class EmailSender {

    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final String SMTP_PORT = "587";

    public static void sendEmail(String recipient, String subject, String content) {
        // 설정 파일에서 이메일 계정 정보 로드
        String username = EmailConfig.get("EMAIL_USERNAME");
        String password = EmailConfig.get("EMAIL_PASSWORD");
        
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", SMTP_HOST);
        properties.put("mail.smtp.port", SMTP_PORT);

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            
            System.out.println("userName:++::"+username);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
            message.setSubject(subject);
            message.setText(content);

            Transport.send(message);
            System.out.println("Email sent successfully!");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}