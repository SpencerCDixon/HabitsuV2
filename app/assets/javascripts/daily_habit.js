$(document).ready(function() {
  return $('.completeHabit').on('click', function(e) {
    var completeURL, dailyHabitID;
    e.preventDefault();
    dailyHabitID = $(e.currentTarget).data('id');
    completeURL = $(e.currentTarget).data('complete-url');
    return $.ajax({
      url: completeURL,
      type: 'POST',
      dataType: 'json',
      data: {
        habitID: dailyHabitID
      },
      success: (function() {
        return function(response) {
          var msg;
          $(e.currentTarget).remove();
          msg = $(response).attr('message');
          return Materialize.toast(msg, 4000);
        };
      })(this),
      error: (function() {
        return function() {
          return console.log('Failure');
        };
      })(this)
    });
  });
});
