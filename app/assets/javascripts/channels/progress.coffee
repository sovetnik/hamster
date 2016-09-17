App.cable = App.cable.subscriptions.create channel: "ProgressChannel",

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('.progress-bar').width(data.rate)
    if data.completed
      $('.progress-bar').toggleClass('progress-bar-success progress-bar-striped')
