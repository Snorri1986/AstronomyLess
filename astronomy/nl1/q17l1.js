 // Display question №17 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q17l1.php', 
    data:'',
    success: function(data){
            $('#question17').html(data);
    }
});
});
