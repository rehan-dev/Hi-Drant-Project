class BillentriesController < ApplicationController
  before_action :set_billentry, only: [:show, :edit, :update, :destroy]

  # GET /billentries
  # GET /billentries.json
  def index
    @billentries = Billentry.all
  end

  # GET /billentries/1
  # GET /billentries/1.json
  def show
  end

  # GET /billentries/new
  def new
    @billentry = Billentry.new
  end

  # GET /billentries/1/edit
  def edit
  end

  # POST /billentries
  # POST /billentries.json
  def create
    @billentry = Billentry.new(billentry_params)

    respond_to do |format|
      if @billentry.save
        format.html { redirect_to @billentry, notice: 'Billentry was successfully created.' }
        format.json { render :show, status: :created, location: @billentry }
      else
        format.html { render :new }
        format.json { render json: @billentry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /billentries/1
  # PATCH/PUT /billentries/1.json
  def update
    respond_to do |format|
      if @billentry.update(billentry_params)
        format.html { redirect_to @billentry, notice: 'Billentry was successfully updated.' }
        format.json { render :show, status: :ok, location: @billentry }
      else
        format.html { render :edit }
        format.json { render json: @billentry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /billentries/1
  # DELETE /billentries/1.json
  def destroy
    @billentry.destroy
    respond_to do |format|
      format.html { redirect_to billentries_url, notice: 'Billentry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_billentry
      @billentry = Billentry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def billentry_params
      params.require(:billentry).permit(:truck_no, :company_name, :address, :time_arrive, :time_departure, :current_date, :supply_rate, :weight, :previous_amount, :current_total_amount, :recieved_amount, :net_balance, :total_amount)
    end
end
