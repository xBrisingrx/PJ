json.data @provinces do |province|
	json.name province.name
	json.description province.description
	json.actions "#{ link_to '<i class="fa fa-edit"></i>'.html_safe, edit_province_path(province), remote: :true, class: 'btn btn-sm u-btn-primary text-white', title: 'Editar' } 
								<button class='btn btn-sm u-btn-red text-white' 
  								title='Eliminar' 
  								onclick='modal_disable_province( #{ province.id } )'>
									<i class='fa fa-trash-o' aria-hidden='true'></i></button> "
end
