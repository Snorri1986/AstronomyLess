// function for close modal windows while send Survey
// version 1.0
function hide_mod(modal_name) {
  $('#btn_survey').click(function() {
      $(modal_name).modal('hide');
  });
}
