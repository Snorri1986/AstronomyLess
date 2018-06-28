function updateJupiterLesson() {
	$(document).ready(function(){
    $.ajax({
    type:'GET',
    url: 'update_jupiter.php',
    data:'',
    success: function(data){
            $('#jupiter').html(data);
    }
});
});
}