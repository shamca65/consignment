class SaleSummariesController < ApplicationController
  before_action :set_sale_summary, only: [:show, :edit, :update, :destroy]

  # GET /sale_summaries
  # GET /sale_summaries.json
  def index
    @sale_summaries = SaleSummary.joins(:sale_items)
  end

  # GET /sale_summaries/1
  # GET /sale_summaries/1.json
  def show
  end

  # GET /sale_summaries/new
  def new
    @sale_summary = SaleSummary.new
  end

  # GET /sale_summaries/1/edit
  def edit
  end

  # POST /sale_summaries
  # POST /sale_summaries.json
  def create
    @sale_summary = SaleSummary.new(sale_summary_params)

    respond_to do |format|
      if @sale_summary.save
        format.html { redirect_to @sale_summary, notice: 'Sale summary was successfully created.' }
        format.json { render :show, status: :created, location: @sale_summary }
      else
        format.html { render :new }
        format.json { render json: @sale_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sale_summaries/1
  # PATCH/PUT /sale_summaries/1.json
  def update
    respond_to do |format|
      if @sale_summary.update(sale_summary_params)
        format.html { redirect_to @sale_summary, notice: 'Sale summary was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale_summary }
      else
        format.html { render :edit }
        format.json { render json: @sale_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sale_summaries/1
  # DELETE /sale_summaries/1.json
  def destroy
    @sale_summary.destroy
    respond_to do |format|
      format.html { redirect_to sale_summaries_url, notice: 'Sale summary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_summary
      @sale_summary = SaleSummary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_summary_params
      params.require(:sale_summary).permit(:sale_total, :order_no, :sale_date)
    end
end
