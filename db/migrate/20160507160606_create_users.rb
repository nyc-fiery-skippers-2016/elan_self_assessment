class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do | table |
      table.string :name, null: false
      table.string :email, null: false
      table.string :username, null: false, index: true
      table.string :password_digest, null: false
      table.timestamps( null: false )
    end
  end
end
