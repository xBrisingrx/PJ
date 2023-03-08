json.data @cities do |city|
	json.province city.province.name
	json.name city.name
	json.description city.description
	json.actions "#{ link_to '<i class="fa fa-edit"></i>'.html_safe, edit_city_path(city), remote: :true, class: 'btn btn-sm u-btn-primary text-white', title: 'Editar' } 
								<button class='btn btn-sm u-btn-red text-white' 
  								title='Eliminar' 
  								onclick='modal_disable_city( #{ city.id } )'>
									<i class='fa fa-trash-o' aria-hidden='true'></i></button> "
end
