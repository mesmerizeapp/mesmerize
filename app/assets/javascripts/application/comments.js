$(function () {
  $commentField = $('textarea#comment_content');
  $commentForm = $commentField.closest('form');

  $commentField.on('keydown', function(e){
    if (!(e.which === 13 && !e.shiftKey === true)) return

    e.preventDefault();
    $commentForm.submit();
  });
});