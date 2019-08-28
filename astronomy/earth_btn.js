/*Get button name from DB*/
// Display data from MySQL Database for  planet
$(document).ready(function(){
   $.ajax({
   type:'GET',
   url: 'earth_btn.php',
   data:'',
   success: function(data){
           $('#btn_earth').html(data);
   }
});
});
/*****************/
