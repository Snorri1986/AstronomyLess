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
    var pv_user = localStorage.getItem("not_allow_duplicate");
      if(pv_user == attr_array[1]) {
        alert("This teacher has already added into system");
        window.localStorage.removeItem("not_allow_duplicate");
        return;
      }
     

    alert("The new teacher was successfully uploaded");
      reg_result = 1;
      user_type = "t";
      window.localStorage.setItem("reg_flag",reg_result);
      window.localStorage.setItem("u_type",user_type);
      var prev_user = attr_array[1];
      window.localStorage.setItem("not_allow_duplicate",prev_user);
      
    }
else if(attr_array[3] == 'pupil') {
      var pv_user = localStorage.getItem("not_allow_duplicate");
      if(pv_user == attr_array[1]) {
        alert("This pupil has already added into system");
        window.localStorage.removeItem("not_allow_duplicate");
        return;
      }
       
    alert("The new pupil was successfully uploaded");
      reg_result = 1;
      user_type = "p";
      window.localStorage.setItem("reg_flag",reg_result);
      window.localStorage.setItem("u_type",user_type);
      var prev_user = attr_array[1];
      window.localStorage.setItem("not_allow_duplicate",prev_user);
      
    }

    // instead of action in <form>
    // add new user using php script
     var form = document.getElementById('use_php');
         form.action = "addnewuser.php";
         form.submit();
    }



function allowTrustUsers() {
    // store name and surname of user into localStorage
    // call jquery function
    // call stored procedure in MySQL

    var u_name = document.getElementById("auth_name").value;
    var u_surname = document.getElementById("auth_surname").value;
    var u_passphrase = document.getElementById("auth_pass").value;
    var e_mail = document.getElementById("email").value;
    

  $(window).ready(function(){ 
    $.ajax({
    type:"GET",  
    url: "welcomeuser.php",
    data: {
      username: u_name,  
      usersurname: u_surname, 
      n_email: e_mail, 
      password: u_passphrase 
    },
    datatype:"text", 
    success: function(data){ // data is string
    $("button.btn-success").replaceWith($("#welcome").html(data)); 
      localStorage.setItem("trus_user",data); 
    }
}); 
});

  // Authorized trusted user and give it site permissions
  
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
}






