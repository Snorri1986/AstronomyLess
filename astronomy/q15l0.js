// Display question №15 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q15l0.php',
    data:'',
    success: function(data){
            $('#question15').html(data);
    }
});
});
 // ... //