class SouhaitsController < ApplicationController
  before_action :set_souhait, only: [:show, :edit, :update, :destroy]

  # GET /souhaits
  # GET /souhaits.json
  def index
    @souhaits = Souhait.all
  end

  # GET /souhaits/1
  # GET /souhaits/1.json
  def show
  end

  # GET /souhaits/new
  def new
    @souhait = Souhait.new
  end

  # GET /souhaits/1/edit
  def edit
  end

  # POST /souhaits
  # POST /souhaits.json
  def create
    @souhait = Souhait.new(souhait_params)

    respond_to do |format|
      if @souhait.save
        format.html { redirect_to @souhait, notice: 'Souhait was successfully created.' }
        format.json { render :show, status: :created, location: @souhait }
      else
        format.html { render :new }
        format.json { render json: @souhait.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /souhaits/1
  # PATCH/PUT /souhaits/1.json
  def update
    respond_to do |format|
      if @souhait.update(souhait_params)
        format.html { redirect_to @souhait, notice: 'Souhait was successfully updated.' }
        format.json { render :show, status: :ok, location: @souhait }
      else
        format.html { render :edit }
        format.json { render json: @souhait.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /souhaits/1
  # DELETE /souhaits/1.json
  def destroy
    @souhait.destroy
    respond_to do |format|
      format.html { redirect_to souhaits_url, notice: 'Souhait was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_souhait
      @souhait = Souhait.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def souhait_params
      params.require(:souhait).permit(:title, :detail)
    end
end
