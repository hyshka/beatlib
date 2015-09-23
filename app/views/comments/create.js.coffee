$("#comment-list").html("<%= escape_javascript( render @beat.comments.reverse ) %>");

$('.new_comment')[0].reset();

$("#messages").html("<%= escape_javascript( render 'layouts/messages' ) %>");