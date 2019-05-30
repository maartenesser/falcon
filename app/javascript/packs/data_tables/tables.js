import 'datatables.net'
import 'datatables.net-dt/css/jquery.dataTables.css'

function tables() {
  $(document).ready( function () {
      $('#table_id').DataTable({
        data: $('#table_id').data('statistics'),
        columns:
        [
          { data: 'claim_number',
            "fnCreatedCell": function (nTd, sData, oData, iRow, iCol)
            {$(nTd).html(`<a href='claims/${oData.claim_id}'>${oData.claim_number}</a>`);
          }},
          { data: 'company' },
          { data: "title",
            "fnCreatedCell": function (nTd, sData, oData, iRow, iCol)
            {$(nTd).html(`<a href='parts/${oData.part_id}'>${oData.title}</a>`);
          }},
          { data: 'price' }

        ]
      });
      console.log($('#table_id').data('statistics')[2].title);
  });
}

export default tables;
