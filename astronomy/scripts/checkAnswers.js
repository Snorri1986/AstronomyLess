/*Function for checking answers in general test
Version: 1.2
*/
function chkAnswers(answer,points,id) {
	var crnPnt = document.getElementById("score").innerHTML;
	var newPnt = Number(crnPnt) + Number(points);
	var corAnswersArr = ["Coloris","243","Marian","Iron oxid",
	                     "Juno","Gaseous","Axis of rotation",
	                     "Math","Charon","Hurricanes","Everest",
	                     "Discovery","Mohava",10,300000,"William Gershel",
	                     "Voyager-2","New Horizons"];
	if (corAnswersArr.includes(answer)) {
		alert("The answer is corrent.Yoy have got 10 points.");
		document.getElementById("score").innerHTML = newPnt;
		window.localStorage.setItem("pnts",newPnt);
		window.localStorage.setItem("send_pnts",newPnt);

		switch(id) {

       case 'q1a1': {
			    document.getElementById("q1a1").classList.add('disabled');
					document.getElementById("q1a2").classList.add('disabled');
					document.getElementById("q1a3").classList.add('disabled');

          var btn = document.getElementById("q1a1");
					var btn2 = document.getElementById("q1a2");
					var btn3 = document.getElementById("q1a3");

				  btn.onclick = null;
					btn2.onclick = null;
					btn3.onvlick = null;

			}
			break;

			  case 'q2a2': {
			     document.getElementById("q2a2").classList.add('disabled');
					 document.getElementById("q2a1").classList.add('disabled');
 					 document.getElementById("q2a3").classList.add('disabled');

 					 var btn = document.getElementById("q2a2");
					 var btn2 = document.getElementById("q2a1");
 					 var btn3 = document.getElementById("q2a3");

 					 btn.onclick = null;
					 btn2.onclick = null;
 					 btn3.onvlick = null;

		      }

			   break;

			   case 'q3a3': {
			     document.getElementById("q3a3").classList.add('disabled');
					 document.getElementById("q3a2").classList.add('disabled');
					 document.getElementById("q3a1").classList.add('disabled');

			     var btn = document.getElementById("q3a3");
					 var btn2 = document.getElementById("q3a2");
					 var btn3 = document.getElementById("q3a1");

			     btn.onclick = null;
					 btn2.onclick = null;
					 btn3.onclick = null;

		      }

			break;

			case 'q4a3': {
			     document.getElementById("q4a3").classList.add('disabled');
					 document.getElementById("q4a2").classList.add('disabled');
					 document.getElementById("q4a1").classList.add('disabled');

					 var btn = document.getElementById("q4a3");
					 var btn2 = document.getElementById("q4a2");
					 var btn3 = document.getElementById("q4a1");

					 btn.onclick = null;
					 btn2.onclick = null;
					 btn3.onclick = null;

		      }

			break;

			case 'q5a2': {
			     document.getElementById("q5a2").classList.add('disabled');
					 document.getElementById("q5a1").classList.add('disabled');
					 document.getElementById("q5a3").classList.add('disabled');

					 var btn = document.getElementById("q5a2");
					 var btn2 = document.getElementById("q5a1");
					 var btn3 = document.getElementById("q5a3");

			     btn.onclick = null;
					 btn2.onclick = null;
					 btn3.onclick = null;

		      }

			break;

			case 'q6a3': {
			     document.getElementById("q6a3").classList.add('disabled');
					 document.getElementById("q6a1").classList.add('disabled');
					 document.getElementById("q6a2").classList.add('disabled');

			     var btn = document.getElementById("q6a3");
					 var btn2 = document.getElementById("q6a1");
					 var btn3 = document.getElementById("q6a2");

           btn.onclick = null;
					 btn2.onclick = null;
					 btn3.onclick = null;

		      }

			break;

			case 'q7a1': {
			     document.getElementById("q7a1").classList.add('disabled');
					 document.getElementById("q7a2").classList.add('disabled');
					 document.getElementById("q7a3").classList.add('disabled');

			     var btn = document.getElementById("q7a1");
					 var btn2 = document.getElementById("q7a2");
					 var btn3 = document.getElementById("q7a3");

					 btn2.onclick = null;
					 btn3.onclick = null;
					 btn.onclick = null;
		      }

			break;

			case 'q8a1': {
			     document.getElementById("q8a1").classList.add('disabled');
					 document.getElementById("q8a2").classList.add('disabled');
					 document.getElementById("q8a3").classList.add('disabled');

			     var btn = document.getElementById("q8a1");
					 var btn2 = document.getElementById("q8a2");
					 var btn3 = document.getElementById("q8a3");

			     btn.onclick = null;
					 btn2.onclick = null;
					 btn3.onclick = null;

		      }

			break;

			case 'q9a2': {
			     document.getElementById("q9a2").classList.add('disabled');
					 document.getElementById("q9a1").classList.add('disabled');
					 document.getElementById("q9a3").classList.add('disabled');

			     var btn = document.getElementById("q9a2");
					 var btn2 = document.getElementById("q9a1");
					 var btn3 = document.getElementById("q9a3");

			     btn.onclick = null;
					 btn2.onclick = null;
					 btn3.onclick = null;

		      }

			break;
		 }
	}
	else {
		alert("The answer is incorrect");
	}
}
