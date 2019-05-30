import 'datatables.net'
import 'datatables.net-dt/css/jquery.dataTables.css'

function tables() {
  $(document).ready( function () {
      $('#table_id').DataTable({
        data: $('#table_id').data('statistics'),
        columns:
        [
          { data: 'title' },
          { data: 'price_cents' },
          { data: 'claim_number' }
        ]
      });
  });
}

export default tables;
