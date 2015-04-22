$(".beat[data-dom-id=<%= dom_id(@beat) %>] .download").html("<%= escape_javascript( render partial: 'beats/meta_download', locals: {beat: @beat} ) %>");
$.fileDownload('<%= @beat.midi.url %>');