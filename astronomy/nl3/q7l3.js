// Display question №7 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q7l3.php', 
    data:'',
    success: function(data){
            $('#question7').html(data);
    }
});
});
