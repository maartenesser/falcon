// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function number_format(data) {

  const ctx_bar = document.getElementById("myAreaChart");

  new Chart(ctx_bar, {
      type: 'line',
      data: {
        labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
        datasets: [{
          label: 'Sold Parts',
           data: JSON.parse(ctx_bar.dataset.countAll),
          // data: [1, 23, 4, 5, 2, 3, 5, 2, 4, 20, 1, 0],
          backgroundColor: [
          'rgba(54, 162, 235, 0.2)'
          ],
          borderColor: [
          'rgba(54, 162, 235, 1)',
          ],
          borderWidth: 1
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
