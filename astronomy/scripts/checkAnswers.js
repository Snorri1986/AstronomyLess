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
			    var btn = document.getElementById("q1a1");
			    btn.onclick = null;
			}
			break;

			case 'q2a2': {
			     document.getElementById("q2a2").classList.add('disabled');
			     var btn = document.getElementById("q2a2");
			     btn.onclick = null;
		      }

			break;

			case 'q3a3': {
			     document.getElementById("q3a3").classList.add('disabled');
			     var btn = document.getElementById("q3a3");
			     btn.onclick = null;
		      }

			break;

			case 'q4a3': {
			     document.getElementById("q4a3").classList.add('disabled');
			     var btn = document.getElementById("q4a3");
			     btn.onclick = null;
		      }

			break;

			case 'q5a2': {
			     document.getElementById("q5a2").classList.add('disabled');
			     var btn = document.getElementById("q5a2");
			     btn.onclick = null;
		      }

			break;

			case 'q6a3': {
			     document.getElementById("q6a3").classList.add('disabled');
			     var btn = document.getElementById("q6a3");
			     btn.onclick = null;
		      }

			break;

			case 'q7a1': {
			     document.getElementById("q7a1").classList.add('disabled');
			     var btn = document.getElementById("q7a1");
			     btn.onclick = null;
		      }

			break;

			case 'q8a1': {
			     document.getElementById("q8a1").classList.add('disabled');
			     var btn = document.getElementById("q8a1");
			     btn.onclick = null;
		      }

			break;

			case 'q9a2': {
			     document.getElementById("q9a2").classList.add('disabled');
			     var btn = document.getElementById("q9a2");
			     btn.onclick = null;
		      }

			break;
		 }
	}
	else {
		alert("The answer is incorrect");
	}
}
