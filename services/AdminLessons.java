/*
* Author: Denys Shabelnyk
* Date: 02.04.2019
* Description: class for managing(upload etc...) all lessons in the site
*/
package com.astronomylesson;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.*;
import java.sql.*;

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
        switch(l_id) {

            case  1 :
            {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\main.html");
                dest_file.delete();

                // copy file from backup
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\nlmain\\1\\main.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\main.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0){
                    out.write(buffer, 0, length);
                }

                in.close();
                out.close();

                result = true;
                break;

            }

                // default lesson
            case 0:
            {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\main.html");
                dest_file.delete();

                // copy file from backup
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\defmain\\main.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\main.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0){
                    out.write(buffer, 0, length);
                }

                in.close();
                out.close();

                result = true;
                break;

            }

            case 2:
            {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\main.html");
                dest_file.delete();

                // copy file from backup
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\nlmain\\2\\main.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\main.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0){
                    out.write(buffer, 0, length);
                }

                in.close();
                out.close();

                result = true;
                break;
            }

            case 3:
            {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\main.html");
                dest_file.delete();

                // copy file from backup
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\nlmain\\3\\main.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\main.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0){
                    out.write(buffer, 0, length);
                }

                in.close();
                out.close();

                result = true;
                break;
            }


            case 4:
            {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\main.html");
                dest_file.delete();

                // copy file from backup
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\nlmain\\4\\main.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\main.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0){
                    out.write(buffer, 0, length);
                }

                in.close();
                out.close();

                result = true;
                break;
            }

            case 5:
            {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\main.html");
                dest_file.delete();

                // copy file from backup
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\nlmain\\5\\main.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\main.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0){
                    out.write(buffer, 0, length);
                }

                in.close();
                out.close();

                result = true;
                break;
            }

            case 6:
            {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\main.html");
                dest_file.delete();

                // copy file from backup
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\nlmain\\6\\main.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\main.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0){
                    out.write(buffer, 0, length);
                }

                in.close();
                out.close();

                result = true;
                break;
            }


            case 7:
            {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\main.html");
                dest_file.delete();

                // copy file from backup
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\nlmain\\7\\main.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\main.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0){
                    out.write(buffer, 0, length);
                }

                in.close();
                out.close();

                result = true;
                break;
            }

            case 8:
            {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\main.html");
                dest_file.delete();

                // copy file from backup
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\nlmain\\8\\main.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\main.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0){
                    out.write(buffer, 0, length);
                }

                in.close();
                out.close();

                result = true;
                break;
            }

            case 9:
            {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\main.html");
                dest_file.delete();

                // copy file from backup
                InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\nlmain\\9\\main.html");
                OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\main.html");

                byte[] buffer = new byte[1024];

                int length;
                //copy the file content in bytes
                while ((length = in.read(buffer)) > 0){
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
    public static boolean setNewQuestion(String id,String txt,String less_num) {
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

            }catch(SQLException e) {
                e.printStackTrace();
                res = false;
            }

        }catch(ClassNotFoundException e) {
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

}