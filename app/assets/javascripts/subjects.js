function Subject(attributes){
  this.name = attributes.name;
  this.id = attributes.id;
  this.created_by = attributes.created_by;
}

Subject.success = function(json){
  var subject = new Subject(json);
  var subjectLi = subject.renderLI()

  $("ul.subjects-list").append(subjectLi)
}

Subject.error = function(response){
  console.log("Yu broke it?", response)
}

Subject.formSubmit = function(e){
  e.preventDefault()
  var $form = $(this);
  var action = $form.attr("action");
  var params = $form.serialize();

  $.ajax({
    url: action,
    data: params,
    dataType: "json",
    method: "POST"
  })
  .success(Subject.success)
  .error(Subject.error)
}

Subject.destroy = function(json){
  var subject = new Subject(json);
  subject.destroy()
}

Subject.prototype.$li = function(){
  return $("li#subject-"+this.id)
}
Subject.prototype.destroy = function(){
  this.$li().remove();
}

Subject.destroyListener = function(){
  $("ul.subjects-list").on("click", "input.destroy", function(e){
    e.preventDefault();
    // submit this form via ajax and then remove the item
    var $form = $(this).parent("form");
    var action = $form.attr("action");
    var params = $form.serialize();

    $.ajax({
      url: action,
      data: params,
      dataType: "json",
      method: "DELETE"
    })
    .success(Subject.destroy)
  })
}
Subject.formSubmitListener = function(){
  $('form#new_subject').on("submit", Subject.formSubmit)
}

Subject.ready = function(){
  Subject.templateSource = $("#subject-template").html()
  Subject.template = Handlebars.compile(Subject.templateSource);
  Subject.formSubmitListener()
  Subject.destroyListener()
}

Subject.prototype.renderLI = function(){
  return Subject.template(this)
}

$(function(){
  Subject.ready()
})
