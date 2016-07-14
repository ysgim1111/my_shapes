$(window).load(function() {
  initCountNbr();
});


function initCountNbr () {
  var current_status = parseInt($('#hi').val());
  var hasCounters = $('#counters').hasClass('count-wrapper');

  if (hasCounters) {

    var waypoint = new Waypoint({
      element: document.getElementById('counters'),
      handler: function() {

          var options = {
          useEasing : true,
          useGrouping : true,
          separator : ','
        };
        // Counter 1
        var counter1 = new CountUp('count-1', current_status-1000000, current_status, 0, 5, options);
        counter1.start();
        // Counter 2
        var counter2 = new CountUp('count-2', 0, 342, 0, 5, options);
        counter2.start();
        // Counter 3
        var counter3 = new CountUp('count-3', 0, 12, 0, 5, options);
        counter3.start();
        // Counter 4
        //var counter4 = new CountUp('count-4', 0, 102890, 0, 3, options);
        //counter4.start();
        // init only once
        this.destroy();
      },
      offset: '115%',
    });

  }


} // initCountNbr
