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
cbox = document.getElementById("t_cbox").checked /* is teacher ? */
if (cbox) {
	u_type = 'teacher';
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
    alert("The new teacher was successfully uploaded");
      reg_result = 1;
      user_type = "t";
      window.localStorage.setItem("reg_flag",reg_result);
      window.localStorage.setItem("u_type",user_type);
    }
else if(attr_array[3] == 'pupil') {
    alert("The new pupil was successfully uploaded");
      reg_result = 1;
      user_type = "p";
      window.localStorage.setItem("reg_flag",reg_result);
      window.localStorage.setItem("u_type",user_type);
    }
  }

/*Enter to the main page after successfull auth */
function allowTrustUsers() {
    /* redirection code */
}



