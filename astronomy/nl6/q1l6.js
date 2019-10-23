 // Display question №1 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q1l6.php', 
    data:'',
    success: function(data){
            $('#question1').html(data);
    }
});
});
