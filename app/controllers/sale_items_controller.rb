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

    puts ">>>>>>>>>>>>>> commit_sale "

    respond_to do |format|
      format.json {render :json => @sale_items, :status => 200}
    end

    puts "selling_ids : " + params.inspect

    #myHash = JSON.parse(params, symbolize_names: true) #=> {key: :value}
    # puts ">>>>>>>>>>>>> params_list : " + params.inspect
    #------------------------
    # sale_items:
    #   item_id
    #   item_price
    #   order_no
    #   sale_date
    #   clerk

    #puts "blanked params : " + params.inspect
    #item_ids = extract_ids(params)
    #
    #
    # order no (julian timestamp?), payouts, item status, transactions
    # save sale item record
    this_order_no = get_order_no
    #puts (">>>>>>>>>>>>>>>>Order no : " + get_order_no.to_s)
    #puts (">>>>> num of items : " + item_ids.length.to_s)

    #@sale_item = SaleItem.new(sale_item_params)
    #@sale_item.save!
    #Item.where(:id =>item_ids).update_all(
    #    owner: 'end-user',
    #    order_no: '',
    #    item_status: 'sold',
    #)
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
      params.require(:sale_item).permit(:price).merge(order_no: this_order_no)
    end

end
