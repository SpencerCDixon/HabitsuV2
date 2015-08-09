$(document).ready(function() {
  return $('.completeHabit').on('click', function(e) {
    var complete_url, dailyHabitID, div;
    e.preventDefault();
    dailyHabitID = $(e.currentTarget).data('id');
    complete_url = $(e.currentTarget).data('complete-url');
    div = $(e.currentTarget);
    return $.ajax({
      url: complete_url,
      type: 'POST',
      dataType: 'json',
      data: {
        habit_id: dailyHabitID
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
