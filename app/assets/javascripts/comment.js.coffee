$ -> # onload
  $("a.form_open").click -> 
    $opened_area = $(this).next(".form_and_preview_container")#.children('div.hidden_comment_form');

    if ( $opened_area.is(':visible'))
      $opened_area.hide('blind',{direction: "vertical"},1000);

    else
      $opened_area.show('blind',{direction: "vertical"},1000);

      $comment_form = $opened_area.children('.new_comment') #$(".new_comment")
      input_elements = $comment_form.find(":text, textarea")

      console.log($opened_area)
      console.log($comment_form)
      console.log(input_elements)

      input_elements.keyup ->
        fetch_comment_preview($opened_area).only_every 1000

      fetch_comment_preview($opened_area)  if input_elements.any(->
        $(this).val().length > 0
      )

      fetch_comment_preview($opened_area)
    
    false
  # end of $("a.form_open").click

  fetch_comment_preview = ($opened_area) ->
    $comment_form = $opened_area.children('.new_comment')

    $preview_container = $comment_form.prev(".comment-preview-container")

    dest = window.location.href
    dest = dest.split("#")[0]
    dest = dest.split("?")[0]
    dest += "/comments"  unless dest.endsWith("comments")

    jQuery.ajax
      data: $comment_form.serialize()
      url: dest + "/new"
      dataType: "html"
      timeout: 2000

      error: ->
        # if $preview_container.length == 0
        #   $comment_form.after "<div class=\"comment-preview-container\"></div>" 
        
        $preview_container.text "Failed to submit"

      success: (r) ->
        # if $preview_container.length == 0
        #   $comment_form.after "<div class=\"comment-preview-container\"><h2>Your comment will look like this:</h2><div class=\"comment-preview\"></div></div>"  
        
        $preview_container.html r



