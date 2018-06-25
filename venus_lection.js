 // Display data from MySQL Databse for Mercury planet
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'venus_lection.php',
    data:'',
    success: function(data){
            $('#venus').html(data);
    }
});
});