class CitiesController < ApplicationController
  before_action :set_city, only: %i[ show edit update destroy ]

  def index
    @cities = City.actives
  end

  def show
  end

  def new
    @city = City.new
    @modal_title = 'Registrar nueva ciudad'
  end

  def edit
    @modal_title = "Actualizar datos de la ciudad #{@city.name}"
  end

  def create
    city = City.new(city_params)

    respond_to do |format|
      if city.save
        format.json { render json: { status: :success, msg: 'Ciudad agregada.' }, status: :created }
      else
        format.json { render json: city.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @city.update(city_params)
        format.json { render json: { status: :success, msg: 'Datos de la ciudad actualizados.' }, status: :ok }
      else
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def disable
    city = City.find(params[:city_id])
    if city.update(active:false)
      render json: { status: 'success', msg: 'Ciudad eliminada' }, status: :ok
    else
      render json: { status: 'error', msg: 'Ocurrio un error al realizar la operación' }, status: :unprocessable_entity
    end

    rescue => e
      response = e.message.split(':')
      render json: { response[0] => response[1] }, status: 402
  end

  private
    def set_city
      @city = City.find(params[:id])
    end

    def city_params
      params.require(:city).permit(:name, :description, :active, :province_id)
    end
end
