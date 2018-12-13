// new code 12.12.2018
/* Admin services for upload and download site resources for new lessons
Author: Denys Shabelnyk
Date: 12.12.2018
*/
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

  // function db_upload_fromdb
  // function db_downloader
  // function db_downloader_fromdb

  // functions for upload new name of buttons
