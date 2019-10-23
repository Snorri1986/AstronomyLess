
 // Display question №12 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q12l6.php', 
    data:'',
    success: function(data){
            $('#question12').html(data);
    }
});
});
