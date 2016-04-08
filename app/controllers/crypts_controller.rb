class CryptsController < ApplicationController
  include CryptsHelper
  before_action :set_crypt, only: [:show, :edit, :update, :destroy, ]
  # GET /crypts
  # GET /crypts.json
  def index
    @crypts = Crypt.all
  end

  # GET /crypts/1
  # GET /crypts/1.json
  def show
  end

  def main
    @crypt = Crypt.new
  end

  # GET /crypts/new
  def new
    @crypt = Crypt.new
  end

  # GET /crypts/1/edit
  def edit
  end

  # POST /crypts
  # POST /crypts.json
  def create
    @crypt = Crypt.new(crypt_params)
    respond_to do |format|
      if @crypt.save
        format.html { redirect_to @crypt, notice: 'Crypt was successfully created.' }
        format.json { render :show, status: :created, location: @crypt }
      else
        format.html { render :new }
        format.json { render json: @crypt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crypts/1
  # PATCH/PUT /crypts/1.json
  def update
    respond_to do |format|
      if @crypt.update(crypt_params)
        format.html { redirect_to @crypt, notice: 'Crypt was successfully updated.' }
        format.json { render :show, status: :ok, location: @crypt }
      else
        format.html { render :edit }
        format.json { render json: @crypt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crypts/1
  # DELETE /crypts/1.json
  def destroy
    @crypt.destroy
    respond_to do |format|
      format.html { redirect_to crypts_url, notice: 'Crypt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crypt
      @crypt = Crypt.find(params[:id])
      @char_count = Hash.new
      ('a'..'z').to_a.each do |crypt|
        @char_count[crypt.upcase] = Caesar.new(@crypt.shift).decrypt(@crypt.decrypt).count(crypt)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crypt_params
      params.require(:crypt).permit(:decrypt, :encrypt, :shift)
    end
end
