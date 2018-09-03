 // Display data from MySQL Databse for Mercury planet
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'mars_lection.php',
    data:'',
    success: function(data){
            $('#mars').html(data);
    }
});
});