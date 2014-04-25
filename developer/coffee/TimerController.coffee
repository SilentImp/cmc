define [
  "momentjs/min/moment-with-langs.min"
  ], ()->

  class CountdownController
    constructor: (widget)->
      @widget = widget
      @datetime = @widget.getAttribute('datetime')
      if @datetime == null || @datetime == undefined || moment(@datetime).isValid() == false
        return
      @datetime = moment(@datetime)
      window.setInterval @recount, 500

    recount: ()=>
      now = moment()
      @widget.innerHTML = moment(@datetime.diff(now)).format("HH:mm:ss")



  class TimerController
    constructor: ()->
      timers = document.querySelectorAll ".countdown-widget time"
      for timer in timers
        new CountdownController(timer)


  return TimerController