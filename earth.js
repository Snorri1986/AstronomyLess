 // Display data from MySQL Databse for Earth planet
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url:'earth.php',
    data:'',
    success: function(data){
            $('#phys_earth').html(data);
    }
});
});