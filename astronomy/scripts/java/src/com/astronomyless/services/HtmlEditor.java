package com.astronomyless.services;
/*
Author: Denys Shabelnyk
Date: 04.01.2019
Description: Class to edit html file for changing image src attrib reason.
This class will be called by JavaScript function on client side.
*/

import org.apache.commons.io.FileUtils;
import java.io.File;
import java.io.IOException;
/* test code 16.01.2019 */
import java.awt.*;
import java.applet.*;
/***********************/


public class HtmlEditor extends Applet { // test code 16.01.2019

    /*public static void  main(String args[]) throws IOException {
        changeImgAttr("images/planets/mercury.jpg","images/planets/mercuryrrr.jpg");
    }*/

    public static void changeImgAttr(String n_file_path,String cur_file_path) throws IOException { //throws IOException {

        /* new code 09.01.2019 */
        File htmlTemplateFile = new File("lections.html"); // test path
        String htmlString = FileUtils.readFileToString(htmlTemplateFile);
        String old_src_path = cur_file_path;// "images/planets/mercuryrrr.jpg";
        String new_src_path = n_file_path;
        htmlString = htmlString.replace(old_src_path, new_src_path);
        File newHtmlFile = new File("lections.html");
        FileUtils.writeStringToFile(newHtmlFile, htmlString);
    }
}