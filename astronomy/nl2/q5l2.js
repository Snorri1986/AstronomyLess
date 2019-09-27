 // Display question №5 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q5l2.php', 
    data:'',
    success: function(data){
            $('#question5').html(data);
    }
});
});
