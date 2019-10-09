
 // Display question №14 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q14l4.php',  
    data:'',
    success: function(data){
            $('#question14').html(data);
    }
});
});
