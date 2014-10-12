<!--
  function get_restaurants() {
    console.log($("form input").val());
    if (!$("form input").val()) { return; }

    $.ajax({
      url: "/dish/" + $("form input").val(),
      type: 'GET',
      success: function(data) {
        var results = $.parseJSON(data);
        console.log(results);
        if (results && results.length !== 0) {
          // TODO(jdlew): This needs to be templatized so values can be
          // substitued easily.
          var markup =
          '<div class="row">' +
            '<div class="col-md-7">' +
              '<a href="#">' +
                '<img class="img-responsive" src="http://placehold.it/700x300" alt="">' +
              '</a>' +
            '</div>' +
            '<div class="col-md-5">' +
              '<h3>Restaurant One</h3>' +
              '<h4>Rating - Address - Distance</h4>' +
              '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium veniam exercitationem expedita laborum at voluptate. Labore, voluptates totam at aut nemo deserunt rem magni pariatur quos perspiciatis atque eveniet unde.</p>' +
              '<a class="btn btn-primary" href="#">View Website <span class="glyphicon glyphicon-chevron-right"></span></a>' +
            '</div>' +
          '</div>' +

          '<hr>';

          // iterate over first 5 elements in API response
          $.each(results, function(index, value) {
            console.log(value);
            console.log($("#results"));
            $.each(this, function(key, value) {
              console.log(key);
              console.log(value);
            });
          });

          // display results
          toggle_visibility('results', true);
        } else {
          console.log("Empty response", results);
        }
      },
      error: function(data) {
        console.log("Bad response", data);
      }
    });
  }
//-->
