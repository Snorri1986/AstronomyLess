// Display question №8 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q8l2.php', 
    data:'',
    success: function(data){
            $('#question8').html(data);
    }
});
});
