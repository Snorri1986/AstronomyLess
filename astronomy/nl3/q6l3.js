// Display question №6 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q6l3.php', 
    data:'',
    success: function(data){
            $('#question6').html(data);
    }
});
});
