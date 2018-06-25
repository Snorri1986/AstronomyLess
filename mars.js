 // Display data from MySQL Databse for Mars planet
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url:'mars.php',
    data:'',
    success: function(data){
            $('#phys_mars').html(data);
    }
});
});