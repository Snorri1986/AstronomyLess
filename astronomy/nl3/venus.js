 // Display data from MySQL Databse for Venus planet
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url:'venus.php',
    data:'',
    success: function(data){
            $('#phys_venus').html(data);
    }
});
});