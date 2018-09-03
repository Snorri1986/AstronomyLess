function fillPnt() {
	var pnt = localStorage.getItem("send_pnts"); 
    document.getElementById("points").value= Number(pnt);
    window.localStorage.removeItem("send_pnts"); 
}