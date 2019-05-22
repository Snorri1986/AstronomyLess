
 // Display question №3 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q3l0.php',
    data:'',
    success: function(data){
            $('#question3').html(data);
    }
});
});
 // ... //