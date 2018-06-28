 // Display data from MySQL Databse for Pluto planet
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url:'pluto.php',
    data:'',
    success: function(data){
            $('#phys_pluto').html(data);
    }
});
});