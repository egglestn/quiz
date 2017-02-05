$(document).ready(function() {
  $('#content_category').change(function(event) {
    console.log(event.target);

    var $content = $('.content');
    var $leftContent = $content.find(".left");
    var $next = $content.find(".next");
    var $score = $content.find(".score");

    // Hard-coded value, needs to match the "Question" option in the category enum in content.rb
    if (event.target.options.selectedIndex == 1)
    {
       console.log("Set to question");
       $next.hide();
       $score.hide();

       var $dataDiv = $content.find(".data");
       var answerContents = $dataDiv.data('contents');
       var answers = document.createElement("div");
       answers.className = "answers";

       for (i = 0; i < 3; i++) {
         answer = createAnswer(i, answerContents);
         answers.append(answer);
       }

       $leftContent.append(answers);
    }
    else {
      console.log("Not a question");
      var $answers = $content.find(".answers");
      $answers.hide();

      $next.show();
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
