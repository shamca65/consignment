class ItemsController < ApplicationController
	require 'json'
  include EventLogger
  include TableTools

  skip_before_action :verify_authenticity_token
  before_action :set_item, only: [:show, :edit, :update, :destroy]

	def donations
		@donationItems = Item.donation_items
		respond_to do |format|
			format.html { render :pickups }
        #format.json {render :json => indexJSON}
		end
  end

  def updatedonations
    respond_to do |format|
      format.json {render :json => @pickupMoveIDs, :status => 200}
    end
    donated_item_ids = extract_ids(params)
    Item.where(:id =>donated_item_ids).update_all(owner: 'store', item_status: 'mtd')
  end

  def takein
    @item = Item.new
  end

  def addtakein
    if @item.save!
    	respond_to do |format|
			 format.html { render :takein }
      end
    end
  end

  # GET /items
  # GET /items.json
  def index
    @items = Item.all.order(id: :desc)
  end

  # GET /items/1
  # GET /items/1.json
  def show
    set_item
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    set_item
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save!
        if params[:mode] == 'takein' && params[:customer_id].present?
          t_path = "/items/takein/"+ params[:customer_id].to_s
          format.html { redirect_to t_path, notice: 'Item was successfully created.' }
        else
          format.html { redirect_to customers_path, notice: 'The Customer ID was missing - takein could not be saved' }
        end
        #format.js { redirect_to items_path, notice: 'Item was successfully jonified.' }
        #format.json { render :show, status: :created, location: @item }
      else
        #creating an item record unrelated to a takein
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to items_path, success: "Customer record updated"}
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:size, :description, :price, :customer_id,
                                   :item_type, :pickup_date, :gender, :notes,
                                   :owner, :item_status, :item_note, :tax_exempt
      )
		end

	def indexJSON
		return @pickupItems.as_json(
				only: [
						:id
				])
	end
end
