/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Helpers;

import java.net.Authenticator;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Titan
 */
public class sendEmail {

    public static void autoSendEmail(String email, String userName, String password) {
        try {
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.debug", "true");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            Session s = Session.getInstance(props, null);
            MimeMessage message = new MimeMessage(s);
            InternetAddress from = new InternetAddress("accp0906@gmail.com");
            message.setFrom(from);
            message.setContent("Your message", "text/plain");
            InternetAddress to = new InternetAddress(email);
            message.addRecipient(Message.RecipientType.TO, to);
            message.setSubject("You just have a account in our website");
            message.setText("Username: " + userName + "\nPassword: " + password);
            Transport tr = s.getTransport("smtp");
            tr.connect("smtp.gmail.com", "accp0906@gmail.com", "aptech0906");
            message.saveChanges();
            tr.sendMessage(message, message.getAllRecipients());
        } catch (AddressException ex) {
            Logger.getLogger(sendEmail.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(sendEmail.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

     public static void sendMail_FeedBack(String subject, String detail, String answer, String email) {
        try {
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.debug", "true");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            Session s = Session.getInstance(props, null);
            MimeMessage message = new MimeMessage(s);
            InternetAddress from = new InternetAddress("accp0906@gmail.com");
            message.setFrom(from);
            message.setContent("Your message", "text/plain");
            InternetAddress to = new InternetAddress(email);
            message.addRecipient(Message.RecipientType.TO, to);
            message.setSubject("Feedback Answer");
            message.setText("Email : " + email + ".\nSubject : " + subject + ".\nDetail : " + detail + ".\nAnswer : " + answer);
            Transport tr = s.getTransport("smtp");
            tr.connect("smtp.gmail.com", "accp0906@gmail.com", "aptech0906");
            message.saveChanges();
            tr.sendMessage(message, message.getAllRecipients());
        } catch (AddressException ex) {
            Logger.getLogger(sendEmail.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(sendEmail.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void sendMail_contact(String subject, String detail, String email) {
        try {
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.debug", "true");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            Session s = Session.getInstance(props, null);
            MimeMessage message = new MimeMessage(s);
            InternetAddress from = new InternetAddress("accp0906@gmail.com");
            message.setFrom(from);
            message.setContent("Your message", "text/plain");
            InternetAddress to = new InternetAddress("tini12081991@gmail.com");
            message.addRecipient(Message.RecipientType.TO, to);
            message.setSubject("Contact us");
            message.setText("Email : " + email + ".\nSubject : " + subject + ".\nDetail : " + detail);
            Transport tr = s.getTransport("smtp");
            tr.connect("smtp.gmail.com", "accp0906@gmail.com", "aptech0906");
            message.saveChanges();
            tr.sendMessage(message, message.getAllRecipients());
        } catch (AddressException ex) {
            Logger.getLogger(sendEmail.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(sendEmail.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
