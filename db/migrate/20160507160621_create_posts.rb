class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do | table |
      table.string :title, null: false
      table.references :topic, null: false, index: true
      table.references :user, null: false, index: true
      table.timestamps( null: false )
    end
  end
end
