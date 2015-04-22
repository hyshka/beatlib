$("#comment-list").html("<%= escape_javascript( render @beat.comments ) %>");

$('.new_comment')[0].reset();

$("#messages").html("<%= escape_javascript( render 'layouts/messages' ) %>");