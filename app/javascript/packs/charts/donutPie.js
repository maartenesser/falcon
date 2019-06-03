import Chart from 'chart.js';

const graphFunction = (data) => {
  const ctx_pie = document.querySelector('#myPieChart');
  const ctx_bar = document.querySelector('#myBarChart');
  console.log(document.querySelector("#myPieChart[data-numbers]"));

  new Chart(ctx_pie, {
    type: 'doughnut',
    data: {
      labels: $('#myPieChart').data('label'),
      datasets: [{
        label: '# of Categories',
        data: $('#myPieChart').data('numbers'),
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



}

export default graphFunction;
