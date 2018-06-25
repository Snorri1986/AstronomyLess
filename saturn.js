 // Display data from MySQL Databse for Saturn planet
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url:'saturn.php',
    data:'',
    success: function(data){
            $('#phys_saturn').html(data);
    }
});
});