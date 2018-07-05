class VilsController < ApplicationController
  before_action :set_vil, only: [:show, :edit, :update, :destroy]

  # GET /vils
  # GET /vils.json
  def index
    @vils = Vil.all
  end

  # GET /vils/1
  # GET /vils/1.json
  def show
  end

  # GET /vils/new
  def new
    @vil = Vil.new
  end

  # GET /vils/1/edit
  def edit
  end

  # POST /vils
  # POST /vils.json
  def create
    @vil = Vil.new(vil_params)

    respond_to do |format|
      if @vil.save
        format.html { redirect_to @vil, notice: 'Vil was successfully created.' }
        format.json { render :show, status: :created, location: @vil }
      else
        format.html { render :new }
        format.json { render json: @vil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vils/1
  # PATCH/PUT /vils/1.json
  def update
    respond_to do |format|
      if @vil.update(vil_params)
        format.html { redirect_to @vil, notice: 'Vil was successfully updated.' }
        format.json { render :show, status: :ok, location: @vil }
      else
        format.html { render :edit }
        format.json { render json: @vil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vils/1
  # DELETE /vils/1.json
  def destroy
    @vil.destroy
    respond_to do |format|
      format.html { redirect_to vils_url, notice: 'Vil was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vil
      @vil = Vil.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vil_params
      params.require(:vil).permit(:name, :image)
    end
end
