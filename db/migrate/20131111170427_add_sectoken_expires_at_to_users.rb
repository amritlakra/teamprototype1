class AddSectokenExpiresAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sectoken_expires_at, :datetime
  end
end
