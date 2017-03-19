$(document).ready(function() {
  $('#content_category').change(function(event) {
    //console.log(event.target);

    var $content = $('.content');
    var $leftContent = $content.find(".left");
    var $options = $content.find(".optiondiv");
    var $score = $content.find(".score");

    // Hard-coded value, needs to match the "Question" option in the category enum in content.rb
    if (event.target.options.selectedIndex == 1)
    {
       //console.log("Set to question");
       $options.each(function() {
         this.classList.remove("hidden");
       });
       $score.hide();
    }
    else {
      //console.log("Not a question");
      var first = true;
      $options.each(function() {
         if (first) {
           first = false
         }
         else {
           this.classList.add("hidden");
         }
      });
      $score.show();
    }
  });

  function createAnswer(i, answers) {
    var ansDiv = document.createElement("div");
    var ansLabel = document.createElement("label");
    ansLabel.textContent = "Answer " + (i+1);
    ansDiv.append(ansLabel);

    var ansSelect = document.createElement("select");

    answers.forEach(function(ansContent) {
      ansOption = document.createElement("option");
      ansOption.value = ansContent.id;
      ansOption.innerHTML = ansContent.key;
      ansSelect.append(ansOption);
    });

    ansDiv.append(ansSelect);

    return ansDiv;
  }
});
