class CalendriersController < ApplicationController
  before_action :set_calendrier, only: [:show, :edit, :update, :destroy]

  # GET /calendriers
  # GET /calendriers.json
  def index
    @calendriers = Calendrier.all
  end

  # GET /calendriers/1
  # GET /calendriers/1.json
  def show
  end

  #methode de jointure entre les market et le calendrier
  def association
    @association = Market.new #find(params[:id]).calendrier.new(date: params[:calendrier_id])

  end

  # GET /calendriers/new
  def new
    @calendrier = Calendrier.new
  end

  # GET /calendriers/1/edit
  def edit
  end

  # POST /calendriers
  # POST /calendriers.json
  def create
    @calendrier = Calendrier.new(calendrier_params)

    respond_to do |format|
      if @calendrier.save
        format.html { redirect_to @calendrier, notice: 'Calendrier was successfully created.' }
        format.json { render :show, status: :created, location: @calendrier }
      else
        format.html { render :new }
        format.json { render json: @calendrier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calendriers/1
  # PATCH/PUT /calendriers/1.json
  def update
    respond_to do |format|
      if @calendrier.update(calendrier_params)
        format.html { redirect_to @calendrier, notice: 'Calendrier was successfully updated.' }
        format.json { render :show, status: :ok, location: @calendrier }
      else
        format.html { render :edit }
        format.json { render json: @calendrier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendriers/1
  # DELETE /calendriers/1.json
  def destroy
    @calendrier.destroy
    respond_to do |format|
      format.html { redirect_to calendriers_url, notice: 'Calendrier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendrier
      @calendrier = Calendrier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calendrier_params
      params.require(:calendrier).permit(:date)
    end
end
