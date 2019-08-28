/*Get button name from DB*/
// Display data from MySQL Database for Mercury planet
$(document).ready(function(){
   $.ajax({
   type:'GET',
   url: 'mercury_btn.php',
   data:'',
   success: function(data){
           $('#btn_mercury').html(data);
   }
});
});
/*****************/
