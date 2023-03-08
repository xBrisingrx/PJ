let provinces_table

function modal_disable_province(id) {
  $('#modal-disable-province #province_id').val(id)
  $('#modal-disable-province').modal('show')
}

$(document).ready(function(){
	provinces_table = $("#provinces_table").DataTable({
    'ajax': 'provinces',
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
