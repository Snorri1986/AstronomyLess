/*
* Author: Denys Shabelnyk
* Description: class for working with all images in the site
* 1) Upload new images for lesson
* 2) Upload new carousal images for lesson
* 3) Set new images for lesson(will be available soon)
 */
package com.astronomylesson;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.CallableStatement;
import java.sql.DriverManager;
import java.sql.Types;

public class ImageUploader {


    public static String getFilePathfromDB(String lesson_number, String image_num, String file_type) throws ClassNotFoundException {

        Class.forName("com.mysql.jdbc.Driver");

        String path_result = " ";
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
        String sql = "{call getImagePath(?,?,?,?)}";


        try (Connection conn = DriverManager.getConnection(jdbcUrl, username, password);
             CallableStatement stmt = conn.prepareCall(sql)) {

            //Set IN parameter
            stmt.setString(1, image_num);
            stmt.setString(2, file_type);
            stmt.setString(3, lesson_number);

            //Set OUT parameter
            stmt.registerOutParameter(4, Types.VARCHAR);

            //Execute stored procedure
            stmt.execute();

            //Set result variable
            path_result = stmt.getString(4);

            // close connection
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return path_result;
    }


    // Transfer file to particular location
    public static String fileMover(String path_from_db, String ln) {

         //result variable
        String res = " ";

        //File extension
        String fe = ".jpg";

        //File collector
        String AstroFilesFolder = "C:/AstroImageLessons/";

        // Full file name
        String source_ffn = AstroFilesFolder + ln + fe;

        // New lesson images storage
        String NewLessonsImagesStorage = "C:/xampp/htdocs/astronomy/";

        // Full file name
        String distination_ffn = NewLessonsImagesStorage + path_from_db;

        // move file
        try{

            File afile =new File(source_ffn);

            if(afile.renameTo(new File(distination_ffn + afile.getName()))){
                res = "File is moved successful!";
            }else{
                res = "File is failed to move!";
            }

        }catch(Exception e){
            e.printStackTrace();
        }
        //

        return res;
    }


    // Transfer file to particular location for carousal images
    public static String fileMoverCarousal(String path_from_db, String ln,String carousal_fname) {
        //result variable
        String res = " ";

        //File extension
        String fe = ".jpg";

        //File collector
        String AstroFilesFolder = "C:/AstroImageLessons/";

        // Full file name
        String source_ffn = AstroFilesFolder + carousal_fname + fe;

        // New lesson images storage
        String NewLessonsImagesStorage = "C:/xampp/htdocs/astronomy/";

        // Full file name
        String distination_ffn = NewLessonsImagesStorage + path_from_db;

        try{

            File afile =new File(source_ffn);

            if(afile.renameTo(new File(distination_ffn + afile.getName()))){
                res = "File is moved successful!";
            }else{
                res = "File is failed to move!";
            }

        }catch(Exception e){
            e.printStackTrace();
        }
        //

        return res;
    }
}