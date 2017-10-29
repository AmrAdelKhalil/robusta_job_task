# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@share = (token, movie_id) ->
      $.ajax 'http://localhost:3000/movies/share',
        type: 'POST'
        data: {"token":token, "movie_id": movie_id}
        dataType: 'html'
        error: (jqXHR, textStatus, errorThrown) ->
            console.log("fail");
            $("#failure_message").html('Something went wrong.' + jqXHR.responseText + ", It is facebook policy not to post the same twice you can try again after 10 minutes.");
            $("#failure").css('display','block');
            $("#success").css('display','none');
        success: (data, textStatus, jqXHR) ->
            console.log("success");
            $("#success_message").html('You have shared this movie on facebook successfully.');
            $("#success").css('display','block');
            $("#failure").css('display','none');
