class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uid, null: false
      t.string :name
      t.string :email
      t.string :access_token
      t.time :expiry_time
      
      t.timestamps null: false
    end
    add_index :users, :uid
  end
end
  