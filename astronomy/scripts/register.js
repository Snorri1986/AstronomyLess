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

    // new code 22.11.2018
    // instead of action in <form>
    // add new user using php script
     var form = document.getElementById('use_php');
         form.action = "addnewuser.php";
         form.submit();
    //
  }


// new 21.11.2018 test code
function allowTrustUsers() {
    // store name and surname of user into localStorage
    // call jquery function
    // call stored procedure in MySQL

    // new code 27.11.2018
    var u_name = document.getElementById("auth_name").value;
    var u_surname = document.getElementById("auth_surname").value;
    var u_passphrase = document.getElementById("auth_pass").value;
    var e_mail = document.getElementById("email").value;
    //

  $(window).ready(function(){ // new code 26.11.2018 old: ready
    $.ajax({
    type:"GET",  // new 28.11.2018
    url: "welcomeuser.php",
    // new code 29.11.2018
    data: {
      username: u_name,  
      usersurname: u_surname, 
      n_email: e_mail, 
      password: u_passphrase 
    },
    datatype:"text", 
    success: function(data){ // data is string
    $("button.btn-success").replaceWith($("#welcome").html(data)); // new code 04.12.2018
      localStorage.setItem("trus_user",data); // new code 04.12.2018
    }
}); 
});

  // Authorized trusted user and give it site permissions
  // new code 05.12.2018
  var from_db = localStorage.getItem("trus_user"); 
  var user_type = from_db.substring(0,1); // analyze only first symbol

  switch(user_type) {
    case 'P': {
            null; // nothing to do (default role)
            break;
    }

     // only teacher can create a new lesson (admin = teacher)
    case 'T': {
       document.getElementById("creator").classList.remove('disabled'); 
       $('#creator').on('click',function() {
           window.location = "admin.html";
       });
       break;
    }
  }
  //
}






