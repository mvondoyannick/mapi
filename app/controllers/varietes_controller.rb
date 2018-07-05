class VarietesController < ApplicationController
  before_action :set_variete, only: [:show, :edit, :update, :destroy]

  # GET /varietes
  # GET /varietes.json
  def index
    @varietes = Variete.all
  end

  # GET /varietes/1
  # GET /varietes/1.json
  def show
  end

  # GET /varietes/new
  def new
    @variete = Variete.new
  end

  # GET /varietes/1/edit
  def edit
  end

  # POST /varietes
  # POST /varietes.json
  def create
    @variete = Variete.new(variete_params)

    respond_to do |format|
      if @variete.save
        format.html { redirect_to @variete, notice: 'Variete was successfully created.' }
        format.json { render :show, status: :created, location: @variete }
      else
        format.html { render :new }
        format.json { render json: @variete.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /varietes/1
  # PATCH/PUT /varietes/1.json
  def update
    respond_to do |format|
      if @variete.update(variete_params)
        format.html { redirect_to @variete, notice: 'Variete was successfully updated.' }
        format.json { render :show, status: :ok, location: @variete }
      else
        format.html { render :edit }
        format.json { render json: @variete.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /varietes/1
  # DELETE /varietes/1.json
  def destroy
    @variete.destroy
    respond_to do |format|
      format.html { redirect_to varietes_url, notice: 'Variete was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_variete
      @variete = Variete.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def variete_params
      params.require(:variete).permit(:name)
    end
end
