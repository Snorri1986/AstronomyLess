function enbButts(pwd) {
	var corPwd = 123;
	if (pwd == corPwd) 
	{
	    var flag = 'yes';
	    window.localStorage.setItem("mark",flag);
      }
	else 
   {
       	alert("Вам не дозволено змінювати зміст уроків");
    }
}