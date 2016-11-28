class ReceivablesController < ApplicationController
  before_action :set_receivable, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /receivables
  # GET /receivables.json
  def index
    @receivables = Receivable.all.where(secure: true, user_id: current_user.id)
  end

  # GET /receivables/1
  # GET /receivables/1.json
  def show
  end

  # GET /receivables/new
  def new
    @receivable = current_user.receivables.build
  end

  # GET /receivables/1/edit
  def edit
  end

  # POST /receivables
  # POST /receivables.json
  def create
    @receivable = current_user.receivables.new(receivable_params)
    @receivable[:secure] = true
    received_amount = Company.where(id: @receivable[:company_id]).select(:received_amount)
    comp_received_amount = received_amount[0].received_amount + @receivable[:receiveable_amount]

    bill_received_amount = Billentry.where(id: @receivable[:bill_no]).select(:received_amount)
    addbill_received_amount = (bill_received_amount[0].received_amount.present? ? bill_received_amount[0].received_amount : 0) + (@receivable[:receiveable_amount].present? ? @receivable[:receiveable_amount] : 0)
    respond_to do |format|
      if @receivable.save
        Company.where(id: @receivable[:company_id]).update(received_amount: comp_received_amount)
        Billentry.where(id: @receivable[:bill_no]).update(received_amount: addbill_received_amount)
        format.html { redirect_to @receivable, notice: 'Receivable was successfully created.' }
        format.json { render :show, status: :created, location: @receivable }
      else
        format.html { render :new }
        format.json { render json: @receivable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receivables/1
  # PATCH/PUT /receivables/1.json
  def update
    respond_to do |format|
      if @receivable.update(receivable_params)
        Company.where(id: @receivable[:company_id]).update(received_amount: @receivable[:receiveable_amount])
        Billentry.where(id: @receivable[:bill_no]).update(received_amount: @receivable[:receiveable_amount])
        format.html { redirect_to @receivable, notice: 'Receivable was successfully updated.' }
        format.json { render :show, status: :ok, location: @receivable }
      else
        format.html { render :edit }
        format.json { render json: @receivable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receivables/1
  # DELETE /receivables/1.json
  def destroy
    @receivable.update(secure: true)
    respond_to do |format|
      format.html { redirect_to receivables_url, notice: 'Receivable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receivable
      @receivable = Receivable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receivable_params
      params.require(:receivable).permit(:company_id, :receiveable_amount, :check_date, :transaction_date, :remarks, :bill_no)
    end
end
