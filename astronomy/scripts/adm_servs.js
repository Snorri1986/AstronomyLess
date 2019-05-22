// new code 12.12.2018
/* Admin services for upload and download site resources for new lessons
Author: Denys Shabelnyk
Date: 12.12.2018
*/


/* add update to db */
function db_uploader() {
	// get confirm from user
  var user_confirmation = prompt("Enter number of image,for carousel - add number of picture(exp.11,12)",0); // new code 12.12.2018
      // get file name. All statements return same answer. It is c:\fakepath\...
      switch (user_confirmation) {
      	case '1':
                { 
                   var file_name = document.getElementById('img1').value;  
                   break;
      	        }
      	        // for carousel images
      	case '11':  {
                      var file_name = document.getElementById('1c').value;
                      break;
      	            }
      	case '12': { 
      		          var file_name = document.getElementById('1cc').value;
                      break;
                    }
      	case '13':
      	            {
                      var file_name = document.getElementById('1ccc').value;
                      break;
      	           }
        case '2':
      	        { 
                   var file_name = document.getElementById('img2').value; 
                   break;
      	        }
      	      // for carousel images
      	case '21': {
                      var file_name = document.getElementById('2c').value;
                      break;
      	           }
      	case '22': {
      		          var file_name = document.getElementById('2cc').value;
                      break;
                    }
      	case '23': {
      		          var file_name = document.getElementById('2ccc').value;
                      break;
                    }
      	case '3':
      	        { 
                   var file_name = document.getElementById('img3').value; 
                   break;
      	        }
      	        // for carousel images
      	case '31': {
      		          var file_name = document.getElementById('3c').value;
                      break;
                    }
      	case '32': {
      		          var file_name = document.getElementById('3cc').value;
                      break;
                   }
      	case '33': {
      		          var file_name = document.getElementById('3ccc').value;
                      break;
                    }
      	case '4':
      	        { 
                   var file_name = document.getElementById('img4').value; 
                   break;
      	        }
      	        // for carousel images
      	case '41': {
      		          var file_name = document.getElementById('4c').value;
                      break;
                   }
      	case '42': {
      		          var file_name = document.getElementById('4cc').value;
                      break;
                   }
      	case '43': {
      		          var file_name = document.getElementById('4ccc').value;
                      break;
                   } 
      	case '5': 
      	        { 
                   var file_name = document.getElementById('img5').value; 
                   break;
      	        }
      	        // for carousel images
      	case '51': {
      		          var file_name = document.getElementById('5c').value;
                      break;
                    }
      	case '52': {
                      var file_name = document.getElementById('5cc').value;
                      break;
      	           }
      	case '53': {
      		          var file_name = document.getElementById('5ccc').value;
                      break;
                   } 
      	case '6':
      	        { 
                   var file_name = document.getElementById('img6').value; 
                   break;
      	        }
      	        // for carousel images
      	case '61': {
      		          var file_name = document.getElementById('6c').value;
                      break;
                   }
      	case '62': {
                      var file_name = document.getElementById('6cc').value;
                      break;
      	           }
      	case '63': {
      		          var file_name = document.getElementById('6ccc').value;
                      break;
                   }
      	case '7': 
      	        { 
                   var file_name = document.getElementById('img7').value; 
                   break;
      	        }
      	        // for carousel images
      	case '71': {
      		          var file_name = document.getElementById('7c').value;
                      break;
                    }
      	case '72': {
      		          var file_name = document.getElementById('7cc').value;
                      break;
                    }
      	case '73': {
      		          var file_name = document.getElementById('7ccc').value;
                      break;
                    }
      	case '8': 
      	        { 
                   var file_name = document.getElementById('img8').value; 
                   break;
      	        }
      	        // for carousel images
      	case '81': {
      		          var file_name = document.getElementById('8c').value;
                      break;
                    }
      	case '82': {
      		          var file_name = document.getElementById('8cc').value;
                      break;
                    }
      	case '83': {
      		          var file_name = document.getElementById('8ccc').value;
                      break;
                    }
      	case '9': 
      	        { 
                   var file_name = document.getElementById('img9').value; 
                   break;
      	        }
      	case '91': {
                      var file_name = document.getElementById('9c').value;
                      break;
      	           }
      	case '92': {
      		          var file_name = document.getElementById('9cc').value;
                      break;
                   }
      	case '93': {
      		          var file_name = document.getElementById('9ccc').value;
                      break;
                   }
        default:
      		alert('Incorrect number of image');
      		break;
      }
  };


  /* need hard test */
  /* upload image path from MySQL DB using JQuery and PHP */ /* test code 27.12.2018 */
  /* this function will be used when teacher want to change number of lesson */
  function image_uploader(obj_name,image_type,lesson_num,site_id) {
    
    $(window).ready(function(){ 
    $.ajax({
    type:"GET",  
    url: "getimage.php",
    data: {img_post_id: obj_name, file_post_type: image_type, lesson_post_number: lesson_num},
    datatype:"text", 
    success: function(data){ // data is string
       //$(site_id).attr('src', data); // test code 27.12.2018
       //$(location).attr('href', 'lections.html');
       //var db_info = data; // test code 02.01.2019
       //var s_id = site_id; // test code 02.01.2019
       //window.localStorage.setItem("db_path",db_info); // test code 02.01.2019
       //window.localStorage.setItem("sid",s_id); // test code 02.01.2019
       $(site_id).attr('src', data); // test code 17.01.2019
    }
});
    //var t = setTimeout(image_uploader, 500); /* async test 02.01.2019 */ 
});

  }
  /***********************/

