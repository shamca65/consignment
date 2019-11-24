class TakeInsController < ApplicationController
  before_action :set_take_in, only: [:show, :edit, :update, :destroy]

  # GET /take_ins
  # GET /take_ins.json
  def index
    @take_ins = TakeIn.all
  end

  # GET /take_ins/1
  # GET /take_ins/1.json
  def show
  end

  # GET /take_ins/new
  def new
    @take_in = TakeIn.new
  end

  # GET /take_ins/1/edit
  def edit
  end

  # POST /take_ins
  # POST /take_ins.json
  def create
    @take_in = TakeIn.new(take_in_params)

    respond_to do |format|
      if @take_in.save
        format.html { redirect_to @take_in, notice: 'Take in was successfully created.' }
        format.json { render :show, status: :created, location: @take_in }
      else
        format.html { render :new }
        format.json { render json: @take_in.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /take_ins/1
  # PATCH/PUT /take_ins/1.json
  def update
    respond_to do |format|
      if @take_in.update(take_in_params)
        format.html { redirect_to @take_in, notice: 'Take in was successfully updated.' }
        format.json { render :show, status: :ok, location: @take_in }
      else
        format.html { render :edit }
        format.json { render json: @take_in.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /take_ins/1
  # DELETE /take_ins/1.json
  def destroy
    @take_in.destroy
    respond_to do |format|
      format.html { redirect_to take_ins_url, notice: 'Take in was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_take_in
      @take_in = TakeIn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def take_in_params
      params.require(:take_in).permit(:customer_id, :item_id)
    end
end
