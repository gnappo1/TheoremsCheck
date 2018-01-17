$(document).off('submit');
$('body').off('click');

//create new subject instance with handlebars templates and delegates responsabilities to specific functions eg. 'success', 'error', 'formSubmit'
//set the properties of the newly instanciated JSON object
function Subject(attributes) {
  this.name = attributes.name;
  this.id = attributes.id;
  this.created_by = attributes.created_by;
}

// retrieve and compile a template with Handlebars
$(function() {
  Subject.templateSource = $('#subject-template').html()
  Subject.template = Handlebars.compile(Subject.templateSource);
})

//built a function on Subject prororype to render template filled with the newly object properties
Subject.prototype.renderDiv = function() {
  return Subject.template(this);
}

// what to do in case of ajax:success
Subject.success = function(json) {
  var subject = new Subject(json);
  var subjectDiv = subject.renderDiv();
  $("ul.subjects-list").append(subjectDiv);
  $('#subject_name').val('')
}

// what to do in case of ajax:error
Subject.error = function(response) {
  console.log("Damn Fool!", response)
}

//The AJAX call on 'submit'
Subject.formSubmit = function(e) {

  $.ajax({
    type: this.method,
    url: this.action,
    data: $(this).serialize(),
    dataType: 'json'
  })
  .success(Subject.success)
  .error(Subject.error)

  e.preventDefault();
}

//my eventlistener on  form 'submit' for the new subject
$(function() {
  $("#new_subject").on("submit", Subject.formSubmit)
})

// loads with AJAX the edit form
$(function() {
  $('body').on("click", "#edit-button", function(e) {

    $.ajax({
      type: "GET",
      url: this.href,
      data: $(this).serialize(),
      dataType: 'script'
    });

    e.preventDefault();
  })
})

//updates with AJAX specific resource of the index list on 'submit'
$(function() {
  $(document).on("submit", "form#edit_subject_82", function(e) {

    $.ajax({
      type: 'patch',
      url: this.action,
      data: $(this).serialize(),
      dataType: 'script'
    });

    e.preventDefault();
  })
})

//deletes with AJAX a specific resource of the list on 'submit'
$(function() {
  $('body').off().on("submit", "form.button_to", function(e) {

    $.ajax({
      type: 'delete',
      url: this.action,
      data: $(this).serialize(),
      dataType: 'script'
    });

    e.preventDefault();
  })
})
