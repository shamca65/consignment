class SaleItemsController < ApplicationController
  include TableTools
  include EventLogger
  require 'json'

  skip_before_action :verify_authenticity_token
  before_action :set_sale_item, only: [:show, :edit, :update, :destroy]

  # GET /sale_items
  # GET /sale_items.json
  def index
    @sale_items = Item.items_for_sale
  end

  # GET /sale_items/1
  # GET /sale_items/1.json
  def show
  end

  # GET /sale_items/new
  def new
    @sale_item = SaleItem.new
  end

  # GET /sale_items/1/edit
  def edit
  end

  def commit_sale
    sale_items_array = params['_json']
    this_order_num = get_order_no

    if sale_items_array.length > 0
      sale_item_recs = build_sale_item_recs(sale_items_array, this_order_num)
      SaleItem.create(sale_item_recs)
      #
      Item.where(:id =>sale_items_array).update_all(item_status: 'sold', sale_date: Date.today)
    end

    respond_to do |format|
      format.json {render :json => @sale_items, :status => 200}
    end
  end

  # POST /sale_items
  # POST /sale_items.json
  def create
    respond_to do |format|
      if @sale_item.save
        format.html { redirect_to @sale_item, notice: 'Sale item was successfully created.' }
        format.json { render :show, status: :created, location: @sale_item }
      else
        format.html { render :new }
        format.json { render json: @sale_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sale_items/1
  # PATCH/PUT /sale_items/1.json
  def update
    respond_to do |format|
      if @sale_item.update(sale_item_params)
        format.html { redirect_to @sale_item, notice: 'Sale item was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale_item }
      else
        format.html { render :edit }
        format.json { render json: @sale_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sale_items/1
  # DELETE /sale_items/1.json
  def destroy
    @sale_item.destroy
    respond_to do |format|
      format.html { redirect_to sale_items_url, notice: 'Sale item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_sale_record(this_order_num)
    sale_rec  = SaleSummary.create(:order_no=>this_order_num)
    return sale_rec.id
  end

  private

  def build_sale_item_recs(sale_items_array, this_order_num)
    # build an array of sale_items records
    num_items = sale_items_array.length
    sale_item_recs = []
    sale_date = Date.today
    sale_clerk = 'sales clerk'
    sale_summary = create_sale_record(this_order_num)
    n = 0

    while n < num_items
      @item_rec = nil
      @item_rec = Item.find sale_items_array[n]
      item_data = {
          :sale_summaries_id=> sale_summary,
          :item_id => @item_rec.id,
          :item_price => @item_rec.price,
          :order_no => this_order_num,
          :sale_date => sale_date,
          :clerk => sale_clerk
      }
      sale_item_recs[n] = item_data
      n = n+1
    end
    #
    this_sale_total = SaleItem.where({ order_no: this_order_num }).sum(:item_price)
    SaleSummary.where(:id=>sale_summary).update(:sale_total=>this_sale_total, :sale_date=>sale_date)
    log_event("Sale record",sale_summary,this_order_num.to_s)
    #
    return sale_item_recs
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_item
      @sale_item = SaleItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_item_params
      params.require('sale_items').permit(:p1,
                                          :sale_summaries_id, :item_id,
                                          :item_price, :order_no, :sale_date,
                                          :clerk)
    end

end
