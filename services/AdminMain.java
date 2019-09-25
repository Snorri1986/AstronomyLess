/*
* Author: Denys Shabelnyk
* Description: MainClass for JavaServlet
*/
package com.astronomylesson;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class AdminMain extends HttpServlet {

    //private static final long serialVersionUID = 1L;
    private String message;

    public void init() throws ServletException {
        message = "HelloWorld";
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String u_but_descr = " ";
        String temp = " ";
        String id_name = " ";
        String les_num = " ";

        // check button "Discard all changes"
        if (request.getParameter("dc") != null) {
            ButtonsWorker.discardButtonsName();
            temp = "All changes are discarded";
            PrintWriter out_dc = response.getWriter();
            out_dc.print("<script language='JavaScript'>alert('" + temp + "');</script>");

        } else if (request.getParameter("apl") != null) {
            //Get lesson num from site
            String l_num_from_site = request.getParameter("lnbn");
            boolean action_result = AdminLessons.setNewLection(l_num_from_site);
            // tell user about result
            if (action_result == true) {
                PrintWriter out_nb_action_pos = response.getWriter();
                out_nb_action_pos.print("<script language='JavaScript'>alert('Success');</script>");
            } else {
                PrintWriter out_nb_action_neg = response.getWriter();
                out_nb_action_neg.print("<script language='JavaScript'>alert('Failed');</script>");
            }
        }
        // ...
        // Change lesson number

        else if (request.getParameter("less_btn") != null) {

            String l_num_from_site = request.getParameter("less_btn");
            boolean action_result = AdminLessons.setNewLesson(l_num_from_site);
            // tell user about result
            if (action_result == true) {
                PrintWriter out_nb_action_pos = response.getWriter();
                out_nb_action_pos.print("<script language='JavaScript'>alert('Successfully changed lesson');</script>");
                out_nb_action_pos.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/main.html\";</script>");
            } else {
                PrintWriter out_nb_action_neg = response.getWriter();
                out_nb_action_neg.print("<script language='JavaScript'>alert('Failed changed lesson');</script>");
            }
        }

        // set new question for general test
        else if (request.getParameter("q_upload") != null) {

            // data from web-page
            String ta_txt = request.getParameter("ta");
            String meta_question = request.getParameter("q_id_q");
            String less_num = request.getParameter("ln_q");


            // call Java method
            boolean action_result = AdminLessons.setNewQuestion(meta_question, ta_txt, less_num);
            // tell user about result
            if (action_result == true) {
                PrintWriter new_question_res_pos = response.getWriter();
                new_question_res_pos.print("<script language='JavaScript'>alert('Successfully changed question');</script>");
                new_question_res_pos.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/main.html\";</script>");
            } else {
                PrintWriter new_question_res_err = response.getWriter();
                new_question_res_err.print("<script language='JavaScript'>alert('Failed changed question');</script>");
            }

        }

        // Authentication.
        else if (request.getParameter("mail") != null &&
                request.getParameter("pass") != null &&
                request.getParameter("lessons") != null) {

            String usr_login = request.getParameter("mail");
            String pass_phrase = request.getParameter("pass");


            // get lesson type
            String lesson_name = request.getParameter("lessons");

            // call current procedure
            boolean auth_result = AdminUsers.authUser(usr_login, pass_phrase);

            // show result and redirect to lesson html
            if (auth_result) {

                // get data from DB
                String fl_score = AdminUsers.getFl_Scores(usr_login);

                // make html statement in one string
                String greeting_str = "<script language='JavaScript'>alert('" + fl_score + "');</script>";

                PrintWriter auth_positive = response.getWriter();

                // greeting message
                auth_positive.print(greeting_str);

                // redirect to to lesson html.
                switch (lesson_name) {
                    case "OurSolarSystem": {
                        auth_positive.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/main.html\";</script>");
                        break;
                    }

                    case "Mercury": {
                        auth_positive.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/nl1/lections.html\";</script>");
                        break;
                    }

                    case "Gemini": {
                        auth_positive.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/nl2/lections.html\";</script>");
                        break;
                    }

                    case "Apollo": {
                        auth_positive.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/nl3/lections.html\";</script>");
                        break;
                    }

                    case "SpaceShuttle": {
                        auth_positive.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/nl4/lections.html\";</script>");
                        break;
                    }

                    case "SkyLab": {
                        auth_positive.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/nl5/lections.html\";</script>");
                        break;
                    }

                    case "ISS": {
                        auth_positive.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/nl6/lections.html\";</script>");
                        break;
                    }

                }

            } else {
                PrintWriter auth_negative = response.getWriter();
                auth_negative.print("<script language='JavaScript'>alert('Access denied.You must register before entry!');</script>");
                auth_negative.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/login.html\";</script>");
            }
        }

        // Add new user.
        else if (request.getParameter("username") != null &&
                request.getParameter("usersurname") != null &&
                request.getParameter("n_email") != null &&
                request.getParameter("password") != null &&
                request.getParameter("tabel") != null) {
            // get user's input
            String new_user_name = request.getParameter("username");
            String new_user_surname = request.getParameter("usersurname");
            String nu_email = request.getParameter("n_email");
            String nu_pass = request.getParameter("password");
            String nu_tab = request.getParameter("tabel");
            String nu_type;
            if (request.getParameter("t_type") == null) {
                nu_type = "P";
            } else {
                nu_type = "T";
            }

            // call method
            boolean method_result = AdminUsers.addNewUser(new_user_name,
                    new_user_surname, nu_email, nu_pass, "NULL", nu_tab, nu_type);

            // analyze result
            if (method_result) {
                PrintWriter db_out = response.getWriter();
                db_out.print("<script language='JavaScript'>alert('New system user is successfully added');</script>");
                // redirect to main.html
                db_out.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/main.html\";</script>");
            } else {
                PrintWriter db_out_err = response.getWriter();
                db_out_err.print("<script language='JavaScript'>alert('Error.User email have already added');</script>");
                db_out_err.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/login.html\";</script>");
            }
        }

        // Save user's score into DataBase
        else if (request.getParameter("success_score") != null) {

            // get scores
            int user_scores = Integer.parseInt(request.getParameter("success_score"));

            //save in database
            try {
                AdminLessons.saveScoreinDb(user_scores);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            PrintWriter scores_out = response.getWriter();
            scores_out.print("<script language='JavaScript'>alert('Point have successfully saved');</script>");
            // redirect to main.html
            scores_out.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/main.html\";</script>");
        }


        // send survey // test code 23.09.2019
        // need to be tested after adding all lessons
        // ready to commit 23.09.2019
        else if (request.getParameter("ta") != null &&
                request.getParameter("less_name") != null)
        // ... //
        {
            boolean res_mailbox;
            String txt = request.getParameter("ta");
            res_mailbox = AdminLessons.sendSurveytoMail(txt);
            String less_name = request.getParameter("less_name");
            switch (less_name) {
                // ready to commit 23.09.2019
                case "OurSolarSystem":
                    if (res_mailbox) {
                        PrintWriter sysrveys = response.getWriter();
                        sysrveys.print("<script language='JavaScript'>alert('Survey have successfully sent');</script>");
                        sysrveys.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/lections.html\";</script>");
                    }
                    break;

                case "Mercury":
                    if (res_mailbox) {
                        PrintWriter sysrveys = response.getWriter();
                        sysrveys.print("<script language='JavaScript'>alert('Survey have successfully sent');</script>");
                        sysrveys.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/nl1/lections.html\";</script>");
                    }
                    break;
                    // ... //

                    // test code 23.09.2019

                case "Gemini":
                    if (res_mailbox) {
                        PrintWriter sysrveys = response.getWriter();
                        sysrveys.print("<script language='JavaScript'>alert('Survey have successfully sent');</script>");
                        sysrveys.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/nl2/lections.html\";</script>");
                    }
                    break;

                case "Apollo":
                    if (res_mailbox) {
                        PrintWriter sysrveys = response.getWriter();
                        sysrveys.print("<script language='JavaScript'>alert('Survey have successfully sent');</script>");
                        sysrveys.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/nl2/lections.html\";</script>");
                    }
                    break;

                case "SpaceShuttle":
                    if (res_mailbox) {
                        PrintWriter sysrveys = response.getWriter();
                        sysrveys.print("<script language='JavaScript'>alert('Survey have successfully sent');</script>");
                        sysrveys.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/nl2/lections.html\";</script>");
                    }
                    break;

                case "SkyLab":
                    if (res_mailbox) {
                        PrintWriter sysrveys = response.getWriter();
                        sysrveys.print("<script language='JavaScript'>alert('Survey have successfully sent');</script>");
                        sysrveys.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/nl2/lections.html\";</script>");
                    }
                    break;

                case "ISS":
                    if (res_mailbox) {
                        PrintWriter sysrveys = response.getWriter();
                        sysrveys.print("<script language='JavaScript'>alert('Survey have successfully sent');</script>");
                        sysrveys.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/nl2/lections.html\";</script>");
                    }
                    break;
            }
        }
            // ... //
        // ... //

        // Update text of lection
        else if(request.getParameter("l_upload") != null )  {
            String btn_number = request.getParameter("btn_l_num");
            String lection_txt = request.getParameter("ta_l");

            try {
                boolean action_result = AdminLessons.SetNewLectioninDB(btn_number, lection_txt);
                if(action_result) {
                    PrintWriter txtlection = response.getWriter();
                    txtlection.print("<script language='JavaScript'>alert('Lection text have successfully saved');</script>");
                    txtlection.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/lections.html\";</script>");
                } else {
                    PrintWriter txtlection_err = response.getWriter();
                    txtlection_err .print("<script language='JavaScript'>alert('Error while saved txt in DB');</script>");
                    txtlection_err.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/admin2.html\";</script>");
                }
            } catch(ClassNotFoundException e) {
                e.printStackTrace();
            }

        }
        // ... //

        //set new names of button in lection.
        else if(request.getParameter("btn_new_ln_upload") != null ) {
            String n_btn_name = request.getParameter("btn_num_name");
            String btn_lection_num = request.getParameter("btn_num_lection");
            String l_num = request.getParameter("ln_num_lection");

            try {
                boolean action_result = AdminLessons.SetNewButtonNameInLection(n_btn_name,btn_lection_num,l_num);
                if(action_result) {
                    PrintWriter txtlection = response.getWriter();
                    txtlection.print("<script language='JavaScript'>alert('New name of button successfully commited');</script>");
                    txtlection.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/lections.html\";</script>");
                } else {
                    PrintWriter txtlection_err = response.getWriter();
                    txtlection_err .print("<script language='JavaScript'>alert('Error while saved new name of Button in DB');</script>");
                    txtlection_err.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/admin2.html\";</script>");
                }
            } catch(ClassNotFoundException e) {
                e.printStackTrace();
            }
        }

        // ... //


        // Add new event date.
        else if(request.getParameter("ev_date") != null &&
                request.getParameter("ev_description") != null) {

            String new_ev_date = request.getParameter("ev_date");
            String new_ev_descrp = request.getParameter("ev_description");

            try {
                boolean action_result = AdminLessons.SetNewEvent(new_ev_date,new_ev_descrp);
                if(action_result) {
                    PrintWriter txtlection = response.getWriter();
                    txtlection.print("<script language='JavaScript'>alert('An new event has been successfully added');</script>");
                    txtlection.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/main.html\";</script>");
                } else {
                    PrintWriter txtlection_err = response.getWriter();
                    txtlection_err .print("<script language='JavaScript'>alert('Error while saved new event');</script>");
                    txtlection_err.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/admin2.html\";</script>");
                }
            } catch(ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
        // ... //

        else {


            // analyze which form is not null
            String[] arr_buttons_name = {"b1", "b2", "b3",
                    "b4", "b5", "b6",
                    "b7", "b8", "b9"};

            for (String i : arr_buttons_name) {
                temp = request.getParameter(i);
                if (temp != null) {
                    u_but_descr = temp;
                    id_name = i;
                    break;
                }
            }

            // call changer() method
            temp = ButtonsWorker.changer(id_name, u_but_descr);
            PrintWriter out = response.getWriter();
            out.print("<script language='JavaScript'>alert('New button mame is: " + temp + "');</script>");
            // redirect back to the source page
            out.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/admin.html\";</script>");

        }
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