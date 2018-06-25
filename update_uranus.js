function updateUranusLesson() {
	$(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'update_uranus.php',
    data:'',
    success: function(data){
            $('#uranus').html(data);
    }
});
});
}