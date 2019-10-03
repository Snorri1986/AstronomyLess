
 // Display question №14 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q14l3.php',  /* #31 ready to commit 03.10.2019 */
    data:'',
    success: function(data){
            $('#question14').html(data);
    }
});
});
