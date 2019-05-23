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

public class AdminLessons {
    // ready to commit  02.04.2019
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
    // ready to commit 17.04.2019 after 1 - 9
    public static boolean setNewLesson(String lesson_id) throws IOException {

        int l_id = Integer.parseInt(lesson_id);
        boolean result = false;
        switch(l_id) {
            // ready to commit 22.04.2019
            case  1 :
            {
                File dest_file = new File("C:\\xampp\\htdocs\\astronomy\\main.html"); // constant ready to commit 26.03.2019
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
            // ready to commit 22.04.2019
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
            // ... //
                // ready to  commit 22.04.2019
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
            // ... //

            // ready to  commit 22.04.2019
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
                // ... //
            // ready to  commit 22.04.2019
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
                // ... //

                // ready to commit 22.04.2019
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
            // ... //
                // ready to commit 22.04.2019
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

            // ready to commit 22.04.2019
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
                // ... //
                // ready to commit 22.04.2019
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
                // ... //
                // ready to commit 22.04.2019
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
            // ... //
        }
        return result;
    }
    // ... //
}