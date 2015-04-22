$("#nav-tags").html("<%= j( render partial: 'nav_tags', locals: { selected_tag: @selected_tag } ) %>");
$("#beats").html("<%= j( render @sorted_beats, locals: { sorted_beats: @sorted_beats } ) %>");
$("#pagination").html("<%= j( will_paginate @sorted_beats ) %>");
$.getScript("<%= j( asset_url( 'nav_tags.coffee' ) ) %>")

# infinite scrolling
#$('#beats').append('<%= j render @sorted_beats %>');
#<% if @sorted_beats.next_page %>
#$('#pagination').replaceWith('<%= j will_paginate @sorted_beats %>');
#<% else %>
#$(window).off('scroll');
#$('#pagination').remove();
#<% end %>
