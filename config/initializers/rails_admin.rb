#encoding: utf-8
RailsAdmin.config do |config|
  config.included_models = [
	User, Article , Comment, UserCommentLikeShip
  ]
  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
	redirect_to main_app.root_path unless warden.user.role == "admin"
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  Navigation = {
	'UserManage' => '用户管理',
	'ArticleManage' => '文章管理',
	'CommentManage' => '评论管理',
	'LikeManage' => '用户评论点赞管理'
  }

  config.model User do 
	navigation_label Navigation['UserManage']
	#
	#list do
	#  fields :nick_name, :email
    #  fields :avatar do 
	#	label "头像"
	#  end 
	#  fields :created_at do 
	#	label "注册时间"
	#  end
    #  fields :sign_in_count do 
	#	label "登录次数"
	#  end
	#  fields :last_sign_in_at do 
	#	label "最近登录"
	 # end
	#end
	list do
	  #search_fields :nick_name, :email
	  fields :nick_name, :email, :avatar, :created_at, :sign_in_count, :last_sign_in_at
	end
	edit do
	  fields :nick_name, :email, :avatar, :created_at, :sign_in_count, :last_sign_in_at
	end
  end

  config.model Article do
	navigation_label Navigation['ArticleManage']
	list do
	  fields :id, :title, :content, :user, :created_at, :updated_at 
	end
	#edit do
	#  fields :id, :title, :content, :user, :created_at, :updated_at 
	#end
  end

  config.model Comment do 
	navigation_label Navigation['CommentManage']
  end

  config.model UserCommentLikeShip do 
	navigation_label Navigation['LikeManage']
	list do
	  fields :comment, :user ,:created_at
	end
	edit do
	  fields :comment_id, :user_id
	end
  end

end
