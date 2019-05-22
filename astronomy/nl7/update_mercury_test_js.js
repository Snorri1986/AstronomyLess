// production version
function updateMercuryLesson() {
	$(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'update_mercury_test.php',
    data:'',
    success: function(data){
            $('#mercury').html(data);
    }
});
});
}