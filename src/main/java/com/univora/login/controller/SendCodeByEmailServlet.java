package com.univora.login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login/sendcodebyemail.do")
public class SendCodeByEmailServlet extends HttpServlet {

    // 인증번호를 저장할 메모리 공간
    private static final ConcurrentHashMap<String, String> verificationCodes = new ConcurrentHashMap<>();
    private static final int CODE_EXPIRATION_TIME = 5 * 60 * 1000; // 5분

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        if (email == null || email.isEmpty()) {
            out.write("{\"success\": false, \"message\": \"이메일 주소를 입력해주세요.\"}");
            return;
        }

        String verificationCode = generateVerificationCode();
        verificationCodes.put(email, verificationCode);
        scheduleCodeExpiration(email);

        boolean emailSent = sendEmail(email, verificationCode);

        if (emailSent) {
            out.write("{\"success\": true, \"message\": \"인증번호가 발송되었습니다.\"}");
        } else {
            out.write("{\"success\": false, \"message\": \"이메일 전송에 실패했습니다.\"}");
        }
    }

    private boolean sendEmail(String to, String verificationCode) {
        final String from = "careq2427@gmail.com"; // 발신자 이메일
        final String password = "wpiw fyhs udeq cocn"; // 발신자 이메일 비밀번호

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject("인증번호 안내");
            message.setText("귀하의 인증번호는: " + verificationCode + " 입니다. 5분 내에 입력해주세요.");

            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

    private String generateVerificationCode() {
        Random random = new Random();
        int code = 100000 + random.nextInt(900000);
        return String.valueOf(code);
    }

    private void scheduleCodeExpiration(String email) {
        new Thread(() -> {
            try {
                Thread.sleep(CODE_EXPIRATION_TIME);
                verificationCodes.remove(email);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }).start();
    }

    public static boolean verifyCode(String email, String inputCode) {
        String storedCode = verificationCodes.get(email);
        return storedCode != null && storedCode.equals(inputCode);
    }
}
