class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_host, only: [:setting, :edit, :update, :destroy, :newe]
  before_action :check_user_agent_for_mobile

  # GET /articles
  # GET /articles.json
  def index
    if params[:tag]
      @articles= Article.tagged_with(params[:tag]).page params[:page]
    else
      @articles = Article.page params[:page]
    end
  end

  

  def check_user_agent_for_mobile
    ua = request.user_agent
    if(ua.include?('Mobile') || ua.include?('Android'))
      @mobile = true
    end
  end

  def setting
    @articles = Article.all
  end

  def authenticate_host
    if @current_user == nil
      redirect_to("/login")
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
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
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
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
    @article.destroy
    respond_to do |format|
      format.html { redirect_to "/articles/setting", notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title,:content,:tag,:image,:heading,:name, :skill_list)
    end

  
end
