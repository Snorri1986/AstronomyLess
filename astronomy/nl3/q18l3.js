   // Display question №18 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q18l3.php', 
    data:'',
    success: function(data){
            $('#question18').html(data);
    }
});
});
