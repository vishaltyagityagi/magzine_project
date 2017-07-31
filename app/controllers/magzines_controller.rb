class MagzinesController < ApplicationController
  before_action :set_magzine, only: [ :edit, :update, :destroy]
  before_action :check_user, except: [:show, :new, :create, :all_magzines, :index]
  before_action :authenticate_user!,  only: [:new, :edit, :update, :destroy]

  # GET /magzines
  # GET /magzines.json

  def index
    @magzines = current_user.magzines
  end

  def all_magzines
    @magzines = Magzine.all
  end



  # GET /magzines/1
  # GET /magzines/1.json
  def show
    @magzine = Magzine.find(params[:id])
    @articles = @magzine.articles
  end

  # GET /magzines/new
  def new
    @magzine = Magzine.new
  end

  # GET /magzines/1/edit
  def edit
  end

  # POST /magzines
  # POST /magzines.json
  def create
    @magzine = current_user.magzines.new(magzine_params)

    respond_to do |format|
      if @magzine.save
        format.html { redirect_to @magzine, notice: 'Magzine was successfully created.' }
        format.json { render :show, status: :created, location: @magzine }
      else
        format.html { render :new }
        format.json { render json: @magzine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /magzines/1
  # PATCH/PUT /magzines/1.json
  def update
    respond_to do |format|
      if @magzine.update(magzine_params)
        format.html { redirect_to @magzine, notice: 'Magzine was successfully updated.' }
        format.json { render :show, status: :ok, location: @magzine }
      else
        format.html { render :edit }
        format.json { render json: @magzine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /magzines/1
  # DELETE /magzines/1.json
  def destroy
    @magzine.destroy
    respond_to do |format|
      format.html { redirect_to magzines_url, notice: 'Magzine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_magzine
      @magzine = current_user.magzines.find(params[:id])
    end

    def check_user
      @magzine = current_user.magzines.find(params[:id])
      redirect_to magzines_url , notice: "You are not authorized to edit this magzine" if @magzine.user_id != current_user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def magzine_params
      params.require(:magzine).permit(:title, :description, :user_id)
    end
end
