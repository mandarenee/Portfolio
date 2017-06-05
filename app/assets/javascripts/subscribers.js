function successful_subscribe() {
  var message = 'Great! Look in your inbox for a confirmation email!';
  resetForm(message, 'successMessage');
}

function unsuccessful_subscribe() {
  var message = "Uh oh! Looks like something's wrong, please check your email address again.";
  resetForm(message, 'failureMessage');

}

function resetForm(subscribeMessage, messageClass) {
  var subscribe_message = document.getElementById('subscribeMessage');
  subscribe_message.innerHTML = subscribeMessage;
  $("#new_subscriber").trigger("reset");
  $('#subscribeMessage').addClass(messageClass);
}
