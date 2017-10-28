# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@b = (token, movie_id) ->
      $.ajax 'http://localhost:3000/movies/share',
        type: 'POST'
        data: {"token":token, "movie_id": movie_id}
        dataType: 'html'
        error: (jqXHR, textStatus, errorThrown) ->
            console.log("failed");
        success: (data, textStatus, jqXHR) ->
            console.log("success");
