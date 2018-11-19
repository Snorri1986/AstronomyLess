/*
Author: Denys Shabelnyk
Date: 12.09.2018
Description: Cookies for site form
*/

/* Teacher's cookie */
function setCookies() {
    var t_fio = document.getElementById('fio').value;
    var t_email = document.getElementById('email').value;
    localStorage.setItem("fio",t_fio); 
    localStorage.setItem("email",t_email);
}


/* Fieled teacher's form fields */
function getCookie() {
    
    var fio_form = localStorage.getItem("fio");
    var email_form = localStorage.getItem("email");
    document.getElementById("fio").value = fio_form;
    document.getElementById("email").value = email_form;
}

/* Delete all teacher's cookies */
function delCookies() {
    window.localStorage.removeItem("fio"); 
    window.localStorage.removeItem("email"); 
}

/**********************/



