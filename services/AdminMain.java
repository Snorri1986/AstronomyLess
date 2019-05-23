/*
* Author: Denys Shabelnyk
* Description: MainClass for JavaServlet
*/
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
       /*
        response.setContentType("text/html");

        // Actual logic
        PrintWriter out = response.getWriter();
        out.println("<h1>" + message + "</h1>");*/

        // ready to commit 28.02.2019
        String u_but_descr = " ";
        String temp = " ";
        //
        String id_name = " "; // ready to commit 04.03.2019
        String les_num = " "; // test code 28.03.2019

        // check button "Discard all changes"
        // ready to commit 21.03.2019
        if(request.getParameter("dc") != null) {
            // ready to commit 02.04.2019
            ButtonsWorker.discardButtonsName();
            temp = "All changes are discarded";
            PrintWriter out_dc = response.getWriter();
            out_dc.print("<script language='JavaScript'>alert('" + temp + "');</script>");
            // ...
        }
          // ready to commit 02.04.2019
        else if(request.getParameter("apl") != null) {
            //Get lesson num from site
            String l_num_from_site = request.getParameter("lnbn");
            boolean action_result = AdminLessons.setNewLection(l_num_from_site);
            // tell user about result
            if(action_result == true) {
                PrintWriter out_nb_action_pos = response.getWriter();
                out_nb_action_pos.print("<script language='JavaScript'>alert('Success');</script>");
            } else {
                PrintWriter out_nb_action_neg = response.getWriter();
                out_nb_action_neg.print("<script language='JavaScript'>alert('Failed');</script>");
            }
        }
        // ...
        // Change lesson number
        // ready to commit 17.04.2019
       else if(request.getParameter("less_btn") != null )   {

            String l_num_from_site = request.getParameter("less_btn");
            boolean action_result = AdminLessons.setNewLesson(l_num_from_site);
            // tell user about result
            if(action_result == true) {
                PrintWriter out_nb_action_pos = response.getWriter();
                out_nb_action_pos.print("<script language='JavaScript'>alert('Successfully changed lesson');</script>");
                out_nb_action_pos.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/main.html\";</script>");
            } else {
                PrintWriter out_nb_action_neg = response.getWriter();
                out_nb_action_neg.print("<script language='JavaScript'>alert('Failed changed lesson');</script>");
            }
        }

        // Change answers for general test
        // test code 14.05.2019
        else if(request.getParameter("q_id") != null &&
                request.getParameter("n_id") != null &&
                request.getParameter("ans") != null &&
                request.getParameter("lesn") != null) {
            String question_id = request.getParameter("q_id");
            String num_id = request.getParameter("n_id");
            String ans_txt = request.getParameter("ans");
            String ln = request.getParameter("lesn");
            String is_cor = request.getParameter("option");
            // not released
            // test code 16.05.2019
            try {
                boolean action_result = ButtonsWorker.setNewAnswerButtonGenTest(question_id, num_id, ans_txt, ln, is_cor);
                if (action_result == true) {
                    PrintWriter out_nb_action_pos = response.getWriter();
                    out_nb_action_pos.print("<script language='JavaScript'>alert('Successfully changed answer');</script>");
                    out_nb_action_pos.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/admin2.html\";</script>");
                } else {
                    PrintWriter out_nb_action_neg = response.getWriter();
                    out_nb_action_neg.print("<script language='JavaScript'>alert('Failed changed answer');</script>");
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            // ... //
        }
        // ... //
        // ... ///

        // analyze which form is not null ready to commit 29.09.2019
        String[] arr_buttons_name = {"b1", "b2", "b3",
                "b4", "b5", "b6",
                "b7", "b8", "b9"};

        for (String i : arr_buttons_name) {
            temp = request.getParameter(i);
            if (temp != null) {
                u_but_descr = temp;
                id_name = i; // ready to commit 04.03.2019
                break;  // ready to commit 04.03.2019
            }
        }

        // call changer() method
        temp = ButtonsWorker.changer(id_name,u_but_descr); // ready to commit 04.03.2019

        // show result  test code 28.02.2019
        PrintWriter out = response.getWriter();
        //out.print("<script language='JavaScript'>alert('" + u_but_descr + "');</script>"); // add test to show
        //out.print("<script language='JavaScript'>alert('" + id_name + "');</script>"); // add test to show

        // ready to commit 11.03.2019
        out.print("<script language='JavaScript'>alert('New button mame is: " + temp + "');</script>");

        // redirect back to the source page ready to commit 28.09.2019
        out.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/admin.html\";</script>");

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