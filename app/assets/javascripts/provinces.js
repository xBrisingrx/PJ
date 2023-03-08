let provinces_table,provinces_type

function modal_disable_province(id) {
  $('#modal-disable-province #province_id').val(id)
  $('#modal-disable-province').modal('show')
}

$(document).ready(function(){
  if ( document.getElementById('provinces_d_type') != undefined ) {
    provinces_type = document.getElementById('provinces_d_type').value
  }
	provinces_table = $("#provinces_table").DataTable({
    'ajax': `provinces?d_type=${provinces_type}`,
    'columns': [
    {'data': 'name'},
    {'data': 'description'},
    {'data': 'actions'}
    ],
    'language': {'url': datatables_lang}
	})

  $("#form-disable-province").on("ajax:success", function(event) {
    provinces_table.ajax.reload(null,false)
    let msj = JSON.parse(event.detail[2].response)
    noty_alert(msj.status, msj.msg)
    $("#modal-disable-province").modal('hide')
  }).on("ajax:error", function(event) {
    console.log(event)
  })
})
