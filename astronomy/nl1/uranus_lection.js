 // Display data from MySQL Databse for Mercury planet
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'uranus_lection.php',
    data:'',
    success: function(data){
            $('#uranus').html(data);
    }
});
});