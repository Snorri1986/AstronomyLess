function updateVenusLesson() {
	$(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'update_venus.php',
    data:'',
    success: function(data){
            $('#venus').html(data);
    }
});
});
}