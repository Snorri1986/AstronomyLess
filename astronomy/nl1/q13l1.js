// Display question №13 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q13l1.php',
    data:'',
    success: function(data){
            $('#question13').html(data);
    }
});
});
