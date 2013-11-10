class AddSectokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sectoken, :string
  end
end
