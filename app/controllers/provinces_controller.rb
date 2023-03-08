class ProvincesController < ApplicationController
  before_action :set_province, only: %i[ show edit update destroy ]

  def index
    @provinces = Province.actives
  end

  def show
  end

  def new
    @province = Province.new
  end

  def edit
  end

  def create
    province = Province.new(province_params)

    respond_to do |format|
      if province.save
        format.json { render json: { status: :success, msg: 'Provincia agregada.' }, status: :created }
      else
        format.json { render json: province.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @province.update(province_params)
        format.json { render json: { status: :success, msg: 'Datos actualizados.'}, status: :ok }
      else
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def disable
    province = Province.find(params[:province_id])
    if province.update(active:false)
      render json: { status: 'success', msg: 'Provincia eliminada' }, status: :ok
    else
      render json: { status: 'error', msg: 'Ocurrio un error al realizar la operación' }, status: :unprocessable_entity
    end

    rescue => e
      response = e.message.split(':')
      render json: { response[0] => response[1] }, status: 402
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_province
      @province = Province.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def province_params
      params.require(:province).permit(:name, :description, :active)
    end
end
