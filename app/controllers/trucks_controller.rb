class TrucksController < ApplicationController
  before_action :set_truck, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /trucks
  # GET /trucks.json
  def index
    @trucks = Truck.all.where(secure: true, user_id: current_user.id)
  end

  # GET /trucks/1
  # GET /trucks/1.json
  def show
  end

  # GET /trucks/new
  def new
    @truck = current_user.trucks.build
  end

  # GET /trucks/1/edit
  def edit
  end

  # POST /trucks
  # POST /trucks.json
  def create
    @truck = current_user.trucks.build(truck_params)
    @truck[:secure] = true
    respond_to do |format|
      if @truck.save
        format.html { redirect_to trucks_path, notice: 'Truck was successfully created.' }
        format.json { render :index, status: :created, location: @truck }
      else
        format.html { render :new }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trucks/1
  # PATCH/PUT /trucks/1.json
  def update
    respond_to do |format|
      if @truck.update(truck_params)
        format.html { redirect_to trucks_path, notice: 'Truck was successfully updated.' }
        format.json { render :index, status: :ok, location: @truck }
      else
        format.html { render :edit }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trucks/1
  # DELETE /trucks/1.json
  def destroy
    @truck.update(secure: false)
    respond_to do |format|
      format.html { redirect_to trucks_url, notice: 'Truck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_truck
      @truck = Truck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def truck_params
      params.require(:truck).permit(:truck_no, :truck_driver, :driver_no, :day_start, :day_off)
    end
end
