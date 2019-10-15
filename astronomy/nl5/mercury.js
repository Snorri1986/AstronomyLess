 // Display data from MySQL Databse for Mercury planet
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'Mercury.php',
    data:'',
    success: function(data){
            $('#phys_mercury').html(data);
    }
});
});