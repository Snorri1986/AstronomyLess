function updateNeptuneLesson() {
	$(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'update_neptune.php',
    data:'',
    success: function(data){
            $('#neptune').html(data);
    }
});
});
}