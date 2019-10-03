   // Display question №18 for default lesson
 $(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'q18l3.php', /* #31 ready to commit 03.10.2019 */
    data:'',
    success: function(data){
            $('#question18').html(data);
    }
});
});
