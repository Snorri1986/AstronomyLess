function updateMercuryLesson() {
	$(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'update_mercury.php',
    data:'',
    success: function(data){
            $('#mercury').html(data);
    }
});
});
}