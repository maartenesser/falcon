// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function number_format(data, labels) {

const ctx_bar = document.getElementById("myAreaChart");


new Chart(ctx_bar, {
    type: 'line',
    data: {
      labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
      datasets: [{
        label: 'Sold Parts',
        data: [1, 3, 2, 5, 8, 15],
        backgroundColor: ['rgba(54, 162, 235, 0.2)'],
      }]
    },
    options: {
      scales: {
        yAxes: [{
          display: false,
          ticks: {
            beginAtZero: true
          },
          gridLines: {
            display: false,
            drawBorder: false
          },
        }],
        xAxes:[{
          gridLines: {
          display: false,
          drawBorder: false
        }
        }],
      }
    }
  });
}

export default number_format;
