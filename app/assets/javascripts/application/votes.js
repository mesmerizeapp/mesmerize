$(function () {
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
