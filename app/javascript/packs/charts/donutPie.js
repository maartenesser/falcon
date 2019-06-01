import Chart from 'chart.js';

const graphFunction = (data) => {
const ctx_pie = document.querySelector('#myPieChart');
const ctx_bar = document.querySelector('#myBarChart');

  new Chart(ctx_pie, {
    type: 'doughnut',
    data: {
        labels: ['Lighting', 'Body', 'Electric', 'Sensors'],
        datasets: [{
            label: '# of Categories',
            data: [12, 19, 3, 5],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)'

            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {

    }
  });

  new Chart(ctx_bar, {
    type: 'line',
    data: {
        labels: ['January', 'February', 'March', 'April', 'May', 'Juni'],
        datasets: [{
            label: 'Sold Parts',
            data: [1, 3, 2, 5, 8, 15],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)'
                ],

        }]
    },
    options: {
        scales: {
            yAxes: [{
              display: true,
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
  });

}

export default graphFunction;
