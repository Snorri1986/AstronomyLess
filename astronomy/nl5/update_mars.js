function updateMarsLesson() {
	$(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'update_mars.php',
    data:'',
    success: function(data){
            $('#mars').html(data);
    }
});
});
}