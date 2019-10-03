
 // Display question №11 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q11l3.php', /* #31 ready to commit 03.10.2019 */
    data:'',
    success: function(data){
            $('#question11').html(data);
    }
});
});
