/*Get description of events */
// Display data from MySQL Database for Mercury planet
$(document).ready(function(){
   $.ajax({
   type:'GET',
   url: 'event.php',
   data:'',
   success: function(data){
           $('#Event').html(data);
   }
});
});
/*****************/
