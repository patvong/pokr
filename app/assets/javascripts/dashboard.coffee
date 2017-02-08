class Dashboard
  init: ->
    $('[data-toggle="tooltip"]').tooltip()
    chartLabels = JSON.parse($('#chartLabels').val())
    chartData = JSON.parse($('#chartData').val())
    if typeof chartLabels != 'undefined'
      ctx = document.getElementById('myChart')
      data = 
        labels: chartLabels
        datasets: [ {
          label: '# of stories'
          fill: false
          lineTension: 0.1
          backgroundColor: 'rgba(75,192,192,0.4)'
          borderColor: 'rgba(75,192,192,1)'
          borderCapStyle: 'butt'
          borderDash: []
          borderDashOffset: 0.0
          borderJoinStyle: 'miter'
          pointBorderColor: 'rgba(75,192,192,1)'
          pointBackgroundColor: '#fff'
          pointBorderWidth: 1
          pointHoverRadius: 5
          pointHoverBackgroundColor: 'rgba(75,192,192,1)'
          pointHoverBorderColor: 'rgba(220,220,220,1)'
          pointHoverBorderWidth: 2
          pointRadius: 1
          pointHitRadius: 10
          data: chartData
          spanGaps: false
          borderWidth: 3
        } ]
      myNewChart = new Chart(ctx,
        type: 'line'
        data: data
        options:
          responsive: true
          maintainAspectRatio: false
          scales: yAxes: [ { ticks: beginAtZero: true } ])

$(document).on 'turbolinks:load', ->
  $('.dashboard.index').ready ->
    dashboard = new Dashboard
    dashboard.init()