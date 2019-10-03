
 // Display question №12 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q12l3.php', /* #31 ready to commit 03.10.2019 */
    data:'',
    success: function(data){
            $('#question12').html(data);
    }
});
});
