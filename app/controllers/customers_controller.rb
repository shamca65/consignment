class CustomersController < ApplicationController
  include EventLogger

  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  #
  def index
    if params[:query]
      puts "*********** query time!"
      @customers = Customer.where('last_name LIKE ?', "%#{params[:query]}%")
    else
      puts "***********no query term"
      @customers = Customer.all
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
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
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

  def search
    puts "*********Searching mofo "
    response = Book.__elasticsearch__.search(
        query: {
            multi_match: {
                query: params[:query],
                fields: ['name', 'author.first_name', 'author.last_name', 'isbn']
            }
        }
    ).results

    render json: {
        results: response.results,
        total: response.total
    }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :phone, :query)
    end
end
