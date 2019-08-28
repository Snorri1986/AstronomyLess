/*Get button name from DB*/
/* ready to commit 22.08.2019*/
// Display data from MySQL Database for  planet
$(document).ready(function(){
   $.ajax({
   type:'GET',
   url: 'jupiter_btn.php',
   data:'',
   success: function(data){
           $('#btn_jupiter').html(data);
   }
});
});
/*****************/
