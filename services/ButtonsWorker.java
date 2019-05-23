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

    //  ... //
    // Method for Change answers button for general test
    // test code 14.05.2019
    // !!! Need hard test !!!
    // depended on check answer.
    public static boolean setNewAnswerButtonGenTest(String question_id, String num_id, String ans_txt, String ln, String cor_mark) throws ClassNotFoundException {
        // continue after saved html tags in DB
        boolean result = false;
        // test folder E:\al_test

        /*Algoritm:
        * 1.Download html of button from DB and store it in string variable;
        * 1.1 db_result + tails
        * 2. Using jsoup analyze general_test.html;
          3. Make changes in file
          4. Update db value and put full html_tag(pattern to db)
          */

        // Ability to change answer for 0 (default lesson)
        //tails[0] = default lesson
        /*String[] tails = {
                "Колорис</button>", // [0] = 1 num_id(!!! checked !!! num_id = id from db)
                "Дискавері</button>", // [1] = 2
                "Опортуніті</button>", // [2] = 3
                "280</button>", // [3] = 4
                "243</button>", // [4] = 5
                "10</button>",   // [5] = 6
                "Байкал</button>", // [6] = 7
                "МонБлан</button>", // [7] = 8
                "Маріанська</button>", // [8] = 9
                "Магній</button>", // [9] = 10
                "Спирт</button>", // [10] = 11
                "Оксид заліза</button>", // [11] = 12
                "Венера</button>", // [12] = 13
                "Юнона</button>", // [13] = 14
                "Зевс</button>", // [14] = 15
                "Водневу</button>", // [15] = 16
                "Тверду</button>", // [16] = 17
                "Газоподібну</button>", // [17] = 18
                "Вісь обертання</button>", // [18] = 19
                "Кільця</button>", // [19] = 20
                "Супутники</button>", // [20] = 21
                "Математичних</button>", // [21] = 22
                "Емпіричних</button>", // [22] = 23
                "Спостережень</button>", // [23] = 24
                "Енцелад</button>", // [24] = 25
                "Харон</button>", // [25] = 26
                "Аріель</button>", // [26] = 27
                "Марінер</button>", // [27] = 29
                "Олімп</button>", // [28] = 30
                "Ураганів</button>", // [29] = 31
                "Кратерів</button>", // [30] = 32
                "Вулканів</button>", // [31] = 33
                "Говерла</button>", // [32] = 34
                "МонБлан</button>", // [33] = 35
                "Еверест</button>", // [34] = 36
                "Махава</button>", // [35] = 37
                "Сахара</button>", // [36] = 38
                "Асканія Нова</button>", // [37] = 39
                "24</button>", // [38] = 40
                "10</button>", // [39] = 41
                "48</button>", // [40] = 42
                "50000</button>", // [41] = 43
                "300000</button>", // [42] = 44
                "100000</button>", // [43] = 45
                "Галілео Галілей</button>", // [44] = 46
                "Ісаак Ньютон</button>", // [45] = 47
                "Вільям Гершель</button>", // [46] = 48
                "Вояджер-2</button>", // [47] = 50
                "Венера-12</button>", // [48] = 51
                "Вікінг</button>", // [49] = 52
                "Скіапареллі</button>", //[50] = 53
                "Нові горизонти</button>", // [51] = 54
                "Дискавері</button>", // [52] = 53
                "Меркурій</button>", // [53] = 54
        };*/
        // test code 14.05.2019
        // only for first use
        Map<String, String> tails = new HashMap<String, String>();
        tails.put("1", "Колорис</button>");
        tails.put("2", "Дискавері</button>");
        tails.put("3", "Опортуніті</button>");
        tails.put("4", "280</button>");
        tails.put("5", "243</button>");
        tails.put("6", "10</button>");
        tails.put("7", "Байкал</button>");
        tails.put("8", "МонБлан</button>");
        tails.put("9", "Маріанська</button>");
        tails.put("10", "Магній</button>");
        tails.put("11", "Спирт</button>");
        tails.put("12", "Оксид заліза</button>");
        tails.put("13", "Венера</button>");
        tails.put("14", "Юнона</button>");
        tails.put("15", "Зевс</button>");
        tails.put("16", "Водневу</button>");
        tails.put("17", "Тверду</button>");
        tails.put("18", "Газоподібну</button>");
        tails.put("19", "Вісь обертання</button>");
        tails.put("20", "Кільця</button>");
        tails.put("21", "Супутники</button>");
        tails.put("22", "Математичних</button>");
        tails.put("23", "Емпіричних</button>");
        tails.put("24", "Спостережень</button>");
        tails.put("25", "Енцелад</button>");
        tails.put("26", "Харон</button>");
        tails.put("27", "Аріель</button>");
        tails.put("28", "Дискавері</button>");
        tails.put("29", "Марінер</button>");
        tails.put("30", "Олімп</button>");
        tails.put("31", "Ураганів</button>");
        tails.put("32", "Кратерів</button>");
        tails.put("33", "Вулканів</button>");
        tails.put("34", "Говерла</button>");
        tails.put("35", "МонБлан</button>");
        tails.put("36", "Еверест</button>");
        tails.put("37", "Махава</button>");
        tails.put("38", "Сахара</button>");
        tails.put("39", "Асканія Нова</button>");
        tails.put("40", "24</button>");
        tails.put("41", "10</button>");
        tails.put("42", "48</button>");
        tails.put("43", "50000</button>");
        tails.put("44", "300000</button>");
        tails.put("45", "100000</button>");
        tails.put("46", "Галілео Галілей</button>");
        tails.put("47", "Ісаак Ньютон</button>");
        tails.put("48", "Вільям Гершель</button>");
        tails.put("50", "Вояджер-2</button>");
        tails.put("51", "Венера-12</button>");
        tails.put("52", "Вікінг</button>");
        tails.put("53", "Скіапареллі</button>");
        tails.put("54", "Нові горизонти</button>");
        tails.put("49", "Меркурій</button>");
        // ... //
        // ... ///

        // test code 14.05.2019

        //get html tag from DB
        // convert from String to int
        int qid = Integer.parseInt(question_id);
        int les_num = Integer.parseInt(ln);
        int q_num = Integer.parseInt(num_id);
        String html_txt_with_tail = " ";

        // call db function
        String html_txt = getHtmlTagFromDB(qid, les_num, q_num);

        // test code 15.05.2019
        if(les_num == 0) {
            // get full html tag. db + tails
            String particular_tail = tails.get(num_id);
            html_txt_with_tail = html_txt + particular_tail; // test code 20.05.2019
        }
        // ... //

        //Get current name of button(db request)
        String cur_answer = getButtonNameDB(les_num,q_num);

        // analyze lesson number
        switch(les_num) {
            case 0: {
                // !!! analyze html code using jsoup.... !!!
                if (q_num <= 27) {
                    // general_test objects

                    try {

                        Document doc = Jsoup.connect("http://localhost/astronomy/general_test.html").get();
                        // test code 20.05.2019
                       /* Elements buttons = doc.select("button[value=" + cur_answer + "]");

                        for (Element but : buttons) {
                            html_tag = but;
                        }*/



                        //
                        // for test reason(delete before release)
                        //btnname = nbt + " " + n_btn_name ; // test code 04.03.2019

                        // Current tag in String
                        //String str_html_tag = html_txt.toString(); // test code 20.05.2019
                        //

                        //!!! chnged before release !!!
                        File file_answer = new File("E:\\al_test\\general_test.html"); //test
                        //test code 20.05.2019

                        // test code 20.05.2019
                        String search = html_txt_with_tail;  // <- changed to work with String.replaceAll()
                        //String search = html_tag;
                        //String search = html_txt;
                        //String replacement = ans_txt;
                        String replacement = html_txt + ans_txt + "</button>"; // test code 20.05.2019
                        //file reading
                        try {
                            FileReader fr = new FileReader(file_answer);
                            String s;
                            String totalStr = "";
                            try (BufferedReader br = new BufferedReader(fr)) {

                                while ((s = br.readLine()) != null) {
                                    totalStr += s;
                                }
                                totalStr = totalStr.replaceAll(search, replacement);
                                // file writing
                                FileWriter fw = new FileWriter(file_answer);
                                fw.write(totalStr);
                                fw.close();
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                } else {
                      // general_test_2 objects
                    try {

                        // chage before release
                        Document doc = Jsoup.connect("http://localhost/astronomy/general_test_2.html").get();
                        //Elements buttons = doc.select("button[value=\"Pluto\"]");

                        /*for (Element but : buttons) {
                            html_tag = but;
                        }*/
                        //
                        // for test reason(delete before release)
                        //btnname = nbt + " " + n_btn_name ; // test code 04.03.2019

                        // Current tag in String
                        //str_html_tag = html_tag.toString();
                        //String str_html_tag = html_txt.toString(); // test code 20.05.2019
                        //

                        // !!!change before release !!!
                        File lection = new File("E:\\al_test\\general_test_2.html"); // test
                        // test code 20.05.2019
                        String search = html_txt_with_tail;  // <- changed to work with String.replaceAll()
                        //String replacement = ans_txt; // test code 20.05.2019
                        String replacement = html_txt + ans_txt + "</button>"; // test code 20.05.201
                        // changing
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
                }


                //update data in DB. To be continued!!!


                result = true; //test code 15.05.2019
                break;
            }


        }

        //boolean result = false;
        return result;

        // to be continued
    }


    // ... //


    // test code 14.05.2019
    public static String getHtmlTagFromDB(int q_id, int les_num, int q_num) throws ClassNotFoundException {

        Class.forName("com.mysql.jdbc.Driver");

        String html_txt = " ";
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
        String sql = "{call getTextAnswerHtml(?,?,?,?)}"; // test code 16.05.2019

        try (Connection conn = DriverManager.getConnection(jdbcUrl, username, password);
             CallableStatement stmt = conn.prepareCall(sql)) {

            //Set IN parameter
            stmt.setInt(1, q_id);
            stmt.setInt(2, les_num);
            stmt.setInt(3, q_num);

            //Set OUT parameter
            stmt.registerOutParameter(4, Types.VARCHAR);

            //Execute stored procedure
            stmt.execute();

            //Set result variable
            html_txt = stmt.getString(4);

            // close connection
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return html_txt;
    }


    //  test code 14.05.2019
    public static String getButtonNameDB(int les_num, int n_id ) throws ClassNotFoundException {
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
    }
    // ... //
}
// ... //