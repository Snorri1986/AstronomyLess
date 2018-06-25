function savePnt() {
	var pnts = localStorage.getItem("pnts");
	document.getElementById("score").innerHTML = pnts;
    window.localStorage.removeItem("pnts");
 }