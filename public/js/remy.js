<!--
  function get_restaurants() {
    $.get("http://localhost:9200/menus/_search?q=*&size=5", function(data) {
      console.log("Load was performed.");
      if (data && data.hits && data.hits.hits) {
        var results = data.hits.hits;
        console.log(results);
        console.log($("form input").val());

        // iterate over all of 'results' text-based elements
        $('#results').children().children('.col-md-5').each(function(outerIndex, outerElement) {
          console.log(results[outerIndex]);
          // iterate over each text-based element and update with retrieved data
          $(outerElement).children().each(function(innerIndex, innerElement) {
            switch(innerIndex) {
              // Restaurant Name
              case 0:
                var restaurant = results[outerIndex]._source.restaurant;
                $(innerElement).text(restaurant);
                break;
              // Rating - Address - Distance
              case 1:
                var name = results[outerIndex]._source.name;
                $(innerElement).text(name);
                break;
              // Description
              case 2:
                var description = results[outerIndex]._source.description;
                $(innerElement).text(description);
                break;
            }
          });
        })
      }
    });
  }
//-->
