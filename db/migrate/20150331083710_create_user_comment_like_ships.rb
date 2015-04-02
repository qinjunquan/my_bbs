class CreateUserCommentLikeShips < ActiveRecord::Migration
  def change
    create_table :user_comment_like_ships do |t|
      t.references :user, index: true
      t.references :comment, index: true

      t.timestamps
    end
  end
end
