 // Display data from MySQL Databse for Mercury planet
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'earth_lection.php',
    data:'',
    success: function(data){
            $('#earth').html(data);
    }
});
});