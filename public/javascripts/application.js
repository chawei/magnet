// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function getCountNum() {
  $.getJSON('/disabling_logs/count.json', function(data) {
    $('#counter_num').html(data.count);
  });
}