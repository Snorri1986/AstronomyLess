   // Display question №18 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q18l5.php', 
    data:'',
    success: function(data){
            $('#question18').html(data);
    }
});
});
