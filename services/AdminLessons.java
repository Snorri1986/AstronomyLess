/*
* Author: Denys Shabelnyk
* Date: 02.04.2019
* Description: class for managing(upload etc...) all lessons in the site
*/
package com.astronomylesson;


import java.io.*;
import java.sql.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class AdminLessons {

    // change question for general test
    public static boolean setNewQuestion(String id, String txt, String less_num) {
        boolean res = true;
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            // connect to MySQL DB
            String jdbcUrl = "jdbc:mysql://localhost:3306/solarsystem" +
                    "?verifyServerCertificate=false" +
                    "&useSSL=false" +
                    "&requireSSL=false" +
                    "&useLegacyDatetimeCode=false" +
                    "&amp" +
                    "&serverTimezone=UTC";
            String username = "spaceman";
            String password = "mask";

            try {

                Connection conn = DriverManager.getConnection(jdbcUrl, username, password);

                String sql = "{call setNewQuestion(?,?,?)}";
                CallableStatement stmt = conn.prepareCall(sql);

                //Set IN parameter
                stmt.setString(1, id);
                stmt.setString(2, txt);
                stmt.setString(3, less_num);

                stmt.execute();
                conn.close();

            } catch (SQLException e) {
                e.printStackTrace();
                res = false;
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            res = false;
        }
        return res;
    }

    // get current login from application session

    public static String getLogin() throws ClassNotFoundException {

        String user_login = " ";

        Class.forName("com.mysql.jdbc.Driver");

        // connect to MySQL DB
        String jdbcUrl = "jdbc:mysql://localhost:3306/solarsystem" +
                "?verifyServerCertificate=false" +
                "&useSSL=false" +
                "&requireSSL=false" +
                "&useLegacyDatetimeCode=false" +
                "&amp" +
                "&serverTimezone=UTC";
        String username = "spaceman";
        String password = "mask";
        String sql = "{call getYoungestLogin(?)}";


        try (Connection conn = DriverManager.getConnection(jdbcUrl, username, password);
             CallableStatement stmt = conn.prepareCall(sql)) {

            //Set OUT parameter
            stmt.registerOutParameter(1, Types.VARCHAR);

            //Execute stored procedure
            stmt.execute();

            //Set result variable
            user_login = stmt.getString(1);

            // close connection
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user_login;
    }

    // Saving user's score in DB
    public static void saveScoreinDb(int score_value) throws ClassNotFoundException {

        // Get user login
        String current_login_user = AdminLessons.getLogin();

        Class.forName("com.mysql.jdbc.Driver");

        // connect to MySQL DB
        String jdbcUrl = "jdbc:mysql://localhost:3306/solarsystem" +
                "?verifyServerCertificate=false" +
                "&useSSL=false" +
                "&requireSSL=false" +
                "&useLegacyDatetimeCode=false" +
                "&amp" +
                "&serverTimezone=UTC";
        String username = "spaceman";
        String password = "mask";
        String sql = "{call saveScores(?,?)}";

        try (Connection conn = DriverManager.getConnection(jdbcUrl, username, password);
             CallableStatement stmt = conn.prepareCall(sql)) {

            //Set IN parameter
            stmt.setInt(1, score_value);
            stmt.setString(2, current_login_user);

            //Execute stored procedure
            stmt.execute();

            // close connection
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    // getSender
    public static String getSenderMailboxDB() {
        String sender_login = " ";
        // connect to MySQL DB

        // call DB
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            // connect to MySQL DB
            String jdbcUrl = "jdbc:mysql://localhost:3306/solarsystem" +
                    "?verifyServerCertificate=false" +
                    "&useSSL=false" +
                    "&requireSSL=false" +
                    "&useLegacyDatetimeCode=false" +
                    "&amp" +
                    "&serverTimezone=UTC";
            String username = "spaceman";
            String password = "mask";

            try {
                Connection conn = DriverManager.getConnection(jdbcUrl, username, password);

                String sql = "{call GetSenderMail(?)}";
                CallableStatement stmt = conn.prepareCall(sql);
                //Set OUT parameter
                stmt.registerOutParameter(1, Types.VARCHAR);

                stmt.execute();
                sender_login = stmt.getString(1);
                conn.close();

            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return sender_login;
    }

    // ... //

    // sender pass
    public static String getSenderPassDB() {
        String sender_pass = " ";
        // connect to MySQL DB

        // call DB
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            // connect to MySQL DB
            String jdbcUrl = "jdbc:mysql://localhost:3306/solarsystem" +
                    "?verifyServerCertificate=false" +
                    "&useSSL=false" +
                    "&requireSSL=false" +
                    "&useLegacyDatetimeCode=false" +
                    "&amp" +
                    "&serverTimezone=UTC";
            String username = "spaceman";
            String password = "mask";

            try {
                Connection conn = DriverManager.getConnection(jdbcUrl, username, password);

                String sql = "{call GetSenderPass(?)}";
                CallableStatement stmt = conn.prepareCall(sql);
                //Set OUT parameter
                stmt.registerOutParameter(1, Types.VARCHAR);

                stmt.execute();
                sender_pass = stmt.getString(1);
                conn.close();

            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return sender_pass;
    }
    // ...//

    // getRecepient
    public static String getRecipientMailDB() {
        String recipient_mail = " ";
        // connect to MySQL DB

        // call DB
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            // connect to MySQL DB
            String jdbcUrl = "jdbc:mysql://localhost:3306/solarsystem" +
                    "?verifyServerCertificate=false" +
                    "&useSSL=false" +
                    "&requireSSL=false" +
                    "&useLegacyDatetimeCode=false" +
                    "&amp" +
                    "&serverTimezone=UTC";
            String username = "spaceman";
            String password = "mask";

            try {
                Connection conn = DriverManager.getConnection(jdbcUrl, username, password);

                String sql = "{call GetRecipientMail(?)}";
                CallableStatement stmt = conn.prepareCall(sql);
                //Set OUT parameter
                stmt.registerOutParameter(1, Types.VARCHAR);

                stmt.execute();
                recipient_mail = stmt.getString(1);
                conn.close();

            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return recipient_mail;
    }
    // ... //

    //sendSurvey
    public static boolean sendSurveytoMail(String srv_text) {
        boolean res = false;
        String sender_name = getSenderMailboxDB();
        String sender_pass = getSenderPassDB();
        String usr_recipient = getRecipientMailDB();
        String[] usr_recipient_arr = {usr_recipient};

        String subject = "Survey on article";
        String body = srv_text;

        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", sender_name);
        props.put("mail.smtp.password", sender_pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(sender_name));
            InternetAddress[] toAddress = new InternetAddress[usr_recipient_arr.length];

            // To get the array of addresses
            for (int i = 0; i < usr_recipient_arr.length; i++) {
                toAddress[i] = new InternetAddress(usr_recipient_arr[i]);
            }

            for (int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }

            message.setSubject(subject);
            message.setText(body);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, sender_name, sender_pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();

            res = true;
        } catch (AddressException ae) {
            ae.printStackTrace();
        } catch (MessagingException me) {
            me.printStackTrace();
        }
        return res;
    }


    // update text of lection
    public static boolean SetNewLectioninDB(String btn_num, String txt) throws ClassNotFoundException {
        boolean result = false;
        int lection_nums = 55;

        if (Integer.parseInt(btn_num) > lection_nums) return result;

        Class.forName("com.mysql.jdbc.Driver");

        // connect to MySQL DB
        String jdbcUrl = "jdbc:mysql://localhost:3306/solarsystem" +
                "?verifyServerCertificate=false" +
                "&useSSL=false" +
                "&requireSSL=false" +
                "&useLegacyDatetimeCode=false" +
                "&amp" +
                "&serverTimezone=UTC";
        String username = "spaceman";
        String password = "mask";
        String sql = "{call SetNewLectionText(?,?)}";

        try (Connection conn = DriverManager.getConnection(jdbcUrl, username, password);
             CallableStatement stmt = conn.prepareCall(sql)) {

            //Set IN parameter
            stmt.setString(1, btn_num);
            stmt.setString(2, txt);

            //Execute stored procedure
            stmt.execute();

            // close connection
            conn.close();

            result = true;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
    // ... //

    // set new names of button in lection.
    public static boolean SetNewButtonNameInLection(String new_btn_num, String btn_num, String less_num) throws ClassNotFoundException {
        boolean result = false;
        int lection_nums = 54;

        if (Integer.parseInt(btn_num) > lection_nums) return result;

        Class.forName("com.mysql.jdbc.Driver");

        // connect to MySQL DB
        String jdbcUrl = "jdbc:mysql://localhost:3306/solarsystem" +
                "?verifyServerCertificate=false" +
                "&useSSL=false" +
                "&requireSSL=false" +
                "&useLegacyDatetimeCode=false" +
                "&amp" +
                "&serverTimezone=UTC";
        String username = "spaceman";
        String password = "mask";
        String sql = "{call SetNewNameButtonLection(?,?,?)}";

        try (Connection conn = DriverManager.getConnection(jdbcUrl, username, password);
             CallableStatement stmt = conn.prepareCall(sql)) {

            //Set IN parameter
            stmt.setString(1, new_btn_num);
            stmt.setString(2, btn_num);
            stmt.setString(3, less_num);

            //Execute stored procedure
            stmt.execute();

            // close connection
            conn.close();

            result = true;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
    // ... //

    // Add new event date.
    public static boolean SetNewEvent(String new_evnt_date, String event_descrp) throws ClassNotFoundException {
        boolean result = false;

        Class.forName("com.mysql.jdbc.Driver");

        // connect to MySQL DB
        String jdbcUrl = "jdbc:mysql://localhost:3306/solarsystem" +
                "?verifyServerCertificate=false" +
                "&useSSL=false" +
                "&requireSSL=false" +
                "&useLegacyDatetimeCode=false" +
                "&amp" +
                "&serverTimezone=UTC";
        String username = "spaceman";
        String password = "mask";
        String sql = "{call SetNewEvent(?,?)}";


        try (Connection conn = DriverManager.getConnection(jdbcUrl, username, password);
             CallableStatement stmt = conn.prepareCall(sql)) {

            //Set IN parameter
            stmt.setString(1, new_evnt_date);
            stmt.setString(2, event_descrp);


            //Execute stored procedure
            stmt.execute();

            // close connection
            conn.close();

            result = true;

        } catch (SQLException e) {
            e.printStackTrace();
        }


         return result;
    }
    // ... //
}



