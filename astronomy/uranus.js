 // Display data from MySQL Databse for Uranus planet
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url:'uranus.php',
    data:'',
    success: function(data){
            $('#phys_uranus').html(data);
    }
});
});