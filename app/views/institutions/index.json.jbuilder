json.data @institutions do |institution|
	json.name institution.name
	json.type institution.institution_type.name
	json.city institution.city.name
	json.neighborhood institution.neighborhood.name
	json.direction institution.direction
	json.tables institution.tables.count
	json.actions "#{ link_to '<i class="fa fa-edit"></i>'.html_safe, edit_institution_path(institution), remote: :true, class: 'btn btn-sm u-btn-primary text-white', title: 'Editar' } 
								<button class='btn btn-sm u-btn-red text-white' 
  								title='Eliminar' 
  								onclick='modal_disable_institution( #{ institution.id } )'>
									<i class='fa fa-trash-o' aria-hidden='true'></i></button> "
end
