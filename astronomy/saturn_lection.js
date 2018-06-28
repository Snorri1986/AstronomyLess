 // Display data from MySQL Databse for Mercury planet
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'saturn_lection.php',
    data:'',
    success: function(data){
            $('#saturn').html(data);
    }
});
});