// Display question №2 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q2l3.php',  
    data:'',
    success: function(data){
            $('#question2').html(data);
    }
});
});
