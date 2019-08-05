function enbButts(pwd) {
	var corPwd = 123;
	if (pwd == corPwd)
	{
	    var flag = 'yes';
	    window.localStorage.setItem("mark",flag);
      }
	else
   {
       	alert("You don't have permissions to change lesson");
    }
}
