function updateEarthLesson() {
	$(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'update_earth.php',
    data:'',
    success: function(data){
            $('#earth').html(data);
    }
});
});
}