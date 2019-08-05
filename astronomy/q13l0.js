// Display question №13 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q13l0.php',
    data:'',
    success: function(data){
            $('#question13').html(data);
    }
});
});
 
