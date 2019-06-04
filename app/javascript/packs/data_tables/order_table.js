import 'datatables.net'
import 'datatables.net-dt/css/jquery.dataTables.css'

function order_table() {
  $(document).ready( function () {
      $('#order_table_id').DataTable({
        data: $('#order_table_id').data('table'),
        columns:
        [
          { data: 'id',
            "fnCreatedCell": function (nTd, sData, oData, iRow, iCol)
            {$(nTd).html(`<a href='orders/${oData.id}'>${oData.id}</a>`);
          }
          },
          { data: "title"
          //   "fnCreatedCell": function (nTd, sData, oData, iRow, iCol)
          //   {$(nTd).html(`<a href='parts/${oData.order.part_id}'>${oData.order.part.title}</a>`);
          // }
        },
          { data: 'created_at' },
          { data: 'price' },
          { data: 'company' }
          // { data: 'date' }

        ]
      });
  });
}

export default order_table;
