/*
* Author: Denys Shabelnyk
* Date: 03.06.2019
* Description: class for user administration:
* 1) register new user;
* 2) check access for user
 */
package com.astronomylesson;

import java.sql.*;

public class AdminUsers {
    /* Add new new user into DB */

    public static boolean addNewUser(
            String u_name,
            String u_lastname,
            String u_email,
            String u_pass
    ) {
        boolean result = true;

        try {
            // call DB
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

                String query = "INSERT INTO users(name, surname, email, user_pass) \n" +
                        "VALUES (?,?,?,?)";

                // create the mysql insert preparedstatement
                PreparedStatement preparedStmt = conn.prepareStatement(query);
                preparedStmt.setString(1, u_name);
                preparedStmt.setString(2, u_lastname);
                preparedStmt.setString(3, u_email);
                preparedStmt.setString(4, u_pass);


                // execute the preparedstatement
                preparedStmt.execute();

                conn.close();

            } catch (SQLException e) {
                e.printStackTrace();
                result = false;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            result = false;
        }

        return result;

    }

    // User authentication.
    public static boolean authUser(String login, String pass) {
        boolean answer = true;
        // connect to MySQL DB and
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

                String sql = "{call GetUser(?,?,?)}";
                CallableStatement stmt = conn.prepareCall(sql);

                //Set IN parameter
                stmt.setString(1, login);
                stmt.setString(2, pass);

                //Set OUT parameter
                stmt.registerOutParameter(3, Types.INTEGER);
                stmt.execute();

                // Get values from DB
                int res = stmt.getInt(3);

                if(res != 1) {
                    answer = false;
                }


                String set_last_login_date_sql = "{call SetLoginDate(?)}";
                CallableStatement stmt2 = conn.prepareCall(set_last_login_date_sql);
                //Set IN parameter
                stmt2.setString(1, login);
                stmt2.execute();

                conn.close();

            }catch(SQLException e) {
                e.printStackTrace();
            }

        }catch(ClassNotFoundException e) {
            e.printStackTrace();
        }
        return answer;
    }


    // Get First Name, Last Name and scores from DB.
    public static String getFl_Scores(String login) {

        String greeting_message = " ";

        // established db connection
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

                String sql = "{call getFlScores(?,?)}";
                CallableStatement stmt = conn.prepareCall(sql);

                //Set IN parameter
                stmt.setString(1, login);

                //Set OUT parameter
                stmt.registerOutParameter(2, Types.VARCHAR);
                stmt.execute();

                //Set result variable
                greeting_message = stmt.getString(2);

                conn.close();

            }catch(SQLException e) {
                e.printStackTrace();
            }

        }catch(ClassNotFoundException e) {
            e.printStackTrace();
        }


        return greeting_message;
    }
}