function buttsOn() {
	var sign = localStorage.getItem("mark");
	if (sign == 'yes') {
        // buttons for modify lections
		document.getElementById("modify_mercury").classList.remove('disabled');
        document.getElementById("modify_venus").classList.remove('disabled');
	    document.getElementById("modify_earth").classList.remove('disabled');
	    document.getElementById("modify_mars").classList.remove('disabled');
	    document.getElementById("modify_jupiter").classList.remove('disabled');
	    document.getElementById("modify_saturn").classList.remove('disabled');
	    document.getElementById("modify_uranus").classList.remove('disabled');
	    document.getElementById("modify_neptune").classList.remove('disabled');
	    document.getElementById("modify_pluto").classList.remove('disabled');
	    //clean storage
	    window.localStorage.removeItem("mark");
	}
}