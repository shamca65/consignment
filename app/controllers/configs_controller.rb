class ConfigsController < ApplicationController
  before_action :set_config, only: [:show, :update, :destroy]

  # GET /configs
  # GET /configs.json
  def index
    @configs = Config.all
  end

  # GET /configs/1
  # GET /configs/1.json
  def show
  end

  # GET /configs/new
  def new
    @config = Config.new
  end

  # GET /configs/1/edit
  def edit
    @config = get_by_slug(params[:id])
    respond_to do |format|
      if @config
        format.html { render :edit, notice: 'Config was successfully created.' }
      else
        format.html { render :new, notice: 'There was an error saving the configuration data.'}
      end
    end
  end

  def create
    @config = Config.new(config_params)
    respond_to do |format|
      if @config.save
        format.html { redirect_to configs_path, notice: 'Config was successfully created.' }
      else
        format.html { render :new, notice: 'There was an error saving the configuration data.'}
      end
    end
  end

  # PATCH/PUT /configs/1
  # PATCH/PUT /configs/1.json
  def update
    respond_to do |format|
      if @config.update(config_params)
        format.html { redirect_to configs_path, notice: 'Config was successfully updated.' }
        format.json { render :show, status: :ok, location: @config }
      else
        format.html { render :edit, notice: 'Value was NOT successfully updated.'  }
        format.json { render json: @config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /configs/1
  # DELETE /configs/1.json
  def destroy
    @config.destroy
    respond_to do |format|
      format.html { redirect_to configs_url, notice: 'Config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_config
      @config = Config.find(params[:id])
    end

  def get_by_slug slug
    Config.find_by_slug slug
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def config_params
      params.require(:config).permit(:date, :value, :name, :slug)
    end

end
