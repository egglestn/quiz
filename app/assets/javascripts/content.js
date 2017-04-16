$(document).ready(function() {
  $('#content_category').change(function(event) {
    var $content = $('.content');
    var $answers = $content.find(".answers");

    // Hard-coded value, needs to match the "Question" option in the category enum in content.rb
    if (event.target.options.selectedIndex == 1)
    {
       $answers.hide();
    }
    else {
      //console.log("Not a question");
      $answers.show();
    }
  });
});
