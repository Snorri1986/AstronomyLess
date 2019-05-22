function updateSaturnLesson() {
	$(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'update_saturn.php',
    data:'',
    success: function(data){
            $('#saturn').html(data);
    }
});
});
}