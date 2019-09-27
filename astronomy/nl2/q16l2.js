// Display question №16 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q16l2.php', 
    data:'',
    success: function(data){
            $('#question16').html(data);
    }
});
});
