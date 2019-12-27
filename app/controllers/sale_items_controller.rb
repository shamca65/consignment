class SaleItemsController < ApplicationController
  include TableTools
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
    # TODO wrap in try/catch

    sale_items_array = params['_json']

    puts("sale_items_array[0] " + sale_items_array[0])

    sale_item_recs = []
    num_items = sale_items_array.length
    this_order_no = get_order_no
    sale_date = Date.today
    sale_clerk = 'sale clerk'
    n = 0

    while n < num_items
      @item_rec = Item.find sale_items_array[n]
      puts ("item price: " + @item_rec.price.to_s)
      item_data = {
          :item_id => @item_rec.id,
          :item_price => @item_rec.price,
          :order_no => this_order_no,
          :sale_date => sale_date,
          :clerk => sale_clerk
      }
      @item_rec = nil

      sale_item_recs[n] = item_data
      n = n+1
    end

    SaleItem.create(sale_item_recs)

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_item
      @sale_item = SaleItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_item_params
      params.require('sale_items').permit(:p1)
    end

end
