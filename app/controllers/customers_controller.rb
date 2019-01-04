class CustomersController < ApplicationController
  include EventLogger
  protect_from_forgery except: :index

  before_action :set_customer, only: [:show, :edit, :update, :destroy, :items, :takein ]

  def takein
    @item = @customer.items.new
  end

  def search_results
    query = params[:search_customers].presence && params[:search_customers][:query]

    if query
      @customers = Customer.search(query)
    end
  end

  def items
      @customerItems = Item.customer_items(params[:id])
      respond_to do |format|  ## Add this
        format.html {}
        end
  end

  # GET /customers
  # GET /customers.json
  #
  def index
    respond_to do |format|
      @customers = Customer.all
      format.html
      format.json { render :json => indexJSON }
      end
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @customers = Customer.all
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    # whitelist params
    @customer = Customer.new(customer_params)
    respond_to do |format|
      if @customer.save
        format.html { redirect_to customers_path, flash[:success] = "Customer record was saved."}
        format.json { render :show, status: :ok, location: @customer }
        format.json { render :json => @objects.map(&:attributes) }
      else
        format.html { render :edit, flash[:error] = "Customer record was NOT saved."}
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html {redirect_to edit_customer_path}
        format.json { render json: @customer}

      else
        format.html { render :edit, flash[:error] = "Customer record was NOT updated."}
        format.js
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url,flash[:success] = "Customer record successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :phone, :query, :email,
      :street_address, :city, :acct_open_date, :agreement_status, :trans_type,
      :last_trans_date, :street_address2, :postal, :province)
    end

    def indexJSON

      return @customers.as_json(
        only: [
            :id,
            :full_name,
            :agreement_status,
            :phone,
            :email,
            :province
            ])
    end


end