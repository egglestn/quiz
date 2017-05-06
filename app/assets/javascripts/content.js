$(document).ready(function() {
  $('#content_category').change(function(event) {
    var $content = $('.content');
    var $answers = $content.find(".answers");
    console.log(".");

    // Hard-coded value, needs to match the "Question" option in the category enum in content.rb
    if (event.target.options.selectedIndex == 1)
    {
       $answers.hide();
    }
    else {
      $answers.show();
    }
  });
});
