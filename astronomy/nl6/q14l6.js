
 // Display question №14 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q14l6.php',  
    data:'',
    success: function(data){
            $('#question14').html(data);
    }
});
});