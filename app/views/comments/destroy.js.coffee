$("#comment-list").html("<%= escape_javascript( render @beat.comments.reverse ) %>");
$("#messages").html("<%= escape_javascript( render 'layouts/messages' ) %>");