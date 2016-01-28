class LightsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_location
  before_action :set_light, only: [:show, :edit, :update, :destroy, :turn_on, :turn_off]

  # GET /lights
  # GET /lights.json
  def index
    @lights = Light.all

  end

  # GET /lights/1
  # GET /lights/1.json
  def show
  end

  # GET /lights/new
  def new
    @light = Light.new
  end

  # GET /lights/1/edit
  def edit
  end

  # POST /lights
  # POST /lights.json
  def create
    @light = @location.lights.new(light_params)

    respond_to do |format|
      if @light.save
        format.html { redirect_to [@location, @light], notice: 'Light was successfully created.' }
        format.json { render :show, status: :created, light: @light }
      else
        format.html { render :new }
        format.json { render json: @light.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lights/1
  # PATCH/PUT /lights/1.json
  def update
    respond_to do |format|
      if @light.update(light_params)
        format.html { redirect_to [@location, @light], notice: 'Light was successfully updated.' }
        format.json { render :show, status: :ok, light: @light }
      else
        format.html { render :edit }
        format.json { render json: @light.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lights/1
  # DELETE /lights/1.json
  def destroy
    @light.destroy
    respond_to do |format|
      format.html { redirect_to lights_url, notice: 'Light was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def turn_on
    respond_to do |format|
      if @light.turn_on
        format.json { head :no_content }
      else
        format.json { render nothing: true, status: :unprocessable_entity }
      end
    end
  end

  def turn_off
    respond_to do |format|
      if @light.turn_off
        format.json { head :no_content }
      else
        format.json { render nothing: true, status: :unprocessable_entity }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_light
      @light = Light.find(params[:id])
    end

    def set_location
      @location = Location.find_by_id( params[:location_id] )
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def light_params
      params.require(:light).permit(:name, :on_code, :off_code)
    end
end
