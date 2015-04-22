$("#comment-list").html("<%= escape_javascript( render @beat.comments ) %>");
$("#messages").html("<%= escape_javascript( render 'layouts/messages' ) %>");