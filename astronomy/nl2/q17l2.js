 // Display question №17 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q17l2.php',  
    data:'',
    success: function(data){
            $('#question17').html(data);
    }
});
});
