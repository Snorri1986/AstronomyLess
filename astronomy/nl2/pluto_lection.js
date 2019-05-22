 // Display data from MySQL Databse for Mercury planet
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'pluto_lection.php',
    data:'',
    success: function(data){
            $('#pluto').html(data);
    }
});
});