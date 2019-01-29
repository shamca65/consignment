class ItemsController < ApplicationController
	require 'json'
  include EventLogger

	skip_before_action :verify_authenticity_token
  before_action :set_item, only: [:show, :edit, :update, :destroy]

	def pickups
		@pickupItems = Item.pickup_items
		respond_to do |format|
			format.html { render :pickups }
			format.json {render :json => indexJSON}
		end
	end

	def updatepickups
		json_root = '_json'
		json_id_field = 'Item No.'
		pickup_ids = []

		respond_to do |format|
			format.json {render :json => @pickupMoveIDs, :status => 200}
		end

		# traverse json from the root to pick out item IDs to update
		params[json_root].each do |k|
			k.each do |l, m|
				if l == json_id_field
						# TODO - checking/validation on 'm'
						pickup_ids.push(m.to_i)
				end
			end
		end

		#MovePickupsService(pickup_ids).call
		tmp = MovePickupsService.new(pickup_ids).call
		#pp tmp
	end



  # GET /items
  # GET /items.json
  def index
    add_breadcrumb "index", items_path, :title => "Back to the Index"
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to items_path, notice: 'Item was successfully created.' }
        format.js { redirect_to items_path, notice: 'Item was successfully jonified.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
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
                                   :item_type, :pickup_date, :gender, :notes
      )
		end

	def getIDsFromJSON

		#out=JSON.parse(data)
		#flash[:notice] = 'json data : ' + out
	end

	def indexJSON
		return @pickupItems.as_json(
				only: [
						:id,
						:description,
						:size,
						:gender
				])
	end
end
