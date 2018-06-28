function chkAnswers(answer,points,id) {  
	var crnPnt = document.getElementById("score").innerHTML;
	var newPnt = Number(crnPnt) + Number(points);
	var corAnswersArr = ["Колорис","243","Маріанська","Оксид заліза",
	                     "Юнона","Газоподібну","Вісь обертнання",
	                     "Математичних","Харон","Ураганів","Еверест",
	                     "Дискавері","Махава",10,300000,"Вільям Гершель",
	                     "Вояджер-2","Нові горизонти"];
	if (corAnswersArr.includes(answer)) { 
		alert("Відповідь вірна.Вам нараховано 10 балів.");
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
		alert("Відповідь помилкова");  
	}
}