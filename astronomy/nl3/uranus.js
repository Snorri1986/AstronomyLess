 // Display data from MySQL Databse for Uranus planet
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url:'uranus.php', /*#31 ready to commit 03.q0.9*/
    data:'',
    success: function(data){
            $('#phys_uranus').html(data);
    }
});
});
