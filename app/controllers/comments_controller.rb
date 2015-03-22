class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
	@article = Article.find(params[:id])
	@comment = @article.comments.create(:user_id => current_user.id, :article_id => params[:id], :content => params[:content])
    redirect_to article_path(@article) 
  end

  def destroy
	@comment = Comment.find(params[:id])
	@comment.destroy if @comment.present?
	render :json => { :success => true }
  end
end
