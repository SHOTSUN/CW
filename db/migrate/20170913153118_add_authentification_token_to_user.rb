class AddAuthentificationTokenToUser < ActiveRecord::Migration[5.0]
  def self.up
      add_column :users, :confirmation_token, :string
      add_column :users, :confirmed_at, :datetime
      add_column :users, :confirmation_sent_at, :datetime
      add_column :users, :unconfirmed_email, :string # add it Only if are using reconfirmable

      add_index :users, :confirmation_token, :unique => true
    end

    def self.down
      remove_index  :admin_users, :confirmation_token

      remove_column :admin_users, :unconfirmed_email
      remove_column :admin_users, :confirmation_sent_at
      remove_column :admin_users, :confirmed_at
      remove_column :admin_users, :confirmation_token
    end
end
