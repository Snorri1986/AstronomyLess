/*
* Author: Denys Shabelnyk
* Description: class for working with all buttons in the site
*/
package com.astronomylesson;

// test code 11.03.2019
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.*;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;

public class ButtonsWorker {

    // change buttons description in lections ready to commit 04.03.2019
    public static String changer(String nbt, String n_btn_name) throws IOException {
        // ready to commit 28.02.2019
        String btnname = " ";
        // ready to commit 11.03.2019
        Element html_tag = null;
        Document doc = null;
        String str_html_tag = " ";
        // ...
        // which button 28.02.2019
        switch (nbt) {
            case "b1": {

                // check by null test code 14.03.2019
                /*if (n_btn_name == " ") {
                    btnname = "The name of button should't be NULL";
                    break;
                }*/
                // ...


                // ready to commit 11.03.2019
                // change name of button
                String new_button_name_html = "<button type=\"button\" " +
                        "class=\"btn btn-info btn-lg btn-block\" " +
                        "data-toggle=\"modal\" data-target=\"#Mercury\"" +
                        " value=\"Mercury\">" + n_btn_name + "</button>";
                // ...
                // ready to commit 11.03.2019
                try {

                    doc = Jsoup.connect("http://localhost/astronomy/lections.html").get();
                    Elements buttons = doc.select("button[value=\"Mercury\"]");

                    for (Element but : buttons) {
                        html_tag = but;
                    }
                    //
                    // for test reason(delete before release)
                    //btnname = nbt + " " + n_btn_name ; // test code 04.03.2019

                    // Current tag in String
                    str_html_tag = html_tag.toString();
                    //

                    File lection = new File("C:\\xampp\\htdocs\\astronomy\\newlection\\lections.html");
                    String search = str_html_tag;  // <- changed to work with String.replaceAll()
                    String replacement = new_button_name_html;
                    //file reading
                    try {
                        FileReader fr = new FileReader(lection);
                        String s;
                        String totalStr = "";
                        try (BufferedReader br = new BufferedReader(fr)) {

                            while ((s = br.readLine()) != null) {
                                totalStr += s;
                            }
                            totalStr = totalStr.replaceAll(search, replacement);
                            // file writing
                            FileWriter fw = new FileWriter(lection);
                            fw.write(totalStr);
                            fw.close();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                } catch (IOException e) {
                    e.printStackTrace();
                }
                // ... //

                btnname = n_btn_name;
                break;
            }

            case "b2": {

                // ready to commit 12.03.2019
                String new_button_name_html = "<button type=\"button\" " +
                        "class=\"btn btn-info btn-lg btn-block\" " +
                        "data-toggle=\"modal\" data-target=\"#Venus\"" +
                        " value=\"Venus\">" + n_btn_name + "</button>";
                // ...
                // ready to commit 12.03.2019
                try {

                    doc = Jsoup.connect("http://localhost/astronomy/lections.html").get();
                    Elements buttons = doc.select("button[value=\"Venus\"]");

                    for (Element but : buttons) {
                        html_tag = but;
                    }
                    //
                    // for test reason(delete before release)
                    //btnname = nbt + " " + n_btn_name ; // test code 04.03.2019

                    // Current tag in String
                    str_html_tag = html_tag.toString();
                    //

                    File lection = new File("C:\\xampp\\htdocs\\astronomy\\newlection\\lections.html");
                    String search = str_html_tag;  // <- changed to work with String.replaceAll()
                    String replacement = new_button_name_html;
                    //file reading
                    try {
                        FileReader fr = new FileReader(lection);
                        String s;
                        String totalStr = "";
                        try (BufferedReader br = new BufferedReader(fr)) {

                            while ((s = br.readLine()) != null) {
                                totalStr += s;
                            }
                            totalStr = totalStr.replaceAll(search, replacement);
                            // file writing
                            FileWriter fw = new FileWriter(lection);
                            fw.write(totalStr);
                            fw.close();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                } catch (IOException e) {
                    e.printStackTrace();
                }
                // ...

                btnname = n_btn_name;


                // for test reason(delete before release)
                //btnname = nbt + " " + n_btn_name ; // test code 04.03.2019
                break;
            }

            case "b3": {

                // ready to commit 12.03.2019
                String new_button_name_html = "<button type=\"button\" " +
                        "class=\"btn btn-info btn-lg btn-block\" " +
                        "data-toggle=\"modal\" data-target=\"#Earth\"" +
                        " value=\"Earth\">" + n_btn_name + "</button>";
                // ...
                // ready to commit 12.03.2019
                try {

                    doc = Jsoup.connect("http://localhost/astronomy/lections.html").get();
                    Elements buttons = doc.select("button[value=\"Earth\"]");

                    for (Element but : buttons) {
                        html_tag = but;
                    }
                    //
                    // for test reason(delete before release)
                    //btnname = nbt + " " + n_btn_name ; // test code 04.03.2019

                    // Current tag in String
                    str_html_tag = html_tag.toString();
                    //

                    File lection = new File("C:\\xampp\\htdocs\\astronomy\\newlection\\lections.html");
                    String search = str_html_tag;  // <- changed to work with String.replaceAll()
                    String replacement = new_button_name_html;
                    //file reading
                    try {
                        FileReader fr = new FileReader(lection);
                        String s;
                        String totalStr = "";
                        try (BufferedReader br = new BufferedReader(fr)) {

                            while ((s = br.readLine()) != null) {
                                totalStr += s;
                            }
                            totalStr = totalStr.replaceAll(search, replacement);
                            // file writing
                            FileWriter fw = new FileWriter(lection);
                            fw.write(totalStr);
                            fw.close();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                } catch (IOException e) {
                    e.printStackTrace();
                }
                // ...

                btnname = n_btn_name;

                // / for test reason(delete before release)
                //btnname = nbt;
                break;
            }

            case "b4": {

                // ready to commit 12.03.2019
                String new_button_name_html = "<button type=\"button\" " +
                        "class=\"btn btn-info btn-lg btn-block\" " +
                        "data-toggle=\"modal\" data-target=\"#Mars\"" +
                        " value=\"Mars\">" + n_btn_name + "</button>";
                // ...
                // ready to commit 12.03.2019
                try {

                    doc = Jsoup.connect("http://localhost/astronomy/lections.html").get();
                    Elements buttons = doc.select("button[value=\"Mars\"]");

                    for (Element but : buttons) {
                        html_tag = but;
                    }
                    //
                    // for test reason(delete before release)
                    //btnname = nbt + " " + n_btn_name ; // test code 04.03.2019

                    // Current tag in String
                    str_html_tag = html_tag.toString();
                    //

                    File lection = new File("C:\\xampp\\htdocs\\astronomy\\newlection\\lections.html");
                    String search = str_html_tag;  // <- changed to work with String.replaceAll()
                    String replacement = new_button_name_html;
                    //file reading
                    try {
                        FileReader fr = new FileReader(lection);
                        String s;
                        String totalStr = "";
                        try (BufferedReader br = new BufferedReader(fr)) {

                            while ((s = br.readLine()) != null) {
                                totalStr += s;
                            }
                            totalStr = totalStr.replaceAll(search, replacement);
                            // file writing
                            FileWriter fw = new FileWriter(lection);
                            fw.write(totalStr);
                            fw.close();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                } catch (IOException e) {
                    e.printStackTrace();
                }
                // ...

                btnname = n_btn_name;

                // for test reason(delete before release)
                //btnname = nbt;
                break;
            }

            case "b5": {

                // ready to commit 12.03.2019
                String new_button_name_html = "<button type=\"button\" " +
                        "class=\"btn btn-info btn-lg btn-block\" " +
                        "data-toggle=\"modal\" data-target=\"#Jupiter\"" +
                        " value=\"Jupiter\">" + n_btn_name + "</button>";
                // ...
                // ready to commit 12.03.2019
                try {

                    doc = Jsoup.connect("http://localhost/astronomy/lections.html").get();
                    Elements buttons = doc.select("button[value=\"Jupiter\"]");

                    for (Element but : buttons) {
                        html_tag = but;
                    }
                    //
                    // for test reason(delete before release)
                    //btnname = nbt + " " + n_btn_name ; // test code 04.03.2019

                    // Current tag in String
                    str_html_tag = html_tag.toString();
                    //

                    File lection = new File("C:\\xampp\\htdocs\\astronomy\\newlection\\lections.html");
                    String search = str_html_tag;  // <- changed to work with String.replaceAll()
                    String replacement = new_button_name_html;
                    //file reading
                    try {
                        FileReader fr = new FileReader(lection);
                        String s;
                        String totalStr = "";
                        try (BufferedReader br = new BufferedReader(fr)) {

                            while ((s = br.readLine()) != null) {
                                totalStr += s;
                            }
                            totalStr = totalStr.replaceAll(search, replacement);
                            // file writing
                            FileWriter fw = new FileWriter(lection);
                            fw.write(totalStr);
                            fw.close();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                } catch (IOException e) {
                    e.printStackTrace();
                }
                // ...

                btnname = n_btn_name;

                // for test reason(delete before release)
                //btnname = nbt;
                break;
            }

            case "b6": {

                // ready to commit 12.03.2019
                String new_button_name_html = "<button type=\"button\" " +
                        "class=\"btn btn-info btn-lg btn-block\" " +
                        "data-toggle=\"modal\" data-target=\"#Saturn\"" +
                        " value=\"Saturn\">" + n_btn_name + "</button>";
                // ...
                // ready to commit 12.03.2019
                try {

                    doc = Jsoup.connect("http://localhost/astronomy/lections.html").get();
                    Elements buttons = doc.select("button[value=\"Saturn\"]");

                    for (Element but : buttons) {
                        html_tag = but;
                    }
                    //
                    // for test reason(delete before release)
                    //btnname = nbt + " " + n_btn_name ; // test code 04.03.2019

                    // Current tag in String
                    str_html_tag = html_tag.toString();
                    //

                    File lection = new File("C:\\xampp\\htdocs\\astronomy\\newlection\\lections.html");
                    String search = str_html_tag;  // <- changed to work with String.replaceAll()
                    String replacement = new_button_name_html;
                    //file reading
                    try {
                        FileReader fr = new FileReader(lection);
                        String s;
                        String totalStr = "";
                        try (BufferedReader br = new BufferedReader(fr)) {

                            while ((s = br.readLine()) != null) {
                                totalStr += s;
                            }
                            totalStr = totalStr.replaceAll(search, replacement);
                            // file writing
                            FileWriter fw = new FileWriter(lection);
                            fw.write(totalStr);
                            fw.close();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                } catch (IOException e) {
                    e.printStackTrace();
                }
                // ...

                btnname = n_btn_name;

                // for test reason(delete before release)
                //btnname = nbt;
                break;
            }

            case "b7": {

                // ready to commit 12.03.2019
                String new_button_name_html = "<button type=\"button\" " +
                        "class=\"btn btn-info btn-lg btn-block\" " +
                        "data-toggle=\"modal\" data-target=\"#Uranus\"" +
                        " value=\"Uranus\">" + n_btn_name + "</button>";
                // ...
                // ready to commit 12.03.2019
                try {

                    doc = Jsoup.connect("http://localhost/astronomy/lections.html").get();
                    Elements buttons = doc.select("button[value=\"Uranus\"]");

                    for (Element but : buttons) {
                        html_tag = but;
                    }
                    //
                    // for test reason(delete before release)
                    //btnname = nbt + " " + n_btn_name ; // test code 04.03.2019

                    // Current tag in String
                    str_html_tag = html_tag.toString();
                    //

                    File lection = new File("C:\\xampp\\htdocs\\astronomy\\newlection\\lections.html");
                    String search = str_html_tag;  // <- changed to work with String.replaceAll()
                    String replacement = new_button_name_html;
                    //file reading
                    try {
                        FileReader fr = new FileReader(lection);
                        String s;
                        String totalStr = "";
                        try (BufferedReader br = new BufferedReader(fr)) {

                            while ((s = br.readLine()) != null) {
                                totalStr += s;
                            }
                            totalStr = totalStr.replaceAll(search, replacement);
                            // file writing
                            FileWriter fw = new FileWriter(lection);
                            fw.write(totalStr);
                            fw.close();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                } catch (IOException e) {
                    e.printStackTrace();
                }
                // ...

                btnname = n_btn_name;

                // for test reason(delete before release)
                //btnname = nbt;
                break;
            }

            case "b8": {

                // ready to commit 12.03.2019
                String new_button_name_html = "<button type=\"button\" " +
                        "class=\"btn btn-info btn-lg btn-block\" " +
                        "data-toggle=\"modal\" data-target=\"#Neptune\"" +
                        " value=\"Neptune\">" + n_btn_name + "</button>";
                // ...
                // ready to commit 12.03.2019
                try {

                    doc = Jsoup.connect("http://localhost/astronomy/lections.html").get();
                    Elements buttons = doc.select("button[value=\"Neptune\"]");

                    for (Element but : buttons) {
                        html_tag = but;
                    }
                    //
                    // for test reason(delete before release)
                    //btnname = nbt + " " + n_btn_name ; // test code 04.03.2019

                    // Current tag in String
                    str_html_tag = html_tag.toString();
                    //

                    File lection = new File("C:\\xampp\\htdocs\\astronomy\\newlection\\lections.html");
                    String search = str_html_tag;  // <- changed to work with String.replaceAll()
                    String replacement = new_button_name_html;
                    //file reading
                    try {
                        FileReader fr = new FileReader(lection);
                        String s;
                        String totalStr = "";
                        try (BufferedReader br = new BufferedReader(fr)) {

                            while ((s = br.readLine()) != null) {
                                totalStr += s;
                            }
                            totalStr = totalStr.replaceAll(search, replacement);
                            // file writing
                            FileWriter fw = new FileWriter(lection);
                            fw.write(totalStr);
                            fw.close();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                } catch (IOException e) {
                    e.printStackTrace();
                }
                // ...

                btnname = n_btn_name;

                // for test reason(delete before release)
                //btnname = nbt;
                break;
            }

            case "b9": {

                // ready to commit 12.03.2019
                String new_button_name_html = "<button type=\"button\" " +
                        "class=\"btn btn-info btn-lg btn-block\" " +
                        "data-toggle=\"modal\" data-target=\"#Pluto\"" +
                        " value=\"Pluto\">" + n_btn_name + "</button>";
                // ...
                // ready to commit 12.03.2019
                try {

                    doc = Jsoup.connect("http://localhost/astronomy/lections.html").get();
                    Elements buttons = doc.select("button[value=\"Pluto\"]");

                    for (Element but : buttons) {
                        html_tag = but;
                    }
                    //
                    // for test reason(delete before release)
                    //btnname = nbt + " " + n_btn_name ; // test code 04.03.2019

                    // Current tag in String
                    str_html_tag = html_tag.toString();
                    //

                    File lection = new File("C:\\xampp\\htdocs\\astronomy\\newlection\\lections.html");
                    String search = str_html_tag;  // <- changed to work with String.replaceAll()
                    String replacement = new_button_name_html;
                    //file reading
                    try {
                        FileReader fr = new FileReader(lection);
                        String s;
                        String totalStr = "";
                        try (BufferedReader br = new BufferedReader(fr)) {

                            while ((s = br.readLine()) != null) {
                                totalStr += s;
                            }
                            totalStr = totalStr.replaceAll(search, replacement);
                            // file writing
                            FileWriter fw = new FileWriter(lection);
                            fw.write(totalStr);
                            fw.close();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                } catch (IOException e) {
                    e.printStackTrace();
                }
                // ...

                btnname = n_btn_name;

                // for test reason(delete before release)
                //btnname = nbt;
                break;
            }
        }

        return btnname;
        ///
    }

    // code is ready but not unification 26.03.2019
    // should be unification
    // Discard all changes
    public static void discardButtonsName() throws IOException {
        //String source = "E:\\lec_backup\\lections.html\"";
        //String dest = "E:\\folder\\lections.html\"";

        // test code 26.03.2019
        // delete file in target folder
        File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\newlection\\lections.html"); // constant ready to commit 26.03.2019
        dest_file.delete();

        // copy file from backup
        InputStream in = new FileInputStream("C:\\xampp\\htdocs\\astronomy\\defaultlection\\lections.html");
        OutputStream out = new FileOutputStream("C:\\xampp\\htdocs\\astronomy\\newlection\\lections.html");

        byte[] buffer = new byte[1024];

        int length;
        //copy the file content in bytes
        while ((length = in.read(buffer)) > 0) {
            out.write(buffer, 0, length);
        }

        in.close();
        out.close();
    }

    //  test code 14.05.2019
    /*public static String getButtonNameDB(int les_num, int n_id ) throws ClassNotFoundException {
        String current_answer = " ";

        Class.forName("com.mysql.jdbc.Driver");

        //String html_txt = " ";  // test code 20.05.2019
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
        String sql = "{call getCurrentAnswer(?,?,?)}"; // test code 16.05.2019

        try (Connection conn = DriverManager.getConnection(jdbcUrl, username, password);
             CallableStatement stmt = conn.prepareCall(sql)) {

            //Set IN parameter
            stmt.setInt(1, les_num);
            stmt.setInt(2, n_id);


            //Set OUT parameter
            stmt.registerOutParameter(3, Types.VARCHAR);

            //Execute stored procedure
            stmt.execute();

            //Set result variable
            current_answer = stmt.getString(3); // test code 20.05.2019

            // close connection
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return current_answer;
    }*/
    // ... //

    // checking wheater of answer test code 25.07.2019
   /* public static boolean isAnswerChecker(String req_arg) {
        boolean res = true;
        int i = 0; // terminator
        int dig_req_args = Integer.parseInt(req_arg);
        if(dig_req_args >= 1 && dig_req_args <= 54) {
            i = 1;
        } else
        {
            res = false;
        }
        return res;
    }*/


}
// ... //