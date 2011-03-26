// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function getCountNum() {
  $.getJSON('/disabling_logs/count.json', function(data) {
    $('#counter_data').html(data.count);
    $("abbr.time_ago").timeago();
  });
}

function getLatestLog() {
  $.getJSON('/disabling_logs/latest.json', function(data) {
    $('#update').html(data.latest);
    $("#timestamp").timeago();
  });
}