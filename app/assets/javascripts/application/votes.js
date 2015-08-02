$(function () {
  $('.btn-vote').each(function() {
    $btn = $(this);
    $parentRow = $btn.closest('.row');
    btnHeight = $btn.height();
    parentRowHeight = $parentRow.height();
    marginValue = (parentRowHeight - btnHeight)/2;

    $btn.css('padding', marginValue + 'px 0');
  });

  $('.col-no-gutter .box').each(function() {
    $parenetRow = $(this).closest('.row');
    $(this).css('height', $parenetRow.height() + 'px');
  });

  $('.btn-vote').click(function() {
    var $this =  $(this);
    var action = $this.attr('data-action');

    $.ajax({
      url: $this.data('username') + '/ideas/' + $this.data('idea-id') + '/votes',
      type: action,
      success: function(data, textStatus, jqXHR) {
        if (data.success) {
          $this.find('.vote-num').text(data.votes_count);
          if(action == 'POST'){
            $this.attr('data-action', 'DELETE');
            $this.addClass('voted');
          } else {
            $this.attr('data-action', 'POST');
            $this.removeClass('voted');
          }
        }
      },
      error: function (jqXHR, textStatus, errorThrown) {
        console.log('ERROR: ', jqXHR.responseJSON.message);
      }
    });
  });
});
