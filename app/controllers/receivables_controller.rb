class ReceivablesController < ApplicationController
  before_action :set_receivable, only: [:show, :edit, :update, :destroy]

  # GET /receivables
  # GET /receivables.json
  def index
    @receivables = Receivable.all
  end

  # GET /receivables/1
  # GET /receivables/1.json
  def show
  end

  # GET /receivables/new
  def new
    @receivable = Receivable.new
  end

  # GET /receivables/1/edit
  def edit
  end

  # POST /receivables
  # POST /receivables.json
  def create
    @receivable = Receivable.new(receivable_params)

    respond_to do |format|
      if @receivable.save
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
    @receivable.destroy
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
      params.require(:receivable).permit(:company_id, :receiveable_amount, :check_date, :transaction_date, :remarks)
    end
end
