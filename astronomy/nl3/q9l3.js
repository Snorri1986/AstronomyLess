
 // Display question №9 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q9l3.php', 
    data:'',
    success: function(data){
            $('#question9').html(data);
    }
});
});
