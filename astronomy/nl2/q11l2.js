
 // Display question №11 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q11l2.php', 
    data:'',
    success: function(data){
            $('#question11').html(data);
    }
});
});
