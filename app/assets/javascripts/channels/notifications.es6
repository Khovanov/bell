App.cable.subscriptions.create({
  channel: "NotificationsChannel"
}, {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },
  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },
  received: function(data) {
    // Called when theres incoming data on the websocket for this channel
    console.log(`NOTIFICATION: `, data)
    let notification = $.parseJSON(data.notification)
    $(`span#notification-counter`).html(notification.total)
    $(`span#notification-ip`).html(notification.ip)
    $(`span#notification-time`).html(notification.time)
  }
});