/* test code 02.01.2019 */
/* async execution */
/*function setImages() {
  var user_confirmation = prompt("Repeate number of lesson:",0);
  switch (user_confirmation) {
    case 0: {
      var new_file_path =  image_uploader('img1','I','0','#img1'); /* test code 09.01.2019 */
      
      // call java method using JSP. Current path get from localStorage
      //$.get('callhtmledit.jsp'); // need debug and test
      //$.get('localhost/astronomy/scripts/callhtmledit.jsp'); // test code 15.01.2019 
      //java_call(); // test code 15.01.2019
      //$(java_call); // test code 15.01.2019
      //null;
     // break;
    //}
  //}
  /* redirect to lections.html */ /* new code 03.01.2019 */
  //window.location.replace("http://localhost/astronomy/lections.html"); 
//}
// test code 16.01.2019
function callJava() {
  document.app.changeImgAttr("images/planets/mercury.jpg","images/planets/mercuryrrr.jpg");
}



// test code 15.01.2019
/*function java_call() {
 $.get('localhost/astronomy/callhtmledit.jsp'); // new test path 16.01.2019
}*/
/********************/
 
// test code 08.01.2019 
/*function callJava(atr,path) {
  var myJavaClass = Java.type(HtmlEditor.class);
  myJavaClass.changeImgAttr(atr,path);
}*/

/* Use it for changing image between lessons */
/* new code 09.01.2019 */
function saveCurrentImagesPath() {
   
   // get src attribs
   var img1 = $('#img1').attr('src');
   var img2 = $('#img2').attr('src');
   var img3 = $('#img3').attr('src');
   var img4 = $('#img4').attr('src');
   var img5 = $('#img5').attr('src');
   var img6 = $('#img6').attr('src');
   var img7 = $('#img7').attr('src');
   var img8 = $('#img8').attr('src');
   var img9 = $('#img9').attr('src');

   //get src attrib for carousel images
   var img1c1 = $('#img1c1').attr('src');
   var img1c2 = $('#img1c2').attr('src');
   var img1c3 = $('#img1c3').attr('src');
   var img2c1 = $('#img2c1').attr('src');
   var img2c2 = $('#img2c2').attr('src');
   var img2c3 = $('#img2c3').attr('src');
   var img3c1 = $('#img3c1').attr('src');
   var img3c2 = $('#img3c2').attr('src');
   var img3c3 = $('#img3c3').attr('src');
   var img4c1 = $('#img4c1').attr('src');
   var img4c2 = $('#img4c2').attr('src');
   var img4c3 = $('#img4c3').attr('src');
   var img5c1 = $('#img5c1').attr('src');
   var img5c2 = $('#img5c2').attr('src');
   var img5c3 = $('#img5c3').attr('src');
   var img6c1 = $('#img6c1').attr('src');
   var img6c2 = $('#img6c2').attr('src');
   var img6c3 = $('#img6c3').attr('src');
   var img7c1 = $('#img7c1').attr('src');
   var img7c2 = $('#img7c2').attr('src');
   var img7c3 = $('#img7c3').attr('src');
   var img8c1 = $('#img8c1').attr('src');
   var img8c2 = $('#img8c2').attr('src');
   var img8c3 = $('#img8c3').attr('src');
   var img9c1 = $('#img9c1').attr('src');
   var img9c2 = $('#img9c2').attr('src');
   var img9c3 = $('#img9c3').attr('src');

   // save data in localstorage
   window.localStorage.setItem("img_1",img1);
   window.localStorage.setItem("img_2",img2);
   window.localStorage.setItem("img_3",img3);
   window.localStorage.setItem("img_4",img4);
   window.localStorage.setItem("img_5",img5);
   window.localStorage.setItem("img_6",img6);
   window.localStorage.setItem("img_7",img7);
   window.localStorage.setItem("img_8",img8);
   window.localStorage.setItem("img_9",img9);

   // save data in localstorage.Carousel images
   window.localStorage.setItem("img_1c1",img1c1);
   window.localStorage.setItem("img_1c2",img1c2);
   window.localStorage.setItem("img_1c3",img1c3);
   window.localStorage.setItem("img_2c1",img2c1);
   window.localStorage.setItem("img_2c2",img2c2);
   window.localStorage.setItem("img_2c3",img2c3);
   window.localStorage.setItem("img_3c1",img3c1);
   window.localStorage.setItem("img_3c2",img3c2);
   window.localStorage.setItem("img_3c3",img3c3);
   window.localStorage.setItem("img_4c1",img4c1);
   window.localStorage.setItem("img_4c2",img4c2);
   window.localStorage.setItem("img_4c3",img4c3);
   window.localStorage.setItem("img_5c1",img5c1);
   window.localStorage.setItem("img_5c2",img5c2);
   window.localStorage.setItem("img_5c3",img5c3);
   window.localStorage.setItem("img_6c1",img6c1);
   window.localStorage.setItem("img_6c2",img6c2);
   window.localStorage.setItem("img_6c3",img6c3);
   window.localStorage.setItem("img_7c1",img7c1);
   window.localStorage.setItem("img_7c2",img7c2);
   window.localStorage.setItem("img_7c3",img7c3);
   window.localStorage.setItem("img_8c1",img8c1);
   window.localStorage.setItem("img_8c2",img8c2);
   window.localStorage.setItem("img_8c3",img8c3);
   window.localStorage.setItem("img_9c1",img9c1);
   window.localStorage.setItem("img_9c2",img9c2);
   window.localStorage.setItem("img_9c3",img9c3);
}


  // function db_upload_fromdb
  // function db_downloader
  // function db_downloader_fromdb

  // functions for upload new name of buttons
