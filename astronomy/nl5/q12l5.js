
 // Display question №12 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q12l5.php',  
    data:'',
    success: function(data){
            $('#question12').html(data);
    }
});
});
