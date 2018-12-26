class CustomersController < ApplicationController
  include EventLogger
  protect_from_forgery except: :index

  before_action :set_customer, only: [:show, :edit, :update, :destroy, :items, :takein ]

  @provs = Customer::PROVINCES.map{|k,v| [k.to_s,v]}

  def takein
    @item = @customer.items.new
  end

  def search_results
    query = params[:search_customers].presence && params[:search_customers][:query]

    if query
      puts "***************** query : " + params[:search_customers][:query].to_s
      @customers = Customer.search(query)
      puts "Query count : " + Customer.search(query).size.to_s
    end

  end

  def items
      puts "***************** customer#customer_items : " + params[:id].to_s
      @customerItems = Item.customer_items(params[:id])
      puts "********* customer item size: " + Item.customer_items(params[:id]).count.to_s
      respond_to do |format|  ## Add this
        format.html { render :'customers/Items', notice: 'Showing rhinos' }
        end
  end

  # GET /customers
  # GET /customers.json
  #
  def index
      @customers = Customer.all
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
    if @customer.save
      redirect_to customers_path, notice: 'Account was created successfully'
    else
      render :new, notice: 'Account was not saved'
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update

    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer}
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit}
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
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
end