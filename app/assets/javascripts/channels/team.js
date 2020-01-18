// $(function() {}; で囲むことでレンダリング後に実行される
// レンダリング前に実行されると $('#messages').data('room_id') が取得できない
$(function() {
  App.team = App.cable.subscriptions.create({ channel: 'TeamChannel', team_id: $('#messages').data('team_id') }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received: function(data) {
      return $('#messages').append(data['message']);
    },

    speak: function(message) {
      return this.perform('speak', {
        message: message
      });
    }
  });

  $(document).on('keypress', '[data-behavior~=team_speaker]', function(event) {
    if (event.keyCode === 13) {
      chatChannel.speak(event.target.value);
      event.target.value = '';
      return event.preventDefault();
    }
  });
});
