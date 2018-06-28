 // Display data from MySQL Databse for Mercury planet
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'neptune_lection.php',
    data:'',
    success: function(data){
            $('#neptune').html(data);
    }
});
});