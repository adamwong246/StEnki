(function() {
  var $open_area;

  $open_area = null;

  $(function() {
    var fetch_comment_preview;
    $("a.form_open").click(function() {
      var $comment_form, $opened_area, input_elements;
      $opened_area = $(this).next(".form_and_preview_container");
      if ($opened_area.is(':visible')) {
        $opened_area.hide('blind', {
          direction: "vertical"
        }, 1000);
      } else {
        $opened_area.show('blind', {
          direction: "vertical"
        }, 1000);
        $comment_form = $opened_area.children('.new_comment');
        input_elements = $comment_form.find(":text, textarea");
        console.log($opened_area);
        console.log($comment_form);
        console.log(input_elements);
        input_elements.keyup(function() {
          return fetch_comment_preview($opened_area).only_every(1000);
        });
        if (input_elements.any(function() {
          return $(this).val().length > 0;
        })) {
          fetch_comment_preview($opened_area);
        }
        fetch_comment_preview($opened_area);
      }
      return false;
    });
    return fetch_comment_preview = function($opened_area) {
      var $comment_form, $preview_container, dest;
      console.log("fetching preview on: ");
      console.log($opened_area);
      $comment_form = $opened_area.children('.new_comment');
      $preview_container = $comment_form.prev(".comment-preview-container");
      dest = window.location.href;
      dest = dest.split("#")[0];
      dest = dest.split("?")[0];
      if (!dest.endsWith("comments")) {
        dest += "/comments";
      }
      return jQuery.ajax({
        data: $comment_form.serialize(),
        url: dest + "/new",
        dataType: "html",
        timeout: 2000,
        error: function() {
          return $preview_container.text("Failed to submit");
        },
        success: function(r) {
          return $preview_container.html(r);
        }
      });
    };
  });

}).call(this);
