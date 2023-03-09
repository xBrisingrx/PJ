class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show edit update destroy ]
  before_action :set_variables_form, only: %i[ new edit ]

  # GET /people or /people.json
  def index
    @people = Person.all
  end

  # GET /people/1 or /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
    @neighborhoods = Neighborhood.actives
    @dni_types = DniType.actives
    @title_modal = "Registro de afiliado"
  end

  # GET /people/1/edit
  def edit
    @neighborhoods = Neighborhood.actives
    @dni_types = DniType.actives
    @title_modal = "Editar afiliado #{@person.fullname}"
  end

  # POST /people or /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.json { render json: { status: 'success', msg: 'Afiliado registrado' }, status: :created }
        format.html { redirect_to person_url(@person), notice: "Person was successfully created." }
      else
        format.json { render json: @person.errors, status: :unprocessable_entity }
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.json { render json: { status: 'success', msg: 'Datos actualizados' }, status: :ok}
        format.html { redirect_to person_url(@person), notice: "Person was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    def set_variables_form
      @genres = [ {id: :M , value: 'Masculino'}, { id: :F, value: 'Femenino'} ]
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:name, :last_name, :genre, :dniType, :dni, :number, 
        :direction, :neighborhood_id, :dni_type_id)
    end
end
