// Display question №7 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q7l1.php', 
    data:'',
    success: function(data){
            $('#question7').html(data);
    }
});
});
