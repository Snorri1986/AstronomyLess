 // Display data from MySQL Databse for Mercury planet
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'mercury_lection.php',
    data:'',
    success: function(data){
            $('#mercury').html(data);
    }
});
});