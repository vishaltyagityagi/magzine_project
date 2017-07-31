class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]

  # GET /articles
  # GET /articles.json
  def index
    @articles = @magzine.articles.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @magzine = Magzine.find(params[:magzine_id])
    @article = @magzine.articles.new
  end

  # GET /articles/1/edit
  def edit
    @magzine = Magzine.find(params[:magzine_id])
    @article = @magzine.articles.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @magzine = Magzine.find(params[:magzine_id])
    @article = @magzine.articles.new(article_params)
    @article.user_id = current_user.id

    respond_to do |format|
      if @article.save
        format.html { redirect_to magzine_article_path(@magzine, @article), notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    @magzine = Magzine.find(params[:magzine_id])
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to magzine_article_path(@magzine, @article), notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @magzine = Magzine.find(params[:magzine_id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to magzine_url(@magzine), notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :body, :author, :magzine_id)
    end
end
