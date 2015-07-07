$(function () {
	$('.upvote-btn').each(function () {
    var $upvoteBtn = $(this);
    var $row = $upvoteBtn.closest('.row');
    var height = $row.height();

    $upvoteBtn.css('height', height);
  });
});