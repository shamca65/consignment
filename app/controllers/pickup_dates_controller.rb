class PickupDatesController < ApplicationController
  before_action :set_pickup_date, only: [:show, :edit, :update, :destroy]

  # GET /pickup_dates
  # GET /pickup_dates.json
  def index
    @pickup_dates = PickupDate.all
  end

  # GET /pickup_dates/1
  # GET /pickup_dates/1.json
  def show
  end

  # GET /pickup_dates/new
  def new
    @pickup_date = PickupDate.new
  end

  # GET /pickup_dates/1/edit
  def edit
  end

  # POST /pickup_dates
  # POST /pickup_dates.json
  def create
    @pickup_date = PickupDate.new(pickup_date_params)

    respond_to do |format|
      if @pickup_date.save
        format.html { redirect_to @pickup_date, notice: 'Pickup date was successfully created.' }
        format.json { render :show, status: :created, location: @pickup_date }
      else
        format.html { render :new }
        format.json { render json: @pickup_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pickup_dates/1
  # PATCH/PUT /pickup_dates/1.json
  def update
    respond_to do |format|
      if @pickup_date.update(pickup_date_params)
        format.html { redirect_to @pickup_date, notice: 'Pickup date was successfully updated.' }
        format.json { render :show, status: :ok, location: @pickup_date }
      else
        format.html { render :edit }
        format.json { render json: @pickup_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pickup_dates/1
  # DELETE /pickup_dates/1.json
  def destroy
    @pickup_date.destroy
    respond_to do |format|
      format.html { redirect_to pickup_dates_url, notice: 'Pickup date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pickup_date
      @pickup_date = PickupDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pickup_date_params
      params.require(:pickup_date).permit(:current_pu_date)
    end
end
