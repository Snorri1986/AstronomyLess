/*
* Author: Denys Shabelnyk
* Description: MainClass for JavaServlet
*/
package com.astronomylesson;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class AdminMain extends HttpServlet {

    private String message;

    public void init() throws ServletException {
        message = "HelloWorld";
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String u_but_descr = " ";
        String temp = " ";
        String id_name = " ";
        String les_num = " ";

        if (request.getParameter("q_upload") != null) {

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
                new_question_res_pos.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/admin.html\";</script>");
                // ... //
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
                request.getParameter("password") != null) {
            // get user's input
            String new_user_name = request.getParameter("username");
            String new_user_surname = request.getParameter("usersurname");
            String nu_email = request.getParameter("n_email");
            String nu_pass = request.getParameter("password");

            // call method
            boolean method_result = AdminUsers.addNewUser(new_user_name,
                    new_user_surname, nu_email, nu_pass);

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



        else if (request.getParameter("ta") != null &&
                request.getParameter("less_name") != null)

        {
            boolean res_mailbox;
            String txt = request.getParameter("ta");
            res_mailbox = AdminLessons.sendSurveytoMail(txt);
            String less_name = request.getParameter("less_name");
            switch (less_name) {

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
                        sysrveys.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/nl3/lections.html\";</script>");
                    }
                    break;

                case "SpaceShuttle":
                    if (res_mailbox) {
                        PrintWriter sysrveys = response.getWriter();
                        sysrveys.print("<script language='JavaScript'>alert('Survey have successfully sent');</script>");
                        sysrveys.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/nl4/lections.html\";</script>");
                    }
                    break;

                case "SkyLab":
                    if (res_mailbox) {
                        PrintWriter sysrveys = response.getWriter();
                        sysrveys.print("<script language='JavaScript'>alert('Survey have successfully sent');</script>");
                        sysrveys.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/nl5/lections.html\";</script>");
                    }
                    break;

                case "ISS":
                    if (res_mailbox) {
                        PrintWriter sysrveys = response.getWriter();
                        sysrveys.print("<script language='JavaScript'>alert('Survey have successfully sent');</script>");
                        sysrveys.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/nl6/lections.html\";</script>");
                    }

                     break;


                case "General":
                    if (res_mailbox) {
                        PrintWriter sysrveys = response.getWriter();
                        sysrveys.print("<script language='JavaScript'>alert('Survey have successfully sent');</script>");
                        sysrveys.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/main.html\";</script>");
                    }

                    break;
            }
        }

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
                    // ready to commit 12.11.2019
                    switch(btn_number) {
                        // Mercury
                        case "10": case "11": case "12": case "13": case "14": case "15": case "16": case "17":case "18":
                            txtlection.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/nl1/lections.html\";</script>");
                            break;

                         // Gemini
                        case "19": case "20": case "21": case "22": case "23": case "24": case "25": case "26":case "27":
                            txtlection.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/nl2/lections.html\";</script>");
                            break;

                        // Apollo
                        case "28": case "29": case "30": case "31": case "32": case "33": case "34": case "35":case "36":
                            txtlection.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/nl3/lections.html\";</script>");
                            break;

                        // Space Shuttle
                        case "37": case "38": case "39": case "40": case "41": case "42": case "43": case "44":case "45":
                            txtlection.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/nl4/lections.html\";</script>");
                            break;

                        // SkyLab
                        case "46": case "47": case "48": case "49":
                            txtlection.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/nl5/lections.html\";</script>");
                            break;

                        // ISS
                        case "50": case "51": case "52": case "53": case "54": case "55":
                            txtlection.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/nl6/lections.html\";</script>");
                            break;

                        //OurSolarSystem
                        case "1": case "2": case "3": case "4": case "5": case "6": case "7": case "8": case "9":
                            txtlection.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/lections.html\";</script>");
                            break;

                    }
                    // ... ///
                    txtlection.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/lections.html\";</script>");
                } else {
                    PrintWriter txtlection_err = response.getWriter();
                    txtlection_err .print("<script language='JavaScript'>alert('Error while saved txt in DB');</script>");
                    // ready to commit 12.11.2019
                    txtlection_err.print("<script language='JavaScript'>window.location = \"http://localhost/astronomy/admin.html\";</script>");
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

    }
}