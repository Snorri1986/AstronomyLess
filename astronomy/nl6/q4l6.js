  // Display question №4 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q4l6.php', 
    data:'',
    success: function(data){
            $('#question4').html(data);
    }
});
});
