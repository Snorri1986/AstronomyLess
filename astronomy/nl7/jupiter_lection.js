 // Display data from MySQL Databse for Mercury planet
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'jupiter_lection.php',
    data:'',
    success: function(data){
            $('#jupiter').html(data);
    }
});
});