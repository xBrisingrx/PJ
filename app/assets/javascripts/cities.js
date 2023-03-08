let cities_table

function modal_disable_city(id) {
  $('#modal-disable-city #city_id').val(id)
  $('#modal-disable-city').modal('show')
}

$(document).ready(function(){
  cities_table = $("#cities_table").DataTable({
    'ajax': 'cities',
    'columns': [
      {'data': 'province'},
      {'data': 'name'},
      {'data': 'description'},
      {'data': 'actions'}
    ],
    'language': {'url': datatables_lang}
  })

  $("#form-disable-city").on("ajax:success", function(event) {
    cities_table.ajax.reload(null,false)
    let msj = JSON.parse(event.detail[2].response)
    noty_alert(msj.status, msj.msg)
    $("#modal-disable-city").modal('hide')
  }).on("ajax:error", function(event) {
    console.log(event)
  })
})