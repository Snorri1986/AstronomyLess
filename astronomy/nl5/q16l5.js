// Display question №16 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q16l5.php', 
    data:'',
    success: function(data){
            $('#question16').html(data);
    }
});
});
