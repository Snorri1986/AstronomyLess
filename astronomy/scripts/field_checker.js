/*
Function for check state of input field in admin.html file
Author: Denys Shabelnyk
Date: 14.03.2019
*/

/*  ready to commit 19.03.2019 */
function isNullOnField() {
	// #1
	document.getElementById('name_image_descr_1').addEventListener("keyup", function() {
    var nameInput = document.getElementById('name_image_descr_1').value;
    if (nameInput != "") {
        document.getElementById('btn_name_image_descr_1').removeAttribute("disabled");
    } else {
        document.getElementById('btn_name_image_descr_1').setAttribute("disabled", null);
    }
});

	// #2
	document.getElementById('name_image_descr_2').addEventListener("keyup", function() {
    var nameInput = document.getElementById('name_image_descr_2').value;
    if (nameInput != "") {
        document.getElementById('btn_name_image_descr_2').removeAttribute("disabled");
    } else {
        document.getElementById('btn_name_image_descr_2').setAttribute("disabled", null);
    }
});

	// #3
	document.getElementById('name_image_descr_3').addEventListener("keyup", function() {
    var nameInput = document.getElementById('name_image_descr_3').value;
    if (nameInput != "") {
        document.getElementById('btn_name_image_descr_3').removeAttribute("disabled");
    } else {
        document.getElementById('btn_name_image_descr_3').setAttribute("disabled", null);
    }
});

	// #4
	document.getElementById('name_image_descr_4').addEventListener("keyup", function() {
    var nameInput = document.getElementById('name_image_descr_4').value;
    if (nameInput != "") {
        document.getElementById('btn_name_image_descr_4').removeAttribute("disabled");
    } else {
        document.getElementById('btn_name_image_descr_4').setAttribute("disabled", null);
    }
});

	// #5
	document.getElementById('name_image_descr_5').addEventListener("keyup", function() {
    var nameInput = document.getElementById('name_image_descr_5').value;
    if (nameInput != "") {
        document.getElementById('btn_name_image_descr_5').removeAttribute("disabled");
    } else {
        document.getElementById('btn_name_image_descr_5').setAttribute("disabled", null);
    }
});

	// #6
	document.getElementById('name_image_descr_6').addEventListener("keyup", function() {
    var nameInput = document.getElementById('name_image_descr_6').value;
    if (nameInput != "") {
        document.getElementById('btn_name_image_descr_6').removeAttribute("disabled");
    } else {
        document.getElementById('btn_name_image_descr_6').setAttribute("disabled", null);
    }
});

	// #7
	document.getElementById('name_image_descr_7').addEventListener("keyup", function() {
    var nameInput = document.getElementById('name_image_descr_7').value;
    if (nameInput != "") {
        document.getElementById('btn_name_image_descr_7').removeAttribute("disabled");
    } else {
        document.getElementById('btn_name_image_descr_7').setAttribute("disabled", null);
    }
});

    // #8
	document.getElementById('name_image_descr_8').addEventListener("keyup", function() {
    var nameInput = document.getElementById('name_image_descr_8').value;
    if (nameInput != "") {
        document.getElementById('btn_name_image_descr_8').removeAttribute("disabled");
    } else {
        document.getElementById('btn_name_image_descr_8').setAttribute("disabled", null);
    }
});

	// #9
	document.getElementById('name_image_descr_9').addEventListener("keyup", function() {
    var nameInput = document.getElementById('name_image_descr_9').value;
    if (nameInput != "") {
        document.getElementById('btn_name_image_descr_9').removeAttribute("disabled");
    } else {
        document.getElementById('btn_name_image_descr_9').setAttribute("disabled", null);
    }
});
    // Apply changes button  // ready to commit 02.04.2019
    document.getElementById('lnf').addEventListener("keyup", function() {
    var nameInput = document.getElementById('lnf').value;
    if (nameInput != "") {
        document.getElementById('apply_btn').removeAttribute("disabled");
    } else {
        document.getElementById('apply_btn').setAttribute("disabled", null);
    }
}); 
     // ... ///
}

  /* ... */ 