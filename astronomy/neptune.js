 // Display data from MySQL Databse for Neptune planet
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url:'neptune.php',
    data:'',
    success: function(data){
            $('#phys_neptune').html(data);
    }
});
});