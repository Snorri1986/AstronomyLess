/*Get button name from DB*/
// Display data from MySQL Database for  planet
$(document).ready(function(){
   $.ajax({
   type:'GET',
   url: 'pluto_btn.php',
   data:'',
   success: function(data){
           $('#btn_pluto').html(data);
   }
});
});
