class ChangeUserColumns < ActiveRecord::Migration[5.2]
  def change

    change_column :users, :name, :string, null: false, default:'',limit:100
    change_column :users, :sex, :integer, null: false, default:0
    change_column :users, :img_name, :string, null: false

  end
end
