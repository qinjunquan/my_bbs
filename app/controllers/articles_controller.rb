class ArticlesController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index] 

  def index
#	@articles ＝ Article.page(params[:page]).per(25)
	@articles = Article.order(:id).page(params[:page])
	@users = User.all
  end

  def user_index
	@articles = Article.where(:user_id => current_user.id).page(params[:page])
  end

  def new 
	@article = Article.new
  end

  def create
	@article = Article.new(article_params)
	@article.user_id = current_user.id
	if @article.save
	  redirect_to article_path(@article)
	else
	  redirect_to new_article_path
	end
  end

  def show
	@article = Article.find(params[:id])
  end

  def edit
	@article = Article.find(params[:id])
  end

  def update
	@article = Article.find(params[:id])
	if @article.update(article_params)
	  redirect_to article_path(@article)
	else
	  redirect_to edit_article_path
	end
  end

  def destroy
	@article = Article.find(params[:id])
	@article.destroy
	redirect_to user_articles_path
  end

  private
	def article_params
	  params.require(:article).permit(:title, :content)
	end

end
