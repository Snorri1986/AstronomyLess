/*
* Author: Denys Shabelnyk
* Date: 02.04.2019
* Description: class for managing(upload etc...) all lessons in the site
*/
package com.astronomylesson;

/*import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;*/

import java.io.*;
import java.sql.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class AdminLessons {

    public static boolean setNewLection(String lesson_id) throws IOException {
        boolean result = false;
        switch (lesson_id) {
            case "1": {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\nl1\\lections.html");
                dest_file.delete();

                // copy file to new lection folder
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\newlection\\lections.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\nl1\\lections.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0) {
                    out.write(buffer, 0, length);
                }
                in.close();
                out.close();
                result = true;
                break;
            }

            case "2": {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\nl2\\lections.html");
                dest_file.delete();

                // copy file to new lection folder
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\newlection\\lections.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\nl2\\lections.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0) {
                    out.write(buffer, 0, length);
                }
                in.close();
                out.close();
                result = true;
                break;
            }

            case "3": {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\nl3\\lections.html");
                dest_file.delete();

                // copy file to new lection folder
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\newlection\\lections.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\nl3\\lections.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0) {
                    out.write(buffer, 0, length);
                }
                in.close();
                out.close();
                result = true;
                break;
            }

            case "4": {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\nl4\\lections.html");
                dest_file.delete();

                // copy file to new lection folder
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\newlection\\lections.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\nl4\\lections.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0) {
                    out.write(buffer, 0, length);
                }
                in.close();
                out.close();
                result = true;
                break;
            }

            case "5": {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\nl5\\lections.html");
                dest_file.delete();

                // copy file to new lection folder
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\newlection\\lections.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\nl5\\lections.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0) {
                    out.write(buffer, 0, length);
                }
                in.close();
                out.close();
                result = true;
                break;
            }

            case "6": {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\nl6\\lections.html");
                dest_file.delete();

                // copy file to new lection folder
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\newlection\\lections.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\nl6\\lections.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0) {
                    out.write(buffer, 0, length);
                }
                in.close();
                out.close();
                result = true;
                break;
            }

            case "7": {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\nl7\\lections.html");
                dest_file.delete();

                // copy file to new lection folder
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\newlection\\lections.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\nl7\\lections.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0) {
                    out.write(buffer, 0, length);
                }
                in.close();
                out.close();
                result = true;
                break;
            }

            case "8": {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\nl8\\lections.html");
                dest_file.delete();

                // copy file to new lection folder
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\newlection\\lections.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\nl8\\lections.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0) {
                    out.write(buffer, 0, length);
                }
                in.close();
                out.close();
                result = true;
                break;
            }

            case "9": {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\nl9\\lections.html");
                dest_file.delete();

                // copy file to new lection folder
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\newlection\\lections.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\nl9\\lections.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0) {
                    out.write(buffer, 0, length);
                }
                in.close();
                out.close();
                result = true;
                break;
            }
        }
        return result;
    }
    // ... //
    // Set new lesson in main.html

    public static boolean setNewLesson(String lesson_id) throws IOException {

        int l_id = Integer.parseInt(lesson_id);
        boolean result = false;
        switch (l_id) {

            case 1: {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\main.html");
                dest_file.delete();

                // copy file from backup
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\nlmain\\1\\main.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\main.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0) {
                    out.write(buffer, 0, length);
                }

                in.close();
                out.close();

                result = true;
                break;

            }

            // default lesson
            case 0: {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\main.html");
                dest_file.delete();

                // copy file from backup
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\defmain\\main.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\main.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0) {
                    out.write(buffer, 0, length);
                }

                in.close();
                out.close();

                result = true;
                break;

            }

            case 2: {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\main.html");
                dest_file.delete();

                // copy file from backup
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\nlmain\\2\\main.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\main.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0) {
                    out.write(buffer, 0, length);
                }

                in.close();
                out.close();

                result = true;
                break;
            }

            case 3: {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\main.html");
                dest_file.delete();

                // copy file from backup
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\nlmain\\3\\main.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\main.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0) {
                    out.write(buffer, 0, length);
                }

                in.close();
                out.close();

                result = true;
                break;
            }


            case 4: {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\main.html");
                dest_file.delete();

                // copy file from backup
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\nlmain\\4\\main.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\main.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0) {
                    out.write(buffer, 0, length);
                }

                in.close();
                out.close();

                result = true;
                break;
            }

            case 5: {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\main.html");
                dest_file.delete();

                // copy file from backup
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\nlmain\\5\\main.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\main.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0) {
                    out.write(buffer, 0, length);
                }

                in.close();
                out.close();

                result = true;
                break;
            }

            case 6: {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\main.html");
                dest_file.delete();

                // copy file from backup
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\nlmain\\6\\main.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\main.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0) {
                    out.write(buffer, 0, length);
                }

                in.close();
                out.close();

                result = true;
                break;
            }


            case 7: {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\main.html");
                dest_file.delete();

                // copy file from backup
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\nlmain\\7\\main.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\main.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0) {
                    out.write(buffer, 0, length);
                }

                in.close();
                out.close();

                result = true;
                break;
            }

            case 8: {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\main.html");
                dest_file.delete();

                // copy file from backup
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\nlmain\\8\\main.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\main.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0) {
                    out.write(buffer, 0, length);
                }

                in.close();
                out.close();

                result = true;
                break;
            }

            case 9: {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\main.html");
                dest_file.delete();

                // copy file from backup
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\nlmain\\9\\main.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\main.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0) {
                    out.write(buffer, 0, length);
                }

                in.close();
                out.close();

                result = true;
                break;
            }

        }
        return result;
    }


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

                } catch(SQLException e) {
                    e.printStackTrace();
                }
                  }catch(ClassNotFoundException e) {
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

            } catch(SQLException e) {
                e.printStackTrace();
            }
        }catch(ClassNotFoundException e) {
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

            } catch(SQLException e) {
                e.printStackTrace();
            }
        }catch(ClassNotFoundException e) {
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
        props.put("mail.smtp.password", sender_pass );
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(sender_name));
            InternetAddress[] toAddress = new InternetAddress[usr_recipient_arr.length];

            // To get the array of addresses
            for( int i = 0; i < usr_recipient_arr.length; i++ ) {
                toAddress[i] = new InternetAddress(usr_recipient_arr[i]);
            }

            for( int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }

            message.setSubject(subject);
            message.setText(body);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, sender_name, sender_pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();

            res = true;
        }
        catch (AddressException ae) {
            ae.printStackTrace();
        }
        catch (MessagingException me) {
            me.printStackTrace();
        }
        return res;
    }


    // update text of lection
    public static boolean SetNewLectioninDB(String btn_num, String txt) throws ClassNotFoundException {
        boolean result = false;
        int lection_nums = 54;

        if(Integer.parseInt(btn_num) > lection_nums) return result;

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

        if(Integer.parseInt(btn_num) > lection_nums) return result;

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

}



