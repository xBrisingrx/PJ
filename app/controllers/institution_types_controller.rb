class InstitutionTypesController < ApplicationController
  before_action :set_institution_type, only: %i[ show edit update destroy ]

  # GET /institution_types or /institution_types.json
  def index
    @institution_types = InstitutionType.all
  end

  # GET /institution_types/1 or /institution_types/1.json
  def show
  end

  # GET /institution_types/new
  def new
    @institution_type = InstitutionType.new
  end

  # GET /institution_types/1/edit
  def edit
  end

  # POST /institution_types or /institution_types.json
  def create
    @institution_type = InstitutionType.new(institution_type_params)

    respond_to do |format|
      if @institution_type.save
        format.html { redirect_to institution_type_url(@institution_type), notice: "Institution type was successfully created." }
        format.json { render :show, status: :created, location: @institution_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @institution_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /institution_types/1 or /institution_types/1.json
  def update
    respond_to do |format|
      if @institution_type.update(institution_type_params)
        format.html { redirect_to institution_type_url(@institution_type), notice: "Institution type was successfully updated." }
        format.json { render :show, status: :ok, location: @institution_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @institution_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /institution_types/1 or /institution_types/1.json
  def destroy
    @institution_type.destroy

    respond_to do |format|
      format.html { redirect_to institution_types_url, notice: "Institution type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_institution_type
      @institution_type = InstitutionType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def institution_type_params
      params.require(:institution_type).permit(:name, :active)
    end
end
