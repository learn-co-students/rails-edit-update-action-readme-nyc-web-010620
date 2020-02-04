class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create!(article_params2)
    redirect_to article_path(@article)
  end

  # You always have to pass in an instance in edit controller action
  def edit 
    @article = Article.find_by_id(params[:id])
  end

  def update
    article = Article.find_by_id(params[:id])
    article.update(article_params)
    redirect_to article_path(article)
  end

  private
  
  def article_params
    params.require(:article).permit(:title, :description)
  end
  def article_params2
    params.permit(:title, :description)
  end
end
