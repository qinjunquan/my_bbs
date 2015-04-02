class UserCommentLikeShipsController < ApplicationController
  before_action :authenticate_user!

  def up_like_count
#	debugger
#	if user_signed_in?
#	  redirect_to new_user_session_path
#	else
	  if UserCommentLikeShip.where(:user_id => params[:user_id], :comment_id => params[:comment_id]).present?
	    render :json => { :is_up => false }
      else
	    @user_like = UserCommentLikeShip.create(:user_id => params[:user_id], :comment_id => params[:comment_id])
	    @comment = Comment.find(params[:comment_id])
	    @comment.like_count += 1
	    @comment.save
	    render :json => { :is_up => true }
	  end
#	end
  end

end
