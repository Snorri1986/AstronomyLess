/*Get button name from DB*/
// Display data from MySQL Database for  planet
$(document).ready(function(){
   $.ajax({
   type:'GET',
   url: 'neptune_btn.php',
   data:'',
   success: function(data){
           $('#btn_neptune').html(data);
   }
});
});
/*****************/
