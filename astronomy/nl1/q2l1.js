// Display question №2 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q2l1.php', 
    data:'',
    success: function(data){
            $('#question2').html(data);
    }
});
});
