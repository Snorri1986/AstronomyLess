
 // Display question №10 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q10l6.php', 
    data:'',
    success: function(data){
            $('#question10').html(data);
    }
});
});
