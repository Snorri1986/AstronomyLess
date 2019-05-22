function updatePlutoLesson() {
	$(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'update_pluto.php',
    data:'',
    success: function(data){
            $('#pluto').html(data);
    }
});
});
}