// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require popper
//= require bootstrap
//= require bootstrap-sprockets
//= require activestorage
//= require turbolinks
//= require jquery-ui
//= require bootstrap-typeahead-rails
//= require_tree .

(function() {
  jQuery(function() {
    return $("#term").autocomplete({
      source: "/movies/autocomplete",
      minLength: 2
    });
  });

}).call(this);

var movies = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.whitespace,
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: {
    url: '/movies/autocomplete?term=%QUERY',
    wildcard: '%QUERY'
  }
});
$('#term').typeahead(null, {
  source: movies
});
