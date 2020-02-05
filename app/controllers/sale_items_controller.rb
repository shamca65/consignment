class SaleItemsController < ApplicationController
  include TableTools
  include EventLogger

  skip_before_action :verify_authenticity_token
  before_action :set_sale_item, only: [:show, :edit, :update, :destroy]

  def search
    @items = Item.ransack(id_str_cont: params[:q]).result(distinct: false)
    respond_to do |format|
      format.html {}
      format.json { @items.limit(10) }
    end
  end

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
    #array of item ids from sale items view
    sale_items_array = params['_json']
    @this_order_num = get_order_no
    @sale_date = Date.today

    if sale_items_array.length > 0
      Item.where(:id =>sale_items_array).update_all(item_status: 'sold', sale_date: @sale_date)
      sale_summary_rec  = SaleSummary.create(:order_no=>@this_order_num, :sale_date=>@sale_date)
      sale_item_recs = build_sale_item_recs(sale_items_array, sale_summary_rec.id)
      SaleItem.create(sale_item_recs)
      @totals_data = get_item_subtotals(sale_items_array)
      SaleSummary.where(:order_no => @this_order_num).update(
          :sale_total => @totals_data[:sale_total_extended],
          :tax_a_total => @totals_data[:tax_extended_a],
          :tax_b_total => @totals_data[:tax_extended_b],
          :items_total => @totals_data[:items_total],
      )
    end

    data = { :order_no => @this_order_num }

    respond_to do |format|
      format.json {render :json => data, :status => 200}
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

  def clean_up_bad_sale

  end

  def destroy
    @sale_item.destroy
    respond_to do |format|
      format.html { redirect_to sale_items_url, notice: 'Sale item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def get_item_subtotals(sale_items_array)
    @item_recs = nil
    @item_recs = Item.find sale_items_array
    tax_rate_a = $tax_rate_a
    tax_rate_b = $tax_rate_b
    items_total = @item_recs.sum {|h| h[:price]}
    tax_extended_a = items_total * tax_rate_a
    tax_extended_b = items_total * tax_rate_b
    sale_total_extended = items_total + tax_extended_a + tax_extended_b
    totals_data = {
        :sale_total_extended=> sale_total_extended,
        :tax_extended_a => tax_extended_a,
        :tax_extended_b => tax_extended_b,
        :items_total => items_total,
      }
    return totals_data
  end

  def get_sale_total(order_no)
    sale_item = SaleItem.find_by_order_no order_no
    tax_rate_a = sale_item.tax_rate_a
    tax_rate_b = sale_item.tax_rate_b
    item_total = SaleItem.where({ order_no: order_no}).sum(:item_price)
    this_sale_total = item_total + (item_total * tax_rate_a) + (item_total * tax_rate_b)
    return this_sale_total
  end

  def build_sale_item_recs(sale_items_array, sale_summaries_id)
      # build an array of sale_items records
      num_items = sale_items_array.length
      sale_item_recs = []
      n = 0
      while n < num_items
        @item_rec = nil
        @item_rec = Item.find sale_items_array[n]
          item_data = {
            :sale_summaries_id=> sale_summaries_id,
            :item_id => @item_rec.id,
            :item_price => @item_rec.price,
            :order_no => @this_order_num,
            :sale_date => @sale_date,
            :clerk => $cash_clerk,
            :tax_rate_a => $tax_rate_a,
            :tax_rate_b => $tax_rate_b,
          }
          sale_item_recs[n] = item_data
          n = n+1
        end
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
                                        :clerk, :q)
  end
end
