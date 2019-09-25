 // Display question №5 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q5l1.php', 
    data:'',
    success: function(data){
            $('#question5').html(data);
    }
});
});
