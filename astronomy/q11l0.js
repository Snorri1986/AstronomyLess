
 // Display question №11 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q11l0.php',
    data:'',
    success: function(data){
            $('#question11').html(data);
    }
});
});
 
