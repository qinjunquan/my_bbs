class AddNickNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :nick_name, :string , null:false , default:""
	add_index :users, :nick_name , unique:true
  end
end
