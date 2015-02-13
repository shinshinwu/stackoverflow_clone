// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){

  // block level markdowns, currently haven't considered line breaks
  var block = {
    heading: /^ *(#{1,6}) *([^\n]+?) *#* *(?:\n+|$)/
  };

  var headingMatch = function(input) {
    var output_array = input.match(block.heading);
    var count = output_array[1].length;
    return "<h" + count + ">" + output_array[2] + "</h" + count + ">"
  }

  // inline level markdowns
  var inline = {
    strong: /^__([\s\S]+?)__(?!_)|^\*\*([\s\S]+?)\*\*(?!\*)/,
    em: /^\b_((?:__|[\s\S])+?)_\b|^\*((?:\*\*|[\s\S])+?)\*(?!\*)/
  }

  var emMatch = function(input){
    var output_array = input.match(block.heading);
    if (output_array[1] == undefined) {
      return "<em>" + output_array[2] + "</em>"
    } else {
      return "<em>" + output_array[1] + "</em>"
    };
  };

  var strongMatch = function(input){
    var output_array = input.match(block.heading);
    if (output_array[1] == undefined) {
      return "<strong>" + output_array[2] + "</strong>"
    } else {
      return "<strong>" + output_array[1] + "</strong>"
    };
  };

  var megaMatch = function(input){

  }

  $('#question_title').keyup(function(){
    var $this = $(this).val();
    if ($this.split('').indexOf("#") === -1){
      $('#questionTitle').html(emMatch($this));
    } else {
      $('#questionTitle').html(emMatch(headingMatch($this)));
    };
  });

  $('#question_content').keyup(function(){
    var $this = $(this).val();
    if ($this.split('').indexOf("#") === -1){
      $('#questionContent').html($this);
    } else {
    $('#questionContent').html(headingMatch($this));
    };
  });


});
