 // Display data from MySQL Databse for Mars planet
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url:'jupiter.php',
    data:'',
    success: function(data){
            $('#phys_jupiter').html(data);
    }
});
});