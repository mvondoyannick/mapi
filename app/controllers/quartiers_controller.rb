class QuartiersController < ApplicationController
  before_action :set_quartier, only: [:show, :edit, :update, :destroy]

  # GET /quartiers
  # GET /quartiers.json
  def index
    @quartiers = Quartier.all
  end

  # GET /quartiers/1
  # GET /quartiers/1.json
  def show
  end

  # GET /quartiers/new
  def new
    @quartier = Quartier.new
  end

  # GET /quartiers/1/edit
  def edit
  end

  # POST /quartiers
  # POST /quartiers.json
  def create
    @quartier = Quartier.new(quartier_params)

    respond_to do |format|
      if @quartier.save
        format.html { redirect_to @quartier, notice: 'Quartier was successfully created.' }
        format.json { render :show, status: :created, location: @quartier }
      else
        format.html { render :new }
        format.json { render json: @quartier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quartiers/1
  # PATCH/PUT /quartiers/1.json
  def update
    respond_to do |format|
      if @quartier.update(quartier_params)
        format.html { redirect_to @quartier, notice: 'Quartier was successfully updated.' }
        format.json { render :show, status: :ok, location: @quartier }
      else
        format.html { render :edit }
        format.json { render json: @quartier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quartiers/1
  # DELETE /quartiers/1.json
  def destroy
    @quartier.destroy
    respond_to do |format|
      format.html { redirect_to quartiers_url, notice: 'Quartier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quartier
      @quartier = Quartier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quartier_params
      params.require(:quartier).permit(:name, :arrondissement_id)
    end
end
