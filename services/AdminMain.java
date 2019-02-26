package com.astronomylesson;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class AdminMain extends HttpServlet  {

    //private static final long serialVersionUID = 1L;
    private String message;

    public void init() throws ServletException {
		message = "HelloWorld";
	}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.setContentType("text/html");

        // Actual logic
        PrintWriter out = response.getWriter();
        out.println("<h1>" + message + "</h1>");
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {

        String file_to_move = " ";
        String lesson_num = request.getParameter("ln");
        String img_id = " ";
        String temp;
        String test_db_path = " ";
        String file_type = " ";
        String move_res = " ";
        String carousal1 = " ";
        String carousal2 = " ";
        String carousal3 = " ";
        String c1 = " ";
        String c2 = " ";
        String c3 = " ";
        // db path for carousal images
        String db_c1 = " ";
        String db_c2 = " ";
        String db_c3 = " ";

        // carousal file name
        String fn1 = " ";
        String fn2 = " ";
        String fn3 = " ";

        // carousal or single image ?
        carousal1 = request.getParameter("img11");
        carousal2 = request.getParameter("img12");
        carousal3 = request.getParameter("img13");


        if(carousal1 != null || carousal2 != null || carousal3 != null) {
            file_type = "C";
            switch(lesson_num ) {
                case "1" :
                {
                    c1 = "img11";
                    c2 = "img12";
                    c3 = "img13";
                    fn1 = "c11";
                    fn2 = "c12";
                    fn3 = "c13";
                    break;
                }
                case "2":
                {
                    c1 = "img21";
                    c2 = "img22";
                    c3 = "img23";
                    fn1 = "c21";
                    fn2 = "c22";
                    fn3 = "c23";
                    break;
                }
                case "3":
                {
                    c1 = "img31";
                    c2 = "img32";
                    c3 = "img33";
                    fn1 = "c31";
                    fn2 = "c32";
                    fn3 = "c33";
                    break;
                }
                case "4":
                {
                    c1 = "img41";
                    c2 = "img42";
                    c3 = "img43";
                    fn1 = "c41";
                    fn2 = "c42";
                    fn3 = "c43";
                    break;
                }
                case "5":
                {
                    c1 = "img51";
                    c2 = "img52";
                    c3 = "img53";
                    fn1 = "c51";
                    fn2 = "c52";
                    fn3 = "c53";
                    break;
                }
                case "6":
                {
                    c1 = "img61";
                    c2 = "img62";
                    c3 = "img63";
                    fn1 = "c61";
                    fn2 = "c62";
                    fn3 = "c63";
                    break;
                }
                case "7":
                {
                    c1 = "img71";
                    c2 = "img72";
                    c3 = "img73";
                    fn1 = "c71";
                    fn2 = "c72";
                    fn3 = "c73";
                    break;
                }
                case "8":
                {
                    c1 = "img81";
                    c2 = "img82";
                    c3 = "img83";
                    fn1 = "c81";
                    fn2 = "c82";
                    fn3 = "c83";
                    break;
                }
                case "9":
                {
                    c1 = "img91";
                    c2 = "img92";
                    c3 = "img93";
                    fn1 = "c91";
                    fn2 = "c92";
                    fn3 = "c93";
                    break;
                }
            }


            PrintWriter carousal_out = response.getWriter();

            // Get file path to file moving
            try {
                db_c1 = ImageUploader.getFilePathfromDB(lesson_num, c1, file_type);
                db_c2 = ImageUploader.getFilePathfromDB(lesson_num, c2, file_type);
                db_c3 = ImageUploader.getFilePathfromDB(lesson_num, c3, file_type);

            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            // move carousal images
            move_res = ImageUploader.fileMoverCarousal(db_c1,lesson_num,fn1);
            move_res = ImageUploader.fileMoverCarousal(db_c2,lesson_num,fn2);
            move_res = ImageUploader.fileMoverCarousal(db_c3,lesson_num,fn3);

            PrintWriter new_out = response.getWriter();
            new_out.print("<script language='JavaScript'>alert('" + move_res + "');</script>");

            carousal_out.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/admin.html\";</script>");

        } else {

            // Image arrays
            String[] images_in_site = {"img1", "img2", "img3",
                    "img4", "img5", "img6",
                    "img7", "img8", "img9"};

            for (String i : images_in_site) {
                temp = request.getParameter(i);
                if (temp != null) {
                    file_to_move = temp;
                    img_id = i;
                }

            }

            file_type = img_id.substring(0, 1).toUpperCase();

            // Get file path to file moving
            try {
                test_db_path = ImageUploader.getFilePathfromDB(lesson_num, img_id, file_type);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            // Copy file to particular location
            // Call method file transfer
            move_res = ImageUploader.fileMover(test_db_path,lesson_num);


            PrintWriter new_out = response.getWriter();
            new_out.print("<script language='JavaScript'>alert('" + move_res + "');</script>");


            PrintWriter out = response.getWriter();
            out.print("<script language='JavaScript'>alert('New image was successfully uploaded');</script>");

            // redirect back to the source page
            out.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/admin.html\";</script>");
        }
    }
}