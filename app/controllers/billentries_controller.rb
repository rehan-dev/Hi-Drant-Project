class BillentriesController < ApplicationController
  before_action :set_billentry, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /billentries
  # GET /billentries.json
  def index
    @billentries = Billentry.all.where(secure: true, user_id: current_user.id)
  end

  # GET /billentries/1
  # GET /billentries/1.json
  def show
  end

  # GET /billentries/new
  def new
    @billentry = current_user.billentries.build
  end

  # GET /billentries/1/edit
  def edit
  end

  # POST /billentries
  # POST /billentries.json
  def create
    @billentry = current_user.billentries.build(billentry_params)
    @billentry[:secure] = true
    bill_amount = Company.where(id: @billentry[:company_id]).select(:total_bill_amount)
    comp_bill_amount = bill_amount[0].total_bill_amount + @billentry[:total_amount]

    respond_to do |format|
      if @billentry.save
        Company.where(id: @billentry[:company_id]).update(total_bill_amount: comp_bill_amount)
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
        Company.where(id: @billentry[:company_id]).update(total_bill_amount: @billentry[:total_amount])
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
    @billentry.update(secure: false)
    respond_to do |format|
      format.html { redirect_to billentries_url, notice: 'Billentry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def company_data
    company_id = params[:data_id] || []
    data = Company.where(secure: true, user_id: current_user.id ,id: company_id)
    if request.xhr?
      render :json => {
          :company_data => data
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_billentry
      @billentry = Billentry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def billentry_params
      params.require(:billentry).permit(:truck_no, :address, :time_arrive, :time_departure, :current_date, :supply_rate, :company_id, :capacity, :previous_balance, :total_amount, :received_amount)
    end
end
