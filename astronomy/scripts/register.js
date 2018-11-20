/*
Author: Denys Shabelnyk
Date: 17.09.2018
Description: functions for register users
*/

/* Go register !!! */

/* Get user attributes and analyze it  */
function getUserAttrib() {
	var u_type, cbox;
var u_name = document.getElementById("auth_name").value;
var u_surname = document.getElementById("auth_surname").value;
var u_passphrase = document.getElementById("auth_pass").value;
// new code 19.11.2018
if(u_passphrase.length <= 5) {
  alert("The password must be more then 5 character");
  return;
}
var u_tab_num = document.getElementById("tab_num").value;
//
cbox = document.getElementById("t_cbox").checked /* is teacher ? */
if (cbox) {
	u_type = 'teacher';
  if(!u_tab_num) {
  alert("The table number for teacher should be entered");
    return;
  }
 }
else {
	u_type = 'pupil';
}
var u_attribs = [u_name,u_surname,u_passphrase,u_type];
addUser(u_attribs);
}

/* function for define a user */
function addUser(attr_array) {
    var reg_result;
    var user_type;
if(attr_array[3] == 'teacher') {
     // new code 20.11.2018
    var pv_user = localStorage.getItem("not_allow_duplicate");
      if(pv_user == attr_array[1]) {
        alert("This teacher has already added into system");
        window.localStorage.removeItem("not_allow_duplicate");
        return;
      }
     //

    alert("The new teacher was successfully uploaded");
      reg_result = 1;
      user_type = "t";
      window.localStorage.setItem("reg_flag",reg_result);
      window.localStorage.setItem("u_type",user_type);
      // new code 20.11.2018
      var prev_user = attr_array[1];
      window.localStorage.setItem("not_allow_duplicate",prev_user);
      //
    }
else if(attr_array[3] == 'pupil') {
      // new code 20.11.2018
    var pv_user = localStorage.getItem("not_allow_duplicate");
      if(pv_user == attr_array[1]) {
        alert("This pupil has already added into system");
        window.localStorage.removeItem("not_allow_duplicate");
        return;
      }
       //
    alert("The new pupil was successfully uploaded");
      reg_result = 1;
      user_type = "p";
      window.localStorage.setItem("reg_flag",reg_result);
      window.localStorage.setItem("u_type",user_type);
      // new code 20.11.2018
      var prev_user = attr_array[1];
      window.localStorage.setItem("not_allow_duplicate",prev_user);
      //
    }
  }

/*Enter to the main page after successfull auth */
function allowTrustUsers() {
    /* redirection code */
}



